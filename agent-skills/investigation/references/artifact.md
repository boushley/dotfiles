# Investigation artifact

Write plain Markdown. Use the smallest set of sections that fits the topic, in this order. Omit empty optional sections.

```markdown
---
topic: <focused topic>
updated: <YYYY-MM-DD>
---

# <Topic>

## Orientation

**Scope:** <included and excluded boundaries>
**Use:** <questions, decisions, or work this should support>
**Questions:** <the agreed questions this artifact is meant to answer>

## Working model

<The shortest accurate synthesis of what is known and how the important pieces relate.>

## Findings

- **F1 [established]** <claim, relevant limits, and why it matters>. Evidence: [S1], [S2].
- **F2 [likely]** <claim and the inference behind it>. Evidence: [S3].

## Contested points

### D1: <question or disagreement>

- **Current conclusion:** <best-supported answer, or unresolved>.
- **Alternatives:** <material competing interpretations>.
- **Why they differ:** <evidence, assumptions, incentives, definitions, or context>.
- **People or groups:** <only those needed to understand the disagreement>.
- **Evidence:** [S2], [S4].

## Open questions

- **Q1** <question>. Matters because: <consequence>. Resolution needs: <missing evidence>.

## Sources

- **S1** [<title>](<URL>), <author or publisher>, <published date when useful; accessed YYYY-MM-DD>. Supports: F1, D1. <What it establishes and any material limitation>.
```

Use stable `F`, `D`, `Q`, and `S` identifiers so future agents can cite and revise entries without repeating them. Keep identifiers stable when wording changes. Retire an identifier rather than silently reusing it for a different subject.

Use one of these finding labels:

- `established`: directly supported by strong evidence;
- `likely`: the best explanation, with a material inferential step;
- `contested`: credible evidence or interpretations conflict;
- `unknown`: evidence does not support a conclusion.

Every material external factual claim needs one or more source identifiers. Prefer primary sources. Use strong secondary sources when they contribute analysis, testimony, synthesis, or context that primary material does not provide. Record enough of each source's actual contribution that routine consultation does not require reopening it. Preserve exact figures, dates, definitions, and short excerpts only when their precise form matters.

Mark user-provided conclusions inline with the consultation date. Mark agent inferences and cite the findings they depend on. A user consultation may appear in the source ledger without a URL when several entries depend on it. Its entry must say that it records the user's judgment rather than external validation.

Keep the working model compact and self-contained. Put supporting detail in findings and contested points. Git or another versioning system should carry edit history; the artifact should describe the current state.
