$RepoDir = $PSScriptRoot
$ClaudeDir = "$env:USERPROFILE\.claude"

Write-Host "Deploying Claude Code config..."

# Settings
New-Item -ItemType Directory -Force -Path $ClaudeDir | Out-Null
Copy-Item "$RepoDir\.claude\settings.json" "$ClaudeDir\settings.json" -Force
Write-Host "  v settings.json"

# Skills
Get-ChildItem "$RepoDir\claude-skills" -Filter *.md -Recurse | ForEach-Object {
    $name = $_.BaseName
    New-Item -ItemType Directory -Force -Path "$ClaudeDir\skills\$name" | Out-Null
    Copy-Item $_.FullName "$ClaudeDir\skills\$name\SKILL.md" -Force
    Write-Host "  v skill: $name"
}

Write-Host "Done. Restart Claude Code to apply changes."
