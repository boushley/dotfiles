# Discovery workflow

Use the section for the current mode. Stop when its completion criterion is met.

## Initial mapping

Build the first map from what the user has already said before asking more questions.

1. Write a provisional domain frame: affected people, desired outcomes, observed problems, ideas already mentioned, constraints, and assumptions.
2. Cluster problems by outcome and causal connection. A shared technology, audience, or dataset is weak evidence that two clusters belong together.
3. Name candidate opportunities without embedding a solution in the name.
4. Derive a few decision-changing inquiries. Record dependencies only when one answer genuinely changes how another question should be asked.
5. Recommend the first ready inquiry based on decision impact, uncertainty, and cost of learning.

Initial mapping is complete when `DOMAIN.md` gives a faithful provisional frame, `MAP.md` names the known opportunities and bets without conflating them, and at least one inquiry is ready or the exact blocker is recorded.

## Unpack

Use unpacking when the user's language mixes outcomes, problems, and mechanisms.

- Translate solution language into the outcome it is meant to cause.
- Ask for concrete recent examples of the problem.
- Separate distinct people, moments, and jobs when their success conditions differ.
- Record ideas without promoting them to accepted scope.
- Turn consequential unknowns into assumptions or inquiries.

Unpacking is complete when the active cluster has a clear desired outcome, grounded problems, and separately labeled ideas and assumptions.

## Explore

Use exploration to widen the option set without choosing a bet.

- Explore different ways to reach the outcome, including behavior change, existing tools, configuration, composition, service work, and custom software.
- Vary the product boundary as well as the feature list.
- Seek alternatives that test a different causal theory.
- Keep attractive ideas in parking when they do not affect the current decision.

Exploration is complete when the relevant alternatives differ in a decision-worthy way and their key assumptions are explicit. A long feature list does not satisfy this criterion.

## Research

Write the decision and its evidence threshold before searching. Keep the research question narrow enough to finish now.

Prefer primary sources: official product documentation, pricing, terms, standards, source code, first-party demonstrations, and direct tests. Use independent sources for experiential claims that vendors cannot establish themselves. Record the access date because products, prices, and policies change.

For each material claim, label its basis:

- **Documented:** a cited source states it.
- **Tested:** a recorded experiment observed it.
- **Inferred:** evidence supports it, but no source or test establishes it directly.
- **Unknown:** the available evidence does not settle it.

Compare existing options against the outcome and constraints, not against an imagined feature inventory. Include adoption cost, migration, lock-in, maintenance, learning value, enjoyment, and desired control when relevant.

Research is complete when the named decision has enough evidence to make or defer it, every material claim has a basis, and unknowns that could reverse the conclusion remain visible.

## Compare

Use a comparison when alternatives, bets, or boundaries compete for attention.

Choose criteria before scoring or ranking. Derive them from the desired outcome, user constraints, appetite, and evidence. Avoid fake precision. Prefer a short qualitative comparison when the evidence cannot support numbers.

Test whether candidates are independent:

- Can one produce value if the other never exists?
- Do they serve different moments, people, or desired outcomes?
- Would evidence invalidate one without invalidating the other?
- Could an existing solution satisfy one while the other still merits work?

If the answers point apart, keep separate bets even when they share data or infrastructure.

Comparison is complete when the consequential differences, evidence, and tradeoffs are clear enough for the user to choose what to investigate, defer, or reject next.

## Scope review

Review the boundary at initial mapping, after decision-changing evidence, and when a new idea arrives. Skip ceremonial reviews when nothing material changed.

Check for:

- **False unity:** independent outcomes joined because they share users, data, or technology.
- **Missing journey:** a narrow feature that cannot deliver its outcome without surrounding steps.
- **Adoption blindness:** custom work proposed before existing tools or configuration were checked.
- **Platform gravity:** reusable infrastructure included before two proven consumers need it.
- **Hidden operator:** setup, curation, moderation, support, or maintenance work with no owner.
- **Preference disguised as fact:** a recommendation that depends on taste, learning goals, or desired control.
- **Orphan idea:** a new idea attached to the active bet despite having a different outcome or success test.

Turn a finding into one proposal with this shape:

> Observation → consequence → proposed change → tradeoff → affected records

Possible changes are split, merge, expand, reduce, reuse, experiment, defer, and stop. Mark the proposal as pending until the user decides. Reversible map organization may reflect the proposed view, but accepted boundaries and priorities remain unchanged.

The review is complete when each material concern has either a proposal, a recorded reason to leave the boundary alone, or a named inquiry.

## Shape

Shape one bet, not the whole domain.

Clarify:

- the problem and desired outcome;
- the people and moment served;
- the causal claim: why this response should improve the outcome;
- the smallest end-to-end experience that tests or delivers that claim;
- accepted scope, non-goals, appetite, and important constraints;
- alternatives considered and why this bet remains plausible;
- evidence, dependencies, risks, and open implementation questions.

Prefer vertical coherence over a pile of capabilities. Remove pieces that do not support the causal claim. Add a missing step when users otherwise cannot reach the outcome.

Shaping is complete when a reviewer can explain what the bet changes, for whom, why it may work, what is deliberately absent, and what evidence still threatens it.

## Assess

Assessment is read-only. Report the state supported by the current files:

- active opportunity and bet;
- accepted decisions and pending proposals;
- strongest evidence and decision-threatening unknowns;
- ready, blocked, and active inquiries;
- readiness against the handoff gate.

Assessment is complete when the report identifies the next decision without changing state or turning the report into an interview.

## Handoff gate

A bet is ready for handoff when all of these are true:

- The user selected this bet or explicitly asked to package it for selection.
- Its problem, desired outcome, audience, and causal claim are clear.
- Accepted scope and non-goals define a coherent end-to-end experience.
- Existing solutions received a decision-proportionate check.
- Material assumptions are supported, assigned to a bounded experiment, or accepted as risk.
- Appetite and constraints are sufficient to guide planning.
- Open questions are implementation questions rather than unresolved product identity or boundary questions.
- The bet document distinguishes user decisions, evidence, and recommendations.

If a failed item could change whether or what to build, keep incubating. If only implementation choices remain, recommend technical planning. Readiness never selects a bet for the user.
