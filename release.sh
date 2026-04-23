#!/bin/sh
set -e

VERSION=$(node -p "require('./package.json').version")
TAG="v$VERSION"
ARCHIVE="$TAG.tar.gz"

echo "Releasing $TAG..."

# Build
pnpm install
pnpm run copy

# Create archive
tar -czf "$ARCHIVE" denhaagtheme/

# Create git tag and push
git tag "$TAG"
git push origin "$TAG"

# Create GitHub release with asset
gh release create "$TAG" "$ARCHIVE" --title "$TAG" --notes ""

# Cleanup
rm "$ARCHIVE"
pnpm run clean

echo "Done! Release $TAG published."
