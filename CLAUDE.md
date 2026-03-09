# npx transform

We transform upstream skill files so agents use `npx @playwright/cli` instead of bare `playwright-cli`.

`npx @playwright/cli` is correct because the npm package is `@playwright/cli` (scoped). `npx playwright-cli` is wrong — it resolves a different unscoped package.

## Files we own

- `scripts/npx-transform.sh` — rewrites `skills/playwright-cli/**/*.md`
- `.github/workflows/sync-upstream.yml` — daily: resets skills to `upstream/main`, runs transform, auto-commits

## Working on the transform

Always reset skills to upstream before iterating on the transform script:

```bash
git checkout upstream/main -- skills/playwright-cli/
```

Then run the transform and inspect the diff.

## Transform rules

Must replace bare `playwright-cli` command invocations with `npx @playwright/cli`.

Must NOT transform:
- `name: playwright-cli` (YAML frontmatter)
- `.playwright-cli/` (directory path for snapshot output)
- `playwright-cli.js` (entry point filename)
