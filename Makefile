
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

install: install-bash install-vim install-git install-gpg install-iterm

install-bash:
	$(RM) ~/.bash_profile ~/.bashrc ~/.bashrc.d ~/.zshrc
	$(LN) $(realpath dot_files/bash_profile) ~/.bash_profile
	$(LN) $(realpath dot_files/bashrc) ~/.bashrc
	$(LN) $(realpath dot_files/bashrc.d) ~/.bashrc.d
	$(LN) $(realpath dot_files/zshrc) ~/.zshrc

install-vim:
	$(RM) ~/.vimrc
	$(LN) $(realpath dot_files/vimrc) ~/.vimrc

install-git:
	$(RM) ~/.gitconfig ~/.gitignore_global
	$(LN) $(realpath dot_files/gitconfig) ~/.gitconfig
	$(LN) $(realpath dot_files/gitignore_global) ~/.gitignore_global
	touch ~/.gitconfig_local
	for SOURCE in $(realpath git_commands)/*; do \
		TARGET="/usr/local/bin/git-$$(basename $$SOURCE)"; \
		$(RM) $$TARGET; \
		$(LN) $$SOURCE $$TARGET; \
	done

install-gpg:
	mkdir -p ~/.gnupg
	$(RM) ~/.gnupg/gpg.conf ~/.gnupg/gpg-agent.conf
	$(LN) $(realpath dot_files/gnupg/gpg.conf) ~/.gnupg/gpg.conf
	$(LN) $(realpath dot_files/gnupg/gpg-agent.conf) ~/.gnupg/gpg-agent.conf

install-iterm:
	$(LN) $(realpath iterm2_profiles.json) ~/Library/Application\ Support/iTerm2/DynamicProfiles/

update:
	git pull --verbose

.PHONY: all install update
