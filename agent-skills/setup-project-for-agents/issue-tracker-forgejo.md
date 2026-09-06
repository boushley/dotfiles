# Issue tracker: Forgejo

Issues and specs for this repo live in `<owner>/<repo>` on `forgejo.boushley.cc`. Use the configured Forgejo MCP server for every tracker operation. Pass `owner: "<owner>"` and `repo: "<repo>"` to each repository-scoped call.

## Conventions

- **Create an issue**: call `mcp__forgejo__create_issue` with `title` and `body`.
- **Read an issue**: call `mcp__forgejo__get_issue_by_index`, then paginate through `mcp__forgejo__list_issue_comments` when the conversation matters.
- **List issues**: paginate through `mcp__forgejo__list_repo_issues`. Set `type: "issues"` so pull requests are excluded, and apply the requested `state` and `labels` filters.
- **Comment on an issue**: call `mcp__forgejo__create_issue_comment`.
- **Apply or remove labels**: resolve label names with `mcp__forgejo__list_repo_labels`, then call `mcp__forgejo__add_issue_labels` or `mcp__forgejo__remove_issue_labels` with the comma-separated label IDs.
- **Assign**: call `mcp__forgejo__update_issue`. Use `mcp__forgejo__get_my_user_info` when the assignee is the current user.
- **Close**: post the closing explanation with `mcp__forgejo__create_issue_comment`, then call `mcp__forgejo__issue_state_change` with `state: "closed"`.

Treat pagination as part of the read. Continue while the response says another page exists or until a short page proves the result set is exhausted.

## Pull requests as a triage surface

**PRs as a request surface: no.** _(Set to `yes` if this repo treats external pull requests as feature requests; `/triage` reads this flag.)_

When set to `yes`, pull requests use the same labels and states as issues:

- **Read a PR**: call `mcp__forgejo__get_pull_request_by_index`, `mcp__forgejo__get_pull_request_diff`, and `mcp__forgejo__list_issue_comments`.
- **List PRs for triage**: paginate through `mcp__forgejo__list_repo_pull_requests`, then keep requests from outside the repository's maintainers. For an organization owner, use `mcp__forgejo__check_org_membership`; ask when membership is ambiguous.
- **Comment, label, or close**: use `mcp__forgejo__create_issue_comment`, the issue-label tools, and `mcp__forgejo__issue_state_change`. Forgejo shares an index namespace between issues and pull requests.

A bare `#42` may name either an issue or pull request. Try `mcp__forgejo__get_pull_request_by_index` and fall back to `mcp__forgejo__get_issue_by_index`.

## When a skill says "publish to the issue tracker"

Call `mcp__forgejo__create_issue`.

## When a skill says "fetch the relevant ticket"

Call `mcp__forgejo__get_issue_by_index` and fetch every page of comments.

## Wayfinding operations

Used by `/wayfinder`. The **map** is one issue, with linked issues as tickets.

- **Map**: an issue labelled `wayfinder:map`, holding the Notes / Decisions-so-far / Fog body.
- **Child ticket**: an issue whose body starts with `Part of #<map>`, labelled `wayfinder:<type>` (`research`/`prototype`/`grilling`/`task`). Once claimed, assign it to the driving developer.
- **Blocking**: call `mcp__forgejo__add_issue_dependency` so the child depends on each blocker. If the repo has issue dependencies disabled, use a `Blocked by: #<n>, #<n>` line at the top of the child's body. A ticket is unblocked when every dependency is closed.
- **Frontier query**: list open issues with `sort: "oldest"`, then keep those whose body starts with `Part of #<map>`. Drop tickets with an assignee or an open result from `mcp__forgejo__list_issue_dependencies`; the lowest issue index wins. For the text fallback, resolve every issue in the `Blocked by` line instead.
- **Claim**: call `mcp__forgejo__update_issue` with the driving developer as assignee. This is the session's first write.
- **Resolve**: comment with the answer, close the ticket, then fetch and update the map body with a context pointer containing the gist and ticket link.
