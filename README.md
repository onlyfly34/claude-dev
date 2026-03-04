# claude-dev

My portable Claude Code configuration — skills, settings, and quick deployment scripts.

## Structure

```
claude-dev/
├── deploy.sh                  # Deploy script (Linux/macOS)
├── deploy.ps1                 # Deploy script (Windows)
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
git clone git@github.com:onlyfly34/claude-dev.git ~/claude-dev
cd ~/claude-dev
bash deploy.sh
```

### Windows (PowerShell)

```powershell
git clone git@github.com:onlyfly34/claude-dev.git $env:USERPROFILE\claude-dev
cd $env:USERPROFILE\claude-dev
.\deploy.ps1
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
