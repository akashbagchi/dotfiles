# Obsidian Configuration

This directory contains a clean, minimal Obsidian configuration suitable for syncing across devices via dotfiles.

## What's Included

- **Core configuration files**: Settings for appearance, core plugins, community plugins, hotkeys, etc.
- **Plugin settings**: Only the `data.json` files for each installed plugin (custom configurations)
- **Themes**: Primary and Sanctum themes (manifest and CSS only)

## What's NOT Included (Will Be Downloaded Automatically)

- Plugin installations (main.js, styles.css files) - Obsidian will download these from the community plugins store
- Workspace files - Device-specific session data (open files, window layouts)
- Icon packs - Re-downloadable if needed
- .DS_Store and other system files

## Restoring Config on a New Device

1. **Copy this directory** to your vault's `.obsidian` folder:
   ```bash
   cp -r obsidian/* /path/to/your/vault/.obsidian/
   ```

2. **Open Obsidian** - It will detect the configuration

3. **Enable Community Plugins**:
   - Go to Settings → Community Plugins
   - Turn off "Restricted Mode" if prompted
   - Click "Browse" to see available plugins
   - Your configured plugins should start downloading automatically

4. **Verify installed plugins**:
   - All plugins listed in `community-plugins.json` should be installed
   - Their settings (from `data.json` files) will be automatically applied

5. **Check appearance**:
   - Your theme, fonts, and appearance settings should already be configured
   - If themes don't appear, you may need to browse and re-download them

## Installed Plugins

The following plugins are configured (see `community-plugins.json`):
- Obsidian Git
- Calendar
- Dataview
- Homepage
- Obsidian Icon Folder
- Latex Suite
- Periodic Notes
- Smart Typography
- Style Settings
- Tracker
- And more...

## Size

This minimal config is ~50KB (vs 50MB before cleanup) - a 99.9% reduction while maintaining all essential settings.
