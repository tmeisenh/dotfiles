#!/usr/bin/env bash

echo
if brew list --cask --versions visual-studio-code >/dev/null; then
    echo "Visual Studio Code is installed"
else
    echo "Install Visual Studio Code"
    brew install --cask visual-studio-code
fi
echo

EXTENSION=(
    andys8.jest-snippets
    christian-kohler.npm-intellisense
    cssho.vscode-svgviewer
    dbaeumer.vscode-eslint
    eamodio.gitlens
    EditorConfig.EditorConfig
    Equinusocio.vsc-community-material-theme
    Equinusocio.vsc-material-theme
    equinusocio.vsc-material-theme-icons
    esbenp.prettier-vscode
    foxundermoon.shell-format
    humao.rest-client
    johnpapa.vscode-peacock
    jpoissonnier.vscode-styled-components
    karigari.chat
    ms-azuretools.vscode-docker
    ms-dotnettools.csharp
    ms-vscode-remote.remote-containers
    ms-vscode.cpptools
    ms-vsliveshare.vsliveshare
    ms-vsliveshare.vsliveshare-audio
    ms-vsliveshare.vsliveshare-pack
    naumovs.color-highlight
    rbbit.typescript-hero
    shd101wyy.markdown-preview-enhanced
    skyran.js-jsx-snippets
    streetsidesoftware.code-spell-checker
    stylelint.vscode-stylelint
    tomphilbin.gruvbox-themes
    yzhang.markdown-all-in-one)

echo Installing extensions
for e in ${EXTENSION[@]}; do
    echo $e
    code --install-extension $e
done
