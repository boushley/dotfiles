# Photo project example

This example demonstrates decomposition. It is fictional. It supplies neither research nor user decisions.

## Tangled starting idea

> I want one app that imports photos from every service, removes duplicates, finds the best pictures, lets my family annotate them, and produces a printed annual album.

The sentence names one domain but several motives, desired outcomes, and ways of working.

## Unpacked domain

### Motives

- Enjoy revisiting family history while shaping it into something tangible.
- Learn how local photo indexing and preservation work.
- Gain more control over a collection spread across commercial services.
- Make an annual album ritual sustainable enough to repeat.

### Intended outcomes

- Keep a trustworthy collection despite photos being spread across devices and services.
- Find meaningful photos without browsing the entire archive.
- Preserve family context that is not present in image metadata.
- Turn selected memories into an annual physical artifact.

### Observed problems

- Copies and edited variants make the collection hard to trust.
- Search by date and location does not answer subjective questions such as "best picture of Sam this summer."
- Captions and identities live in relatives' memories.
- Album creation requires a burst of selection, layout, and print-vendor work.

### Ideas, still unapproved

- A local photo index.
- Duplicate detection.
- Collaborative annotation.
- Automated album drafts.

### Assumptions

- Gaps between services matter enough to justify another layer of organization.
- Relatives will contribute annotations through a new workflow.
- Automatic selection will save more review time than it creates.
- The user has not yet decided whether building a tool is a means to an end or part of the desired experience.

## Project threads

### Trustworthy archive

The intended result is knowing that important photos are present, intelligible, and not buried in uncontrolled duplication. Import, identity, variants, and integrity belong here. Learning how the archive works may also be part of the return.

### Family memory capture

The intended result is preserving names and stories while people can still supply them. This may be a lightweight sharing or interview practice and can be worthwhile without a unified archive.

### Annual album production

The intended result is making one good physical album with tolerable effort. The pleasure of selecting, arranging, and sharing it may matter as much as efficiency. This thread may compose existing photo storage and print services rather than replace them.

These threads can share photos while remaining independent. Failure of a collaborative-annotation bet does not invalidate an album workflow. A print service might satisfy production while archive integrity still needs work. Existing software may settle a utility question without settling whether the user wants to learn by making a tool.

## Candidate bets

### Archive audit, not archive platform

A read-only tool reports missing periods, likely duplicates, and source coverage. It tests whether visibility solves enough of the trust problem before attempting migration or storage. If learning local indexing is a motive, building this audit may remain worthwhile even when a commercial tool has similar output.

### Guided family annotation session

A host presents a small photo set during a call and records names and stories. It tests participation and facilitation before building asynchronous accounts, permissions, and notifications.

### Annual album practice

A repeatable human-led workflow creates an album using existing storage and printing tools. It tests whether the ritual feels rewarding and whether the effort is sustainable before custom automation.

## Viability tests, when relevant

If the user wants the album to look unlike standard templates, comparable albums and layout tools become relevant to the distinctiveness test. If the user later wants to sell the workflow, a separate commercialization thread should examine who would buy it, meaningful differentiation, willingness to pay, delivery cost, and distribution. Neither test belongs by default.

## Scope proposal example

> **Observation:** Album production and archive integrity have different success tests. **Consequence:** Combining them makes the first useful album depend on import and deduplication. **Proposal:** Treat annual album production as an independent bet that reads from the current library. **Tradeoff:** The workflow inherits current library gaps, but it can test whether the annual ritual is worth sustaining without a migration system. **Affected records:** split the original thread into archive and album threads, add an album bet, and park shared archive infrastructure.

The user may accept or reject this proposal. Until then, it remains proposed.
