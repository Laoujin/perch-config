# perch-config

Personal dotfiles managed by [Perch](https://github.com/Laoujin/perch-the-building).

## Modules

| Module | Platform | What it manages |
|--------|----------|-----------------|
| git | All | `.gitconfig`, `.gitignore_global`, `.gitattributes_global`, `.editorconfig` |
| bash | Linux/Mac | `.bashrc` |
| powershell | Windows | PowerShell profiles, scripts, PS modules (Posh-Git, PSReadLine, etc.) |
| vscode | All | `settings.json`, `keybindings.json`, snippets, extensions |
| beyondcompare | Windows | Settings |
| cmder | Windows | Cmder configuration |
| ditto | Windows | Registry settings (hotkeys, window position) |
| filezilla | Windows | Connection and layout config (in `programs/filezilla/`) |
| greenshot | Windows | Screenshot tool settings |
| notepadplusplus | Windows | Configuration |
| visualstudio | Windows | Visual Studio settings |
| vlc | Windows | VLC media player config |
| bun-packages | -- | Global bun packages (disabled) |

## System Packages

`packages.yaml` declares system-level software to install via winget. Perch uses winget IDs for reliable detection -- winget sees all installed software regardless of how it was installed.

## Usage

```bash
# Deploy all modules + install packages
perch deploy --config-path /path/to/this/repo

# Check what's drifted
perch status --drift-only

# Preview without making changes
perch deploy --dry-run
```

## Adding a Module

1. Create a folder with the app name
2. Add a `manifest.yaml` (see [Perch README](https://github.com/Laoujin/perch-the-building) for format)
3. Add the config files you want to manage
4. Run `perch deploy`

The config files in the module folder become the source of truth. Perch symlinks them to their expected locations -- edit in either place and the change is tracked in git.
