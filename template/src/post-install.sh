echo "setup figma plugin"
mv src/manifest.json manifest.json
mv src/plugin.ts plugin.ts
mv src/inline-build.sh inline-build.sh
rm -rf src/post-install.sh src/manifest.json src/plugin.ts
