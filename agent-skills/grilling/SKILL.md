---
name: grilling
description: Grill the user relentlessly about a plan, decision, or idea. Use when the user wants to stress-test their thinking, or uses any 'grill' trigger phrases.
---

Interview the user relentlessly until you reach a shared understanding. Map this as a **design tree**: every decision branches into the decisions that hang off it.

Work the tree in **rounds**. The **frontier** is every decision whose prerequisites are already settled: the questions you can ask _now_ without guessing at answers you haven't heard yet. Ask the whole frontier in one round: number each question and give your recommended answer. Then wait for the user's answers before the next round.

Format a round like so:

```
❓ **Q1** - **<question title>**: <question body, might be multiple paragraphs, including multiple choices>

➡️ <your recommended answer>

---

❓ **Q2** - **<question title>**: <question body, might be multiple paragraphs, including multiple choices>

➡️ <your recommended answer>
```

Each round the user answers reshapes the tree: settled decisions push the frontier outward and unblock questions that depended on them. Recompute the frontier and ask the next round. A question whose answer depends on another question still open in this round belongs to a _later_ round, not this one.

Finding _facts_ is your job, never the user's. When a frontier question needs a fact from the environment (filesystem, tools, etc.), dispatch a sub-agent to find it; don't ask the user for anything you could look up yourself. Don't block on it: a running exploration is an unsettled prerequisite, so only the questions downstream of it wait for the sub-agent to report; ask the rest of the frontier now. The _decisions_ are the user's: put each to them and wait.

The session is done when the frontier is empty: every branch of the design tree visited, nothing left silently assumed. Do not act on it until the user confirms you have reached a shared understanding.

## Checkpoints and early closure

The user may ask for a checkpoint at any time ("status", "how much is left?",
"can we wrap this up?", "what remains?", etc.).

A checkpoint is meta-information about the design tree, not a decision and does
not alter the tree.

Report:

- size of the current frontier
- known downstream decisions not yet reachable
- any unresolved factual investigations/blockers
- an approximate number of rounds remaining, expressed as a range when uncertain
- which remaining decisions are:
  - **blocking** — must be resolved before acting
  - **important** — worth discussing, but a reasonable default exists
  - **refinement** — low-risk details that can safely use the recommended default

Because answers can reveal new branches, never claim an exact percentage complete
or exact number of questions remaining unless the tree is fully known.

If the user wants to finish quickly, switch to **closure mode**:

1. Ask only remaining blocking decisions.
2. State the recommended defaults you propose for important/refinement decisions.
3. Surface any meaningful risks created by those defaults.
4. Ask the user to confirm the resulting shared understanding before acting.

Do not treat requesting a checkpoint or closure as an answer to any open design
question.
