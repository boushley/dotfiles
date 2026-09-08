# Photo-domain example

This example demonstrates decomposition. It is fictional. It supplies neither product research nor user decisions.

## Tangled starting idea

> I want one app that imports photos from every service, removes duplicates, finds the best pictures, lets my family annotate them, and produces a printed annual album.

The sentence names one domain but several desired outcomes and operating models.

## Unpacked domain

### Desired outcomes

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

- Existing photo services cannot cover the desired sources or control requirements.
- Relatives will contribute annotations through a new workflow.
- Automatic selection will save more review time than it creates.

## Opportunity split

### Trustworthy archive

The outcome is knowing that important photos are present, intelligible, and not buried in uncontrolled duplication. Import, identity, variants, and integrity belong here.

### Family memory capture

The outcome is preserving names and stories while people can still supply them. This may be a lightweight sharing or interview workflow and can create value without a unified archive.

### Annual album production

The outcome is shipping one good physical album with tolerable effort. It may compose existing photo storage and print services rather than own either.

These opportunities can share photos while remaining independent. Failure of a collaborative-annotation bet does not invalidate an album workflow. A print service might satisfy album production while archive integrity still needs work.

## Candidate bets

### Archive audit, not archive platform

A read-only tool reports missing periods, likely duplicates, and source coverage. It tests whether visibility solves enough of the trust problem before attempting migration or storage.

### Guided family annotation session

A host presents a small photo set during a call and records names and stories. It tests participation and facilitation before building asynchronous accounts, permissions, and notifications.

### Annual album concierge

A repeatable human-led workflow creates an album using existing storage and printing tools. It tests selection criteria and willingness to pay before custom automation.

## Scope proposal example

> **Observation:** Album production and archive integrity have different success tests. **Consequence:** Combining them makes the first useful release depend on import and deduplication. **Proposal:** Treat annual album production as an independent bet that reads from the current library. **Tradeoff:** The workflow inherits current library gaps, but it can test demand without a migration system. **Affected records:** split the combined opportunity, add an album bet, and park shared archive infrastructure.

The user may accept or reject this proposal. Until then, it remains proposed.
