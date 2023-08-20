#!/usr/bin/env bash

declare -a extensions=(
    "editorconfig.editorconfig"
    "esbenp.prettier-vscode"
    "dbaeumer.vscode-eslint"

    "timonwong.shellcheck"
    "mkhl.shfmt"

    "ms-azuretools.vscode-docker"

    "pkief.material-icon-theme"
)

for extension in "${extensions[@]}"; do
    code --install-extension "$extension"
done
