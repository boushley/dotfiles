# Discovery templates

Use only the template for the artifact being created. Remove prompts and empty sections. Match an established local format when one exists.

## `DOMAIN.md`

```markdown
# <Domain>

## Frame

<A provisional, solution-independent account of the domain and why it matters.>

## People and situations

- <Who encounters what situation. Mark inference when the user has not confirmed it.>

## Desired outcomes

- <Change the user wants in the world.>

## Observed problems

- <Concrete friction and its evidence.>

## Constraints and preferences

- **User decision:** <Constraint or preference and rationale.>

## Assumptions

- <Belief whose failure could change an opportunity or bet.>
```

## `MAP.md`

```markdown
# <Domain> discovery map

- **Project entry:** <return link when the project has an entry note>

## Active focus

- **Opportunity:** <name and link when available>
- **Bet:** <name and link, or "none selected">
- **Inquiry:** <name and status>
- **Why now:** <decision this inquiry affects>

## Opportunities

### <Opportunity name>

<One-line outcome and problem cluster.>

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

- <Idea or opportunity and why it is not active.>
```

## Opportunity record

```markdown
# <Opportunity>

## Desired outcome

<Solution-independent outcome.>

## Problem cluster

- <Observed problem and evidence link.>

## Boundary

- **Includes:** <accepted boundary or labeled proposal>
- **Excludes:** <accepted boundary or labeled proposal>
- **Adjacent opportunities:** <links and relationship>

## Evidence and assumptions

- **Documented | Tested | Observation | Inference | Assumption:** <claim and link>

## Candidate bets

- <Bet and the different causal theory it tests.>
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

- **State:** candidate | selected | deferred | rejected | ready for planning
- **Opportunity:** <link>

## Problem and outcome

<Who faces what problem, and what should change.>

## Causal claim

<Why this response should improve the outcome.>

## Rough experience

<The smallest end-to-end path that delivers or tests the outcome.>

## Accepted scope

- **User decision:** <included behavior and rationale>

## Non-goals

- **User decision:** <excluded behavior and rationale>

## Alternatives considered

- <Adopt, configure, compose, service, experiment, or build alternative; evidence and tradeoff.>

## Appetite and constraints

- <Time, cost, maintenance, control, learning, privacy, or operational constraint.>

## Evidence and risks

- **Documented | Tested | Observation | Inference | Assumption:** <claim and link>

## Dependencies

- <External decision, system, person, or unresolved prerequisite.>

## Open implementation questions

- <A question that changes how to implement, not what the product is.>

## Decision history

- **<Date or checkpoint>:** <decision, rationale, and superseded decision when applicable.>
```
