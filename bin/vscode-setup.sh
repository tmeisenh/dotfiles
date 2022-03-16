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
    hashicorp.terraform
    jmfirth.vsc-space-block-jumper
    johnpapa.vscode-peacock
    jpoissonnier.vscode-styled-components
    karigari.chat
    mattn.Lisp
    ms-azuretools.vscode-docker
    ms-dotnettools.csharp
    ms-vscode-remote.remote-containers
    ms-vscode.cpptools
    naco-siren.gradle-language
    naumovs.color-highlight
    rbbit.typescript-hero
    redhat.fabric8-analytics
    redhat.java
    redhat.vscode-xml
    shd101wyy.markdown-preview-enhanced
    skyran.js-jsx-snippets
    streetsidesoftware.code-spell-checker
    stylelint.vscode-stylelint
    tomphilbin.gruvbox-themes
    VisualStudioExptTeam.vscodeintellicode
    vscjava.vscode-gradle
    vscjava.vscode-java-debug
    vscjava.vscode-java-dependency
    vscjava.vscode-java-pack
    vscjava.vscode-java-test
    vscjava.vscode-maven
    vscodevim.vim
    yzhang.markdown-all-in-one
)

echo "Removing all old extensions"
rm -rf ~/.vscode/extensions

echo "Installing new extensions"
echo Installing extensions
for e in ${EXTENSION[@]}; do
    # loop this way so if there's an error we just continue to the next ;)
    code --install-extension $e
done
echo "Done installing extensions.  Check that all extensions are enabled (some aren't for whatever reason)."
echo "If installing for the first time, configure the spacemacs keybindings in vscode 'VSpaceCode: Configure Default Settings and Keybindings'"
