# claude-dev

My portable Claude Code configuration — skills, settings, and quick deployment scripts.

## Structure

```
claude-dev/
├── .claude/
│   └── settings.json          # Claude Code global settings
└── claude-skills/
    ├── sky-dev/               # My personal skills
    │   └── git-commit-standards.md
    └── community/             # Curated community skills
        ├── code-review.md
        ├── test-driven-development.md
        ├── api-documentation.md
        └── docker-best-practices.md
```

## Deploy

### Linux / macOS

```bash
git clone <repo-url> ~/claude-dev
cd ~/claude-dev

# Settings
cp .claude/settings.json ~/.claude/settings.json

# Skills
for skill in claude-skills/**/*.md; do
  name=$(basename "$skill" .md)
  mkdir -p ~/.claude/skills/$name
  cp "$skill" ~/.claude/skills/$name/SKILL.md
done
```

### Windows (PowerShell)

```powershell
git clone <repo-url> $env:USERPROFILE\claude-dev
cd $env:USERPROFILE\claude-dev

# Settings
Copy-Item .claude\settings.json $env:USERPROFILE\.claude\settings.json -Force

# Skills
Get-ChildItem claude-skills -Filter *.md -Recurse | ForEach-Object {
    $name = $_.BaseName
    New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.claude\skills\$name" | Out-Null
    Copy-Item $_.FullName "$env:USERPROFILE\.claude\skills\$name\SKILL.md" -Force
}
```

## Settings Explained

| Key | Value | Purpose |
|-----|-------|---------|
| `teammateMode` | `"tmux"` | Spawn agent teammates in tmux panes |
| `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS` | `"1"` | Enable multi-agent teams feature |

## Skills

| Skill | Category | Trigger |
|-------|----------|---------|
| `git-commit-standards` | sky-dev | Any commit operation |
| `code-review` | community | Reviewing PRs or code changes |
| `test-driven-development` | community | Writing new features or fixing bugs |
| `api-documentation` | community | Documenting endpoints or functions |
| `docker-best-practices` | community | Writing or reviewing Dockerfiles |

## Adding New Skills

1. Create `claude-skills/sky-dev/<skill-name>.md`
2. Add frontmatter:
   ```markdown
   ---
   name: skill-name
   description: "One line description"
   ---
   ```
3. Write the skill content
4. Re-run the deploy script
