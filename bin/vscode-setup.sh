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
Compulim.vscode-clock
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
jmfirth.vsc-space-block-jumper
johnpapa.vscode-peacock
jpoissonnier.vscode-styled-components
karigari.chat
mattn.Lisp
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
vscodevim.vim
yzhang.markdown-all-in-one)

echo Installing extensions
for e in ${EXTENSION[@]}; do
# loop this way so if there's an error we just continue to the next ;)
    code --install-extension $e
done
