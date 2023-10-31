# cra-template-figmaplugin
Use create react app to build a Figma Plugin, supafast.

[![npm version](https://badge.fury.io/js/cra-template-figma-plugin.svg)](https://badge.fury.io/js/cra-template-figma-plugin)

This CRA template takes advantage of the frontend tooling offered by CRA to build Figma Plugins. Here are some of the key differences:
- `build`: Figma plugins don't have access to file system so JS/CSS are inlined with [template/src/inline-build.sh](inline-build.sh)
- Plugin Manifest: Added files for creating your [plugin manifest](https://www.figma.com/plugin-docs/manifest/)
- Plugin file: Added plugin file to show plugin when run in figma

To use this template run the following

```sh
# Clone starter
npx create-react-app yourPluginName --template cra-template-figma-plugin
# Copy files from src directory
cd yourPluginName && ./src/post-install.sh
# build plugin
pnpm run build
```

To run this plugin in Figma
1. Open figma file
2. Select an element and right click select **Plugins > Development > Import Plugin from manifest**

For more information, please refer to:

- [Figma Plugin Documentation](https://www.figma.com/plugin-docs/) - Figma Plugin Documentation
- [Getting Started](https://create-react-app.dev/docs/getting-started) – How to create a new app.
- [User Guide](https://create-react-app.dev) – How to develop apps bootstrapped with Create React App.
