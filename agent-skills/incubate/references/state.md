# Discovery state contract

Read this file before any discovery-state mutation.

## Resolve the project home

The selected workspace may be a single project or a collection that contains many projects. Workspace instructions own local paths, naming, note formats, and link syntax. Resolve the project home in this order:

1. Use an explicit project path from the user.
2. Use the project collection configured by workspace instructions.
3. Use an established discovery location for the current project.
4. Inside a repository, fall back to `docs/discovery/<domain-slug>/`.
5. Outside a repository, fall back to `discovery/<domain-slug>/` under the selected working directory.

Within a configured collection, inspect names only as far as needed to match the requested project. Do not read unrelated project contents.

Resolve existing project shapes as follows:

- **Project directory:** use it as the project home.
- **Project note:** treat the matching Markdown file as the human-facing entrypoint and source material. When discovery needs multiple artifacts, keep the note in place and use a same-name sibling directory as the project home unless workspace instructions specify another layout.
- **Project note and same-name directory:** keep the note as the entrypoint and use the directory as the project home.

When creating a sidecar project home, add a link from the entry note to `MAP.md` and a return link from the map. Match the workspace's link syntax. Keep existing note content intact.

If no project matches, follow the collection's creation convention. When no convention can be inferred safely, ask one layout question. If several matches remain plausible, ask one location question instead of merging them.

These defaults do not authorize writes outside the selected workspace. Inspect the target and its parents before creating it. If expected files cannot be read, stop rather than treating the location as empty.

## Canonical records

Create files lazily. Omit empty sections.

### Project entry note

In a project collection, an existing top-level note remains the human-facing gateway. It is a source for discovery and links to `MAP.md`; it is not a second copy of the map. Keep canonical incubation records in the resolved project home unless workspace instructions explicitly assign the note another role.

### `DOMAIN.md`

The durable frame: motives, people and settings, hoped-for outcomes or experiences, observed problems when present, constraints, vocabulary, and live assumptions. It is the canonical home for domain-level facts and user preferences.

### `MAP.md`

The resumable index: active focus, threads, candidate bets, inquiry states and dependencies, parking, and short links to decisions or evidence. The map may carry a one-line gist but does not duplicate detail from another canonical record.

### `threads/<thread-slug>.md`

Create when a thread has enough distinct motives, evidence, questions, or bets that keeping it in `DOMAIN.md` would obscure the domain. It owns the thread's boundaries and evidence synthesis.

### `bets/<bet-slug>.md`

Create when a bet has substantive shape or needs an independent decision. It owns that bet's motive, intended result or experience, rationale, success conditions, accepted scope, non-goals, appetite, alternatives, evidence synthesis, dependencies, and open questions. A handoff expands this same file; it does not create a competing version.

### `evidence/<inquiry-slug>.md`

Create for research or experiments with claims, sources, method, or results worth preserving. It owns those findings. Small user decisions may instead live in the affected domain, thread, or bet document.

## Statements and authority

Label material statements when their authority could be confused:

- **User decision:** explicitly chosen by the user.
- **Observation:** reported or directly observed evidence.
- **Inference:** interpretation drawn from evidence.
- **Proposal:** an unaccepted recommendation.
- **Assumption:** an unresolved belief.

Do not convert an inference or proposal into a user decision through rewriting. Quote only when exact wording matters; otherwise preserve the decision and rationale in plain language.

## Inquiry records

Each live inquiry in `MAP.md` has:

- a descriptive name;
- one decision-changing question;
- a mode: unpack, explore, research, compare, shape, or assess;
- a status: ready, active, blocked, resolved, or parked;
- a completion criterion;
- real dependencies, if any;
- an outcome link after resolution.

Use names in conversation. Add stable IDs only if the existing workspace already uses them or links would otherwise be ambiguous.

An inquiry is:

- **Ready** when it has no unresolved dependency.
- **Active** when the current session is working it.
- **Blocked** when a named dependency prevents useful work.
- **Resolved** when its completion criterion is met and the result is saved and linked.
- **Parked** when it is intentionally outside the current frontier but may return.

Questions that depend on an unanswered preference remain separate. Do not ask a later question as though an earlier tentative recommendation were accepted.

## Decisions and reopening

Save a decision in the document whose content it governs. Record:

- what the user decided;
- the rationale and tradeoff they accepted;
- the date when it affects time-sensitive interpretation;
- the evidence available at the time;
- any condition that should reopen it.

The map links to the decision with a one-line gist.

New evidence does not erase a decision. Mark the old decision superseded, preserve its rationale, add the new decision, and update affected links. Rejected proposals remain briefly visible with the reason for rejection. Reintroduce one only when new evidence addresses that reason.

## Tracker links

A tracker may mirror an inquiry for collaboration, but discovery files remain canonical unless repository instructions explicitly say otherwise. Store the tracker URL on the map record. A ticket title or status alone does not replace the completion criterion, evidence, or outcome link.

## Mutation order

For each completed inquiry:

1. Save research or experiment evidence.
2. Update the affected domain, thread, or bet document with the conclusion and its authority.
3. Update dependent inquiries and candidate boundaries.
4. Update `MAP.md` last with status, gist, and links.

This order keeps the index from claiming work that was not saved.

## Persistence check

Before reporting completion, verify:

- every resolved inquiry meets its written completion criterion;
- every resolved inquiry links to a readable canonical outcome;
- map statuses agree with their dependencies;
- accepted decisions remain distinguishable from proposals and assumptions;
- no substantive conclusion exists only in chat;
- changed files are inside the selected workspace;
- a sidecar map and its project entry note link to each other;
- partial writes, access failures, and contradictions are named in the checkpoint.

If file tools are unavailable, provide proposed content or a patch and say that it was not saved.
