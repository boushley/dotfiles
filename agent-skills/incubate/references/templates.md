# Discovery templates

Use only the template for the artifact being created. Remove prompts and empty sections. Match an established local format when one exists.

## `DOMAIN.md`

```markdown
# <Domain>

## Frame

<A provisional account of the domain and why it matters.>

## Motives

- <Why the effort could be worthwhile. Include intrinsic and external reasons without forcing one into the other.>

## Intended outcomes or experiences

- <Result, artifact, change, learning, or experience the user hopes to produce.>

## People and settings

- <Who is involved and in what setting, when relevant. Mark inference when the user has not confirmed it.>

## Observed problems, when present

- <Concrete friction and its evidence.>

## Constraints and preferences

- **User decision:** <Constraint or preference and rationale.>

## Assumptions

- <Belief whose failure could change a thread or bet.>
```

## `MAP.md`

```markdown
# <Domain> discovery map

- **Project entry:** <return link when the project has an entry note>

## Active focus

- **Thread:** <name and link when available>
- **Bet:** <name and link, or "none selected">
- **Inquiry:** <name and status>
- **Why now:** <decision this inquiry affects>

## Threads

### <Thread name>

<One-line motive, intended result or experience, and any relevant problem.>

- **State:** provisional | active | deferred | rejected
- **Evidence:** <links>
- **Candidate bets:** <names and links>

## Inquiries

### <Inquiry name>

- **Question:** <one decision-changing question>
- **Mode:** unpack | explore | research | compare | shape | assess
- **Status:** ready | active | blocked | resolved | parked
- **Complete when:** <observable condition>
- **Depends on:** <names or "none">
- **Outcome:** <link and one-line gist after resolution>
- **Tracker:** <optional URL>

## Decisions

- [<decision name>](<canonical link>): <one-line gist>

## Pending scope proposals

- <Proposal, tradeoff, and affected records.>

## Parking

- <Idea or thread and why it is not active.>
```

## Thread record

```markdown
# <Thread>

## Motive

<Why this thread is worth attention.>

## Intended outcome or experience

<Result, change, artifact, learning, or experience sought.>

## Problems, when present

- <Observed problem and evidence link.>

## Boundary

- **Includes:** <accepted boundary or labeled proposal>
- **Excludes:** <accepted boundary or labeled proposal>
- **Adjacent threads:** <links and relationship>

## Evidence and assumptions

- **Documented | Tested | Observation | Inference | Assumption:** <claim and link>

## Candidate bets

- <Bet and how its commitment differs from the other candidates.>
```

## Evidence record

```markdown
# <Inquiry>

- **Decision affected:** <decision>
- **Question:** <bounded factual question>
- **Completion criterion:** <evidence threshold>
- **Researched:** <date>

## Findings

- **Documented | Tested | Inferred | Unknown:** <claim>. <citation or method>

## Conclusion

<What the evidence supports, what it rules out, and what remains unknown.>

## Sources

- [<source title>](<URL>), accessed <date>; <why authoritative>
```

## Bet and handoff record

Use this structure once a bet has substantive content. Before handoff, omit sections that are still empty and mark unsettled material as proposed or assumed.

```markdown
# <Bet>

- **State:** candidate | selected | deferred | rejected | ready for handoff
- **Thread:** <link>

## Why this is worth doing

<The motive. State whether the return lies in the result, the experience of doing it, or both.>

## Intended result or experience

<What this bet should produce for the user or anyone else involved.>

## Problem, when present

<The concrete friction this bet addresses and its evidence.>

## Rationale

<Why this commitment fits the motive and intended result.>

## Smallest coherent commitment

<The smallest version that preserves the reason to do the project.>

## Success and review conditions

- <What would count as worthwhile progress, success, a reason to reconsider, or a reason to stop.>

## Participants or beneficiaries

- <Who takes part or benefits, when anyone beyond the user matters.>

## Accepted scope

- **User decision:** <included behavior and rationale>

## Non-goals

- **User decision:** <excluded behavior and rationale>

## Alternatives considered

- <Alternative and its role as substitute, reference, component, benchmark, or competitor; evidence and tradeoff.>

## Viability tests, when relevant

- <Evidence about distinctiveness, external adoption, demand, willingness to pay, profit, or distribution when success depends on it.>

## Appetite and constraints

- <Time, attention, cost, safety, maintenance, control, learning, privacy, or operational constraint.>

## Evidence and risks

- **Documented | Tested | Observation | Inference | Assumption:** <claim and link>

## Dependencies

- <External decision, system, person, or unresolved prerequisite.>

## Open next-stage questions

- <A question for the recommended next activity that does not hide an unresolved purpose or boundary decision.>

## Decision history

- **<Date or checkpoint>:** <decision, rationale, and superseded decision when applicable.>
```
