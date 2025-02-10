#!/bin/bash

# Detect the package manager
PACKAGE_MANAGER="npm" # Default to npm if no lock file is detected

if [ -f "pnpm-lock.yaml" ]; then
  PACKAGE_MANAGER="pnpm"
elif [ -f "yarn.lock" ]; then
  PACKAGE_MANAGER="yarn"
elif [ -f "package-lock.json" ]; then
  PACKAGE_MANAGER="npm"
fi

echo "Detected package manager: $PACKAGE_MANAGER"


function remove_node_modules {
  # Remove all node_modules directories recursively
  echo "Removing all node_modules directories..."
  find . -name "node_modules" -type d -prune -exec rm -rf '{}' +
}

function remove_lock_files {
    echo "Removing all lock files..."
  find . -name "package-lock.json" -type f -exec rm -f '{}' +
  find . -name "yarn.lock" -type f -exec rm -f '{}' +
  find . -name "pnpm-lock.yaml" -type f -exec rm -f '{}' +
}

function clean_cache {
case $PACKAGE_MANAGER in
   pnpm)
      echo "Cleaning pnpm cache..."
      pnpm store prune
      ;;
    yarn)
      echo "Cleaning yarn cache..."
      yarn cache clean
      
      ;;
    npm)
      echo "Cleaning npm cache..."
      npm cache clean --force
      echo "Running 'npm install'..."
      npm install
      ;;
    *)
      echo "Unknown package manager. Aborting."
      exit 1
      ;;
esac

}

function install {
# Install dependencies using the detected package manager
case $PACKAGE_MANAGER in
   pnpm)
      echo "Cleaning pnpm cache..."
      pnpm store prune
      echo "Running 'pnpm install'..."
      pnpm install
      ;;
    yarn)
      echo "Cleaning yarn cache..."
      yarn cache clean
      echo "Running 'yarn install'..."
      yarn install
      ;;
    npm)
      echo "Cleaning npm cache..."
      npm cache clean --force
      echo "Running 'npm install'..."
      npm install
      ;;
    *)
      echo "Unknown package manager. Aborting."
      exit 1
      ;;
esac
}

function remove_next_dirs {
    # Remove all next directories recursively
  echo "Removing all .next directories..."
  find . -name ".next" -type d -prune -exec rm -rf '{}' +
}

remove_node_modules
remove_next_dirs
remove_lock_files

install


echo "Cleanup and installation complete."
