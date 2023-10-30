echo "> setup figma plugin"
mv src/manifest.json manifest.json
mv src/plugin.ts plugin.ts
mv src/inline-build.sh inline-build.sh
rm -rf src/post-install.sh src/manifest.json src/plugin.ts

echo "> generate id for figma plugin"
jq --arg num "$(awk -v n=19 'BEGIN{srand(); print int(rand() * (10^n - 1 - 10^(n-1)) + 10^(n-1))}')" '.id = $num' manifest.json > temp.json && mv temp.json manifest.json

echo "> now run pnpm run build, open in figma"

