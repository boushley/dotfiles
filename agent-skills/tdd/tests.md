# Valuable Tests

## Test or verification?

A retained test protects an externally meaningful contract. It earns its maintenance cost when all of these are true:

- **Contract**: the failure would describe a regression a user or caller cares about, not a changed implementation detail.
- **Independent oracle**: the expected result comes from outside the artifact under test—a user example, protocol, published policy, prior release, or worked result.
- **Substitutability**: a different implementation that preserves the contract would still pass.
- **Sensitivity**: a plausible broken implementation makes the test fail without editing the test too.

Classify each requirement before writing a test:

- **Behavior test**: retain an automated test at a public seam when it passes the four checks above.
- **Tool verification**: run a compiler, validator, linter, build, migration rehearsal, or smoke check when the concern is whether an artifact is valid or deployable.
- **Inspection**: review a declarative value directly when that artifact is its only source of truth.

A spec or ticket asking for “coverage” does not by itself make a test valuable. Choose the evidence that protects the underlying contract.

### Mirrored tests

A **mirror** copies declarations from the artifact under test into assertions. It creates two places to update without supplying an independent oracle.

For example, a test that reads a Compose file and asserts the same image, port, environment, and volume values written in that file is a mirror. Validate its syntax with the Compose tool. If deployment behavior is risky enough to retain coverage, start the service through its supported deployment interface and assert observable behavior such as reachability, configuration override, or persistence across replacement.

Exact configuration assertions are valuable only when the expected values come from a separate authoritative policy. Compatibility fixtures should likewise come from a real prior release or published contract, not a historical state invented solely to satisfy a test requirement.

## Good Tests

**Integration-style**: Test through real interfaces, not mocks of internal parts.

```typescript
// GOOD: Tests observable behavior
test("user can checkout with valid cart", async () => {
  const cart = createCart();
  cart.add(product);
  const result = await checkout(cart, paymentMethod);
  expect(result.status).toBe("confirmed");
});
```

Characteristics:

- Tests behavior users/callers care about
- Uses public API only
- Survives internal refactors
- Describes WHAT, not HOW
- One logical assertion per test

## Bad Tests

**Implementation-detail tests**: Coupled to internal structure.

```typescript
// BAD: Tests implementation details
test("checkout calls paymentService.process", async () => {
  const mockPayment = jest.mock(paymentService);
  await checkout(cart, payment);
  expect(mockPayment.process).toHaveBeenCalledWith(cart.total);
});
```

Red flags:

- Mocking internal collaborators
- Testing private methods
- Asserting on call counts/order
- Test breaks when refactoring without behavior change
- Test name describes HOW not WHAT
- Verifying through external means instead of interface

```typescript
// BAD: Bypasses interface to verify
test("createUser saves to database", async () => {
  await createUser({ name: "Alice" });
  const row = await db.query("SELECT * FROM users WHERE name = ?", ["Alice"]);
  expect(row).toBeDefined();
});

// GOOD: Verifies through interface
test("createUser makes user retrievable", async () => {
  const user = await createUser({ name: "Alice" });
  const retrieved = await getUser(user.id);
  expect(retrieved.name).toBe("Alice");
});
```

**Tautological tests**: Expected value restates the implementation, so the test passes by construction.

```typescript
// BAD: Expected value is recomputed the way the code computes it
test("calculateTotal sums line items", () => {
  const items = [{ price: 10 }, { price: 5 }];
  const expected = items.reduce((sum, i) => sum + i.price, 0);
  expect(calculateTotal(items)).toBe(expected);
});

// GOOD: Expected value is an independent, known literal
test("calculateTotal sums line items", () => {
  expect(calculateTotal([{ price: 10 }, { price: 5 }])).toBe(15);
});
```
