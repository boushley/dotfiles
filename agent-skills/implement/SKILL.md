---
name: implement
description: "Implement a piece of work based on a spec or set of tickets."
disable-model-invocation: true
---

Implement the work described by the user in the spec or tickets. Capture the starting commit before making changes; it is the fixed point for the final review.

Before adding tests, read the test-value gate in [`../tdd/tests.md`](../tdd/tests.md). Treat a spec's Testing or Verification Decisions and a ticket's How to verify as proposed evidence, not a quota. For each requirement, choose a retained behavior test, tool verification, or inspection. If a requested test would mirror the implementation or lack an independent oracle, verify the underlying requirement another way and note the deviation in the handoff.

Use /tdd for retained behavior tests at pre-agreed public seams. A user-approved spec or ticket confirms the seams it names; otherwise confirm a new seam before writing its first test.

Run typechecking and relevant focused tests regularly. Run non-test validators, builds, and smoke checks where they are the stronger evidence. Keep a concise verification record of those commands or inspections and their outcomes in the working conversation, not in a repository file.

When the focused work is green, make a candidate commit and invoke /code-review with the captured starting commit and verification record. Address its findings and rerun any affected review axis after material fixes.

At the end, run the full test suite once, amend the candidate with the review fixes, and leave the current branch clean. The user's commit instructions override this sequence.
