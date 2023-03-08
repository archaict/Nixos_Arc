# Codium

- [Codium](#codium)
  - [Settings](#settings)
    - [BOF settings.json](#bof-settingsjson)
    - [Theme](#theme)
    - [Default Settings](#default-settings)
    - [Terminal](#terminal)
    - [Vim](#vim)
      - [Vim Settings](#vim-settings)
      - [Vim Keybindings](#vim-keybindings)
    - [Language](#language)
    - [EOF settings.json](#eof-settingsjson)

*Config file for vscodium.*

## Settings

### BOF settings.json

```json tangle:settings.json
{
```

### Theme

```json tangle:settings.json
  "workbench.colorTheme": "Ayu Light",
  "workbench.editor.showTabs": false,
  "workbench.iconTheme": "material-icon-theme",
  "editor.fontFamily": "'Iosevka', 'Droid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback'",
  "editor.fontSize": 14,
  "editor.fontWeight": "700",
  "editor.fontLigatures": true,
  "editor.cursorBlinking": "phase",
  "editor.minimap.enabled": false,
  "workbench.activityBar.visible": false,
  "window.titleBarStyle": "native",
  "workbench.colorCustomizations": {
  "workbench.activityBar.visible": false,
    "editorOverviewRuler.addedForeground": "#0000",
    "editorOverviewRuler.modifiedForeground": "#0000",
    "editorOverviewRuler.deletedForeground": "#0000",
    //   "statusBar.background": "#0f1419",
    //   "statusBar.noFolderBackground": "#0f1419",
    //   "statusBar.debuggingBackground": "#0f1419",
    // "statusBar.debuggingForeground": "#D1D5D9",
    // "statusBar.foreground": "#D1D5D9"
  },

  "breadcrumbs.enabled": true,

  "editor.tokenColorCustomizations": {
    "textMateRules": [ {
        "name": "Comment",
        "scope": [ "comment", "comment.block", "comment.block.documentation",
          "comment.line", "comment.line.double-slash", "punctuation.definition.comment" ],
        "settings": { "fontStyle": "italic" }
      } ]
  },

  // Errors
  "errorLens.enabled": true,
  "errorLens.fontFamily": "Iosevka",
```

### Default Settings

```json tangle:settings.json
  // Default Editor Settings
  "editor.tabSize": 4,
  "editor.insertSpaces": true,
  "files.autoSave": "off",
  "editor.smoothScrolling": false,
  "editor.cursorSmoothCaretAnimation": false,
  "security.workspace.trust.enabled": false,
  "window.customMenuBarAltFocus": false,
  "window.menuBarVisibility": "hidden",
  "telemetry.telemetryLevel": "off",

  // Modeline: Date
  "dateTime.showAMPM": true,
  "dateTime.showDayOfWeek": true,
  "dateTime.showDayOfMonth": true,
  "dateTime.use24HourClock": false,
  "dateTime.showMonth": true,
  "dateTime.customFormat": "dddd, MMMM [the] Do, YYYY | hh:mm A",
```

### Terminal

```json tangle:settings.json
  // Terminal
  "terminal.external.linuxExec": "fish",
  "terminal.integrated.fontFamily":"Iosevka",
  "terminal.integrated.fontWeight": "700",
  "terminal.integrated.cursorBlinking": false,
  "terminal.integrated.cursorStyle": "block",
```

### Vim

#### Vim Settings

```json tangle:settings.json

 // Neovim
  // "vscode-neovim.neovimExecutablePaths.linux": "/run/current-system/sw/bin/nvim",
  // "vscode-neovim.neovimInitVimPaths.linux": "/etc/nixos/codex/core/codium/init.vim",

 // Vim Settings
  "vim.enable": true,
  "vim.debug.silent": true
  "vim.leader": "<Space>",
  "vim.easymotion": true,
  "vim.foldfix": true,
  "vim.gdefault": true,
  "vim.hlsearch": true,
  "vim.replaceWithRegister": true,
  "vim.smartRelativeLine": true,
  "vim.sneak": true,
  "vim.sneakReplacesF": true,
  "vim.sneakUseIgnorecaseAndSmartcase": true,
  "vim.useSystemClipboard": true,
  "vim.vimrc.enable": true,
  "vim.vimrc.path": "$HOME/.config/VSCodium/User/.vimrc",
```

#### Vim Keybindings

- Normal
```json tangle:settings.json
  // Vim Keybindings
  "vim.normalModeKeyBindings": [

    // Defaults
    { "before": [ ";" ], "after": [ ":" ] },
    { "before": [ "<Leader>", "q", "r" ], "commands": [ "workbench.action.reloadWindow" ] },
    { "before": [ "<Leader>", "q", "q", "q" ], "commands": [ "workbench.action.closeWindow" ] },

    // Movements
    { "before": [ "j" ], "after": [ "g", "j" ] },
    { "before": [ "k" ], "after": [ "g", "k" ] },
    { "before": [ "J" ], "after": [ "8", "j" ] },
    { "before": [ "K" ], "after": [ "8", "k" ] },
    { "before": [ "H" ], "after": [ "^" ] },
    { "before": [ "L" ], "after": [ "$" ] },

    { "before": [ "<Leader>", "w", "w" ], "commands": [ "workbench.action.focusNextGroup" ] },

    // Splits
    { "before": [ "<Leader>", "w", "v" ], "commands": [ "workbench.action.splitEditor" ] },
    { "before": [ "<Leader>", "w", "s" ], "commands": [ "workbench.action.splitEditorDown" ] },
    { "before": [ "<Leader>", "w", "o" ], "commands": [ "workbench.action.closeEditorsInOtherGroups","workbench.action.closeSidebar" ] },

    // [Vim] Buffer
    { "before": [ "<Leader>", "k", "k" ], "after": [ "g","T" ] },
    { "before": [ "<Leader>", "j", "j" ], "after": [ "g","t" ] },

    { "before": [ "<Leader>", "b", "k" ], "commands": [ "workbench.action.closeActiveEditor" ] },
    { "before": [ "<Leader>", "b", "b" ], "commands": [ "workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup" ] },

    // [Vim] Terminal
    { "before": [ "<Leader>", "o","t" ], "commands": [ "workbench.action.terminal.toggleTerminal" ] },
    { "before": [ "<Leader>", "o","T" ], "commands": [ "workbench.action.createTerminalEditor" ] },

    { "before": [ "<Leader>", "Q" ], "commands": [ "workbench.action.closeWindow" ] },
    { "before": [ "<Leader>", "g","l" ], "commands": [ "workbench.action.gotoLine" ] },

    { "before": [ "<Leader>", "w", "q" ], "commands": [ "workbench.action.closeEditorsInGroup" ] },

    { "before": [ "<Leader>", "g", "g" ], "commands": [ "magit.status" ] },
    { "before": [ "<Leader>", "/" ], "commands": [ "workbench.action.findInFiles" ] },

    // File Utils
    { "before": [ "<Leader>", "f", "R" ], "commands": [ "fileutils.renameFile" ] },
    { "before": [ "<Leader>", "n", "t" ], "commands": [ "foam-vscode.open-daily-note" ] },
    { "before": [ "<Leader>", "n", "n" ], "commands": [ "explorer.newFile" ] },
    { "before": [ "<Leader>", "n", "x" ], "commands": [ "deleteFile" ] },

    // Folder Navigation
    { "before": [ "<Leader>", "." ], "commands": [ "file-browser.open" ] },
    { "before": [ "<Leader>", "d", "d" ], "commands": [ "file-browser.open" ] },
    { "before": [ "<Leader>", "f", "f" ], "commands": [ "workbench.action.quickOpen" ] },
    { "before": [ "<Leader>", "f", "r" ], "commands": [ "workbench.action.quickOpen" ] },

    // Theme Selector
    { "before": [ "<Leader>", "h", "t" ], "commands": [ "workbench.action.selectTheme" ] },

    // Other
    { "before": [ "<tab>" ], "after": [ "z", "a" ] },
    { "before": [ "<Leader>", "m", "m", "p" ], "commands": [ "editor.action.formatDocument" ] },
    { "before": [ "<Leader>", "a" ], "commands": [ "editor.action.quickFix" ] },
```

- Tasks
```json tangle:settings.json
    // Tasks
    { "before": ["leader", "T"], "after": [], "commands": [ {
       "command": "workbench.action.tasks.runTask", "args": "Tangle Config" } ] },
    { "before": ["leader", "t", "t" ], "after": [], "commands": [ {
       "command": "workbench.action.tasks.runTask", "args": "Tangle Config" } ] },

    { "before": ["leader", "N", "i"], "after": [], "commands": [ {
       "command": "workbench.action.tasks.runTask", "args": "Update NixOS" } ] },

    { "before": ["leader", "N", "n"], "after": [], "commands": [ {
       "command": "workbench.action.tasks.runTask", "args": "Network CLI" } ] },

    { "before": ["leader", "h", "W"], "after": [], "commands": [ {
       "command": "workbench.action.tasks.runTask", "args": "Change Wallpaper: Wal" } ] },
    { "before": ["leader", "h", "w"], "after": [], "commands": [ {
       "command": "workbench.action.tasks.runTask", "args": "Change Wallpaper: Feh" } ] },

    { "before": ["leader", "t", "s", "n"], "after": [], "commands": [ {
       "command": "workbench.action.tasks.runTask", "args": "Soundpeats On" } ] },
    { "before": ["leader", "t", "s", "f"], "after": [], "commands": [ {
       "command": "workbench.action.tasks.runTask", "args": "Soundpeats Off" } ] },

    { "before": ["leader", "Q", "Q", "R"], "after": [], "commands": [ {
       "command": "workbench.action.tasks.runTask", "args": "Daijoubu" } ] },
    { "before": ["leader", "Q", "Q", "Q"], "after": [], "commands": [ {
       "command": "workbench.action.tasks.runTask", "args": "Sayonara" } ] },

    { "before": [ "<Leader>", "<Return>" ], "commands": [ "bookmarks.listFromAllFiles" ] },
```

- Other
```json tangle:settings.json
    // Markdown
    { "before": [ "<Return>" ], "commands": [ "editor.action.openLink" ], "when": "editorLangId == markdown" },
    { "before": [ "<Leader>", "o", "m" ], "commands": [ "markdown.extension.checkTaskList" ], "when": "editorLangId == markdown" },
    { "before": [ "<Leader>", "m", "b" ], "commands": [ "markdown.extension.editing.toggleCodeBlock" ], "when": "editorLangId == markdown" },

    { "before": [ "<Leader>", "[" ], "commands": [ "workbench.action.navigateBack" ], "when": "editorLangId == markdown" },
    { "before": [ "<Leader>", "]" ], "commands": [ "workbench.action.navigateForward" ], "when": "editorLangId == markdown" },

    { "before": [ "<Leader>", "k", "k" ], "commands": [ "workbench.action.navigateBack" ], "when": "editorLangId == markdown" },
    { "before": [ "<Leader>", "j", "j" ], "commands": [ "workbench.action.navigateForward" ], "when": "editorLangId == markdown" },

    // Bookmarks
    { "before": [ "<Leader>", "M", "a" ], "commands": [ "bookmarks.toggleLabeled" ] },
    { "before": [ "<Leader>", "M", "d" ], "commands": [ "bookmarks.toggleLabeled" ] },

  ],

  "vim.visualModeKeyBindings": [
    { "before": [ "H" ], "after": [ "^" ] },
    { "before": [ "L" ], "after": [ "$", "<Left>"] },
    // { "before": ["J"], "after": ["8", "j"] },
    // { "before": ["K"], "after": ["8", "k"] }
    { "before": [ "<Leader>", "a" ], "commands": [ "editor.action.quickFix" ] },
  ],
  "vim.insertModeKeyBindings": [
    { "before": [ "j", "k" ], "after": [ "<Esc>" ] }
  ],

```

### Language

```json tangle:settings.json
  // Language

  "markdown.extension.syntax.plainTheme": true,
  "markdown.extension.toc.updateOnSave"	: true,
  "[markdown]": {
    "editor.quickSuggestions": {
      "other": true,
      "comments": false,
      "strings": true
    }
  },
  "[javascript]": {
    "editor.defaultFormatter": "vscode.typescript-language-features"
  },
  "[jsonc]": {
    "editor.defaultFormatter": "vscode.json-language-features"
  },
  "[nix]": {
    "editor.defaultFormatter": "jnoortheen.nix-ide"
  },
  "update.mode": "none",
  "emmet.includeLanguages": {
    "javascript": "javascriptreact"
  },
  "emmet.triggerExpansionOnTab": true,
  "sshfs.configs": [
    {
      "name": "nixos-lora",
      "host": "192.168.68.125",
      "port": 9090,
      "label": "NixOS LoRa",
      "agent": "$SSH_AUTH_SOCK",
      "username": "lora",
      "privateKeyPath": "/home/archaict/.ssh/nixos-lora",
      "passphrase": true,
      "newFileMode": "0o777"
    }
  ],

  "yaml.schemas": {
    "file:///home/archaict/.vscode-oss/extensions/atlassian.atlascode-2.10.11/resources/schemas/pipelines-schema.json": "bitbucket-pipelines.yml"
  },
  "atlascode.bitbucket.explorer.enabled": true,
  "atlascode.jira.explorer.fetchAllQueryResults": true,
  "redhat.telemetry.enabled": false,
  "atlascode.jira.explorer.enabled": true,

  "foam.openDailyNote.directory": "./Journal",
  "foam.openDailyNote.filenameFormat": "'Journal'-yyyy-mm-dd",
  "foam.openDailyNote.titleFormat": "'Journal Entry // 'dddd, mmmm d yyyy",

  // RevealJS
  "revealjs.theme": "white",
  "revealjs.highlightTheme": "zenburn",
  "revealjs.progress": true,

  "atlascode.jira.jqlList": [
    {
      "id": "418e64c4-7f6d-4819-b32f-f34d94f8af10",
      "siteId": "a122469e-2e7a-42bb-ae27-fa06b0002761",
      "name": "All Issue",
      "enabled": true,
      "monitor": true
    }
  ],
  "atlascode.jira.explorer.nestSubtasks": false,
  "codestream.serverUrl": "https://api.codestream.com",
  "codestream.email": "crosley40@gmail.com",

  "workbench.startupEditor": "none",
  "bookmarks.saveBookmarksInProject": true,
  "path-intellisense.absolutePathToWorkspace": false

```

### EOF settings.json

```json tangle:settings.json
}
```
