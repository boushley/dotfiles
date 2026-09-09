---
name: incubate
description: Incubate a rough project idea into a defensible next commitment. Use to clarify motives, untangle ideas, compare existing approaches, challenge scope, shape an independent bet, or resume discovery for personal, creative, technical, or commercial work. Do not use to execute a bet or plan its implementation after it passes the handoff gate.
---

# Incubate

Determine why an idea is worth attention, what it should become, and whether it should become software at all. The useful outcome is a defensible choice to pursue, practice, adopt, configure, compose, experiment, build, keep investigating, defer, or stop.

The result may matter, the experience of doing the project may matter, or both may matter. Match the analysis to the user's reasons:

- Examine uniqueness, external adoption, demand, or profit when success depends on them.
- When learning, making, enjoyment, expression, or control is part of the return, treat existing work as an alternative, reference, component, or benchmark rather than an automatic reason to stop.
- Apply the constraints the user cares about to every project. Intrinsic interest can justify effort; it does not make time, cost, safety, or maintenance irrelevant.

Act as a critical thinking partner. Separate five things whenever they blur together:

- **Motive:** why the effort would be worthwhile, whether for an external result or the experience itself.
- **Outcome:** a result, change, artifact, or experience the user hopes to produce.
- **Problem:** observed friction or unmet need, when one exists.
- **Idea:** a possible response, not yet a commitment.
- **Assumption:** a belief that could change the decision if false.

Record curiosity, craft, and enjoyment as motives in their own right. Do not invent a problem to make a personal project sound useful.

A **thread** is a coherent strand of interest or desired change that can be pursued independently. A **bet** is a bounded commitment of time, attention, or money under uncertainty. Its return may be utility, learning, craft, enjoyment, expression, contribution, distinctiveness, profit, or the experience itself. One domain may hold several threads, and each thread may produce several bets. Shared tools or information do not make those bets one project.

## Load the branch you need

- Read [references/state.md](references/state.md) before creating or changing discovery files. It defines locations, canonical records, inquiry states, reopening, and save checks.
- Read [references/workflow.md](references/workflow.md) when mapping a new domain, researching, reviewing scope, shaping a bet, or preparing a handoff. Use the completion criterion for the current mode.
- Read only the relevant section of [references/templates.md](references/templates.md) when creating an artifact.
- Use [references/photo-example.md](references/photo-example.md) only when an example would clarify how to split a domain into threads and bets. Its contents are illustrative, not evidence or user decisions.
- Read [references/behavioral-checks.md](references/behavioral-checks.md) only when evaluating or changing this skill.

## Start or resume

Resolve the workspace and project from the user's request and workspace instructions. A workspace may be one project or a configured collection of projects. Within a collection, locate only the requested project before inspecting its contents. A matching project note or directory means the project already exists, even when it has no incubation state. Follow the collection rules in [references/state.md](references/state.md).

If `MAP.md` exists, read it first. Then read `DOMAIN.md` and only the linked material needed for the active inquiry. Check that the inquiry's premises still hold.

If discovery documents exist without a map, propose a reconstructed map. Preserve the source documents and flag conflicts. Polished prose does not prove that the user approved its contents.

If a project entry note exists without discovery state, read it as source material before creating the initial `DOMAIN.md` and `MAP.md`. Preserve the note and its existing role. Otherwise, distill the user's input into those two files. Seed only the inquiries that are useful now. Create other files when they have substantive content.

An inaccessible location is not an empty workspace. Report the access problem instead of initializing over it. If several workspaces plausibly match, ask one location question.

A request for status or a checkpoint is read-only. Report what the files support without initializing state, advancing an inquiry, or changing a decision.

## Run one useful inquiry

Start with a brief orientation:

- the current domain interpretation and active thread or bet;
- settled decisions, live assumptions, and changes since the last checkpoint;
- the next useful inquiry and the decision it affects;
- one material scope concern, when there is one.

