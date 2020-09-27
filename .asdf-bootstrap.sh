ASDF_DIR=~/.asdf; git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR \
&& git -C $ASDF_DIR checkout `git -C $ASDF_DIR describe --abbrev=0 --tags`

asdf plugin add ruby


asdf plugin add nodejs
bash -c '${ASDF_DIR}/plugins/nodejs/bin/import-release-team-keyring'

asdf install ruby latest

# sudo apt install -y curl dirmngr gpg
# brew install gpg coreutils
asdf install nodejs latest
