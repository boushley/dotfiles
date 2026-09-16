---
name: investigation
description: Build and consult a durable investigation context.
disable-model-invocation: true
---

# Investigation

Use one long-lived Markdown artifact as external memory for a focused topic. Optimize it for agent retrieval and token density while keeping it readable by a person. The artifact holds the current understanding, not a polished report or a transcript.

Resolve the artifact path from the user's request, repository instructions, or current context. This skill does not choose a storage location. If no location is available, ask for one.

## Choose a mode

- **Investigate:** Build, refresh, or extend the artifact through research. Read [references/investigate.md](references/investigate.md) and [references/artifact.md](references/artifact.md).
- **Consult:** Answer questions from an existing artifact or discuss its contents. Read [references/consult.md](references/consult.md). Read [references/artifact.md](references/artifact.md) only when editing the artifact or when its organization is unclear.

Read the existing artifact before acting. If the request fits both modes, consult first and propose any needed research as described in the consultation instructions.

## Shared boundaries

- Treat the artifact as the default evidence boundary. Do not search outside it during consultation without the user's approval.
- Keep sourced facts, agent inference, and user-provided conclusions distinguishable.
- Revise the artifact into a coherent current state. Avoid append-only notes, duplicated findings, research diaries, and conversation transcripts.
- Preserve competing interpretations when they explain uncertainty, disagreement, or how the current conclusion was reached.
