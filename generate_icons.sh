#!/bin/bash

# Create the output directory if it doesn't exist
mkdir -p MammaMia/Resources/Assets.xcassets/AppIcon.appiconset

# Base image
magick MammaMia/Resources/Assets.xcassets/logo.imageset/logo.png -background white -gravity center -resize 1024x1024 -extent 1024x1024 MammaMia/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-1024.png

# iPhone notification icon (20pt)
magick MammaMia/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-1024.png -resize 40x40 MammaMia/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-20@2x.png
magick MammaMia/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-1024.png -resize 60x60 MammaMia/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-20@3x.png

# iPhone settings icon (29pt)
magick MammaMia/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-1024.png -resize 58x58 MammaMia/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-29@2x.png
magick MammaMia/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-1024.png -resize 87x87 MammaMia/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-29@3x.png

# iPhone spotlight icon (40pt)
magick MammaMia/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-1024.png -resize 80x80 MammaMia/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-40@2x.png
magick MammaMia/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-1024.png -resize 120x120 MammaMia/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-40@3x.png

# iPhone app icon (60pt)
magick MammaMia/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-1024.png -resize 120x120 MammaMia/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-60@2x.png
magick MammaMia/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-1024.png -resize 180x180 MammaMia/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-60@3x.png

echo "App icons generated successfully!" 