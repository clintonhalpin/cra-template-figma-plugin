#!/bin/bash

# Move to the build directory.
cd build || { echo "Failed to change directory to build"; exit 1; }

# Backup the original file
cp index.html index.html.bak

# Split the file around the script tag
awk '/<script defer="defer"/ {print; nextfile} {print}' index.html > part1.html
awk '/<script defer="defer"/,0' index.html > part2.html

# Combine the files so that the script is before </body>
cat part1.html part2.html > index.html || { echo "Failed to recombine HTML parts"; exit 1; }

# Remove the temporary files
rm part1.html part2.html

# Add 'inline' attributes to the tags using sed
sed -i '' 's/<script defer="defer" src="/<script inline defer="defer" src="/g' index.html
sed -i '' 's/<link href="/<link inline href="/g' index.html
sed -i '' 's/<img src=".*\.svg"/& inline/g' index.html

# Inline the assets using inline-source
npx inline-source index.html > index_inlined.html || { echo "Failed to inline sources"; exit 1; }

# Rename the inlined file back to index.html
mv index_inlined.html index.html

## Build Plugin File
# Move back to the project root.
cd ..

# Compile the TypeScript file.
npx tsc plugin.ts --outDir build --esModuleInterop || { echo "Failed to compile plugin.ts"; }

# The file will already be named plugin.js, so there's no need to rename it.
