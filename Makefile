
RM = /bin/rm -rfv
LN = /bin/ln -fs
CP = /bin/cp -r

all:
	@echo ""
	@echo "usage:"
	@echo ""
	@echo "* make install  -- to install dotfiles"
	@echo "* make update   -- get latest version from github, install manually"
	@echo ""

install: install-bash install-vim install-git install-gpg

install-bash:
	$(RM) ~/.bash_profile ~/.bashrc ~/.bashrc.d
	$(LN) $(realpath dot_files/bash_profile) ~/.bash_profile
	$(LN) $(realpath dot_files/bashrc) ~/.bashrc
	$(LN) $(realpath dot_files/bashrc.d) ~/.bashrc.d

install-vim:
	$(RM) ~/.vimrc
	$(LN) $(realpath dot_files/vimrc) ~/.vimrc

install-git:
	$(RM) ~/.gitconfig ~/.gitignore_global
	$(LN) $(realpath dot_files/gitconfig) ~/.gitconfig
	$(LN) $(realpath dot_files/gitignore_global) ~/.gitignore_global
	touch ~/.gitconfig_local

install-gpg:
	$(RM) ~/.gnupg/gpg.conf ~/.gnupg/gpg-agent.conf
	$(LN) $(realpath dot_files/gnupg/gpg.conf) ~/.gnupg/gpg.conf
	$(LN) $(realpath dot_files/gnupg/gpg-agent.conf) ~/.gnupg/gpg-agent.conf

update:
	git pull --verbose

.PHONY: all install update
