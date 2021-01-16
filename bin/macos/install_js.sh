#!/usr/bin/env bash

# legacy emacs

pkgs=(
    tern
    eslint@4.9.0
    eslint_d@5.1.0
    babel-eslint@8.0.1
    eslint-plugin-react@7.4.0
    eslint-config-airbnb@16.1.0
    eslint-plugin-import@2.8.0
    eslint-plugin-mocha@4.11.0
    eslint-plugin-jsx-a11y@6.0.2
    eslint-plugin-promise@3.5.0
)

echo "Installing packages for node version: $(node --version)"
echo "Installing packages from npm version: $(npm --version)"

for i in ${pkgs[@]}; do
    pkg=$(echo "${i}" | cut -d @ -f 1)
    npm uninstall -g ${pkg}
done

npm install -g "${pkgs[@]}"

echo "Be sure to kill any running eslint_d server!"
