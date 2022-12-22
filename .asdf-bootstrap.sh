ASDF_DIR=~/.asdf; git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR \
&& git -C $ASDF_DIR checkout `git -C $ASDF_DIR describe --abbrev=0 --tags`
source $ASDF_DIR/asdf.sh

asdf plugin add ruby
asdf install ruby latest
asdf global ruby latest

# sudo apt install -y curl dirmngr gpg
asdf plugin add nodejs
asdf install nodejs lts