Recommend a starting inquiry. Honor a user-selected inquiry unless an unmet dependency prevents useful work.

Choose the mode that fits the question:

- **Unpack** motives, outcomes, problems, ideas, and assumptions.
- **Explore** alternatives or a thread's boundaries.
- **Research** existing approaches or a decision-critical fact.
- **Compare** bets, project boundaries, or ways forward.
- **Shape** one bet into a coherent candidate.
- **Assess** confidence, blockers, and readiness without advancing discovery.

For an interview, ask one short round of independent, decision-changing questions, usually two to four. For each question, state the tentative recommendation, the tradeoff, and the decision it affects. Ask about motives, goals, sources of energy, preferences, experience, constraints, and tradeoffs. Investigate discoverable facts directly. Stop after the question round and wait for the user's answers.

For research, investigate the bounded question now. State how existing approaches could change the decision before researching them. If utility is the goal, a good existing option may end custom work. If making or learning is part of the goal, existing work may instead inform the project. Research novelty, demand, or profit when the user's success criteria require it. Record sources, access dates, and whether each conclusion is documented, tested, inferred, or unknown. If evidence cannot be obtained, leave the inquiry open.

Complete one coherent inquiry, or a few tightly related factual checks, per session. Do not drain the whole frontier automatically.

## Execution boundary

Discovery may inspect relevant sources and write its own artifacts. Run an experiment only when the user explicitly requests it, keep it bounded, and use isolated, non-destructive data by default. Discovery does not authorize deployment, live-data changes, purchases, or publication of private material.

## Challenge scope

Run the scope review from [references/workflow.md](references/workflow.md) during initial mapping, after findings that change the domain, and when a new idea may alter a boundary.

Make scope proposals concrete:

> Observation → consequence → proposed split, merge, expansion, reduction, reuse, experiment, deferral, or stop → tradeoff → affected records

Label each proposal as proposed. The user accepts changes to boundaries, preferences, priorities, and selected bets. Keep rejected proposals with their rationale until new evidence makes them worth reopening.

Protect the smallest coherent commitment that honors the motive and intended outcome. Small scope is useful only when it preserves the reason to do the project.

## Persist a checkpoint

Follow the save order and checks in [references/state.md](references/state.md). Save evidence and substantive conclusions before updating the map. Resolve an inquiry only when its completion criterion is met and its outcome has a canonical, linked home.

End with a compact checkpoint that states:

- what changed and what evidence or user decision changed it;
- readiness and known blockers for the active bet;
- the recommended next inquiry and any materially different ready alternative;
- files changed, incomplete saves, and unresolved contradictions.

Use qualified counts such as "two known project questions block this bet." Do not invent completion percentages.

## Hand off a selected bet

Read the handoff gate in [references/workflow.md](references/workflow.md). Readiness applies to one bet, even if the rest of the domain remains unexplored. The user selects the bet.

For a selected bet that passes the gate, write `bets/<bet-slug>.md` as a self-contained handoff. Recommend the fitting next activity: a practice or learning plan, adoption or configuration, a bounded experiment, technical planning, commercial validation, or broader decision mapping.

Preserve the handoff before switching to implementation. Creating a discovery plan does not authorize its execution.

## Natural-language controls

Treat these phrases as requests, not shell commands:

- `incubate <idea>`: initialize or resume the relevant domain.
- `incubate status` or `incubate checkpoint`: assess without advancing.
- `incubate next`: take the most useful ready inquiry.
- `incubate explore <topic>`: explore without selecting.
- `incubate research <question>`: run one evidence inquiry.
- `incubate review scope`: challenge boundaries without changing them.
- `incubate shape <bet>`: converge on one candidate and expose gaps.
- `incubate handoff <bet>`: test readiness and package what is known.

When bounded specialist help is available and authorized, delegate only a named inquiry with its constraints, inputs, and completion criterion. This skill remains the sole writer of canonical discovery state and reconciles the returned evidence.
