---
name: to-spec
description: "Turn the current conversation into a spec and publish it to the project issue tracker: no interview, just synthesis of what you've already discussed."
disable-model-invocation: true
---

This skill takes the current conversation context and codebase understanding and produces a spec. Do NOT interview the user; just synthesize what you already know.

The issue tracker and triage label vocabulary should have been provided to you. If not, tell the user to run `/setup-project-for-agents`.

## Process

1. Explore the repo to understand the current state of the codebase, if you haven't already. Use the project's domain glossary vocabulary throughout the spec, and respect any ADRs in the area you're touching.

2. Read the test-value gate in [`../tdd/tests.md`](../tdd/tests.md). Identify the externally meaningful contracts that earn retained automated tests, along with an independent oracle for each. Separately identify requirements better established by a compiler, validator, build, smoke check, or inspection. A module, configuration field, acceptance criterion, or request for “coverage” is not by itself a reason to add a test.

For retained tests, sketch the public seams. Prefer existing seams and use the highest practical seam. If new seams are needed, propose them at the highest point you can. The fewer seams across the codebase, the better—the ideal number is one.

Use seam and verification choices already agreed in the conversation. Where none were agreed, make the best supported choice and label it as a proposal in the spec; do not pause to interview the user.

3. Write the spec using the template below, then publish it to the project issue tracker. Apply the `ready-for-agent` triage label - no need for additional triage.

<spec-template>

## Problem Statement

The problem that the user is facing, from the user's perspective.

## Solution

The solution to the problem, from the user's perspective.

## User Stories

A LONG, numbered list of user stories. Each user story should be in the format of:

1. As an <actor>, I want a <feature>, so that <benefit>

<user-story-example>
1. As a mobile bank customer, I want to see balance on my accounts, so that I can make better informed decisions about my spending
</user-story-example>

This list of user stories should be extremely extensive and cover all aspects of the feature.

## Implementation Decisions

A list of implementation decisions that were made. This can include:

- The modules that will be built/modified
- The interfaces of those modules that will be modified
- Technical clarifications from the developer
- Architectural decisions
- Schema changes
- API contracts
- Specific interactions

Do NOT include specific file paths or code snippets. They may end up being outdated very quickly.

Exception: if a prototype produced a snippet that encodes a decision more precisely than prose can (state machine, reducer, schema, type shape), inline it within the relevant decision and note briefly that it came from a prototype. Trim to the decision-rich parts, not a working demo, just the important bits.

## Verification Decisions

A list of verification decisions that were made. Include:

- The externally observable contracts worth retaining tests for
- The public seam and independent oracle for each retained test
- Relevant prior art in the codebase
- Requirements intentionally handled by tool verification or inspection instead of repository tests

## Out of Scope

A description of the things that are out of scope for this spec.

## Further Notes

Any further notes about the feature.

</spec-template>
