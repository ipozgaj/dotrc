install: \
	install-dirs \
	install-zsh \
	install-vim \
	install-git \
	install-tmux \
	install-ssh \
	install-mercurial \
	install-gdb \
	install-bin

install-dirs:
	mkdir -m 0700 ~/Applications ~/Documents ~/Downloads ~/Music ~/Pictures ~/Videos
	mkdir -m 0755 ~/Public

install-bin:
	if [ -d ~/bin ]; then mv ~/bin{,.bak}; else mkdir ~/bin; fi
	cp -v bin/* ~/bin

install-gdb:
	if [ -f ~/.gdbinit ]; then mv ~/.gdbinit{,.bak}; fi
	cp -v gdb/gdbinit ~/.gdbinit


install-git:
	if [ -f ~/.gitconfig ]; then mv ~/.gitconfig{,.bak}; fi
	cp -v git/gitconfig ~/.gitconfig

install-mercurial:
	if [ -f ~/.hgrc ]; then mv ~/.hgrc{,.bak}; fi
	cp -v hg/hgrc ~/.hgrc

install-ssh:
	if [ ! -d ~/.ssh ]; then mkdir -m 700 ~/.ssh; fi
	if [ -f ~/.ssh/config ]; then mv ~/.ssh/config{,.bak}; fi
	cp -v ssh/config ~/.ssh/config
	test -f ~/.ssh/authorized_keys || touch ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys

install-tmux:
	if [ -f ~/.tmux.conf ]; then mv ~/.tmux.conf{,.bak}; fi
	cp -v tmux/tmux.conf ~/.tmux.conf

install-vim:
	if [ ! -d ~/.vim/ftplugin ]; then mkdir -pm 700 ~/.vim/ftplugin; fi
	if [ -f ~/.vimrc ]; then mv ~/.vimrc{,.bak}; fi
	cp -v vim/vimrc ~/.vimrc
	cp -v vim/ftplugin/* ~/.vim/ftplugin

install-zsh:
	if [ -f ~/.zshrc ]; then mv ~/.zshrc{,.bak}; fi
	if [ -d ~/.zfunc ]; then mv ~/.zfunc{,.bak}; fi
	cp -v zsh/zshrc ~/.zshrc
	cp -rv zsh/zfunc ~/.zfunc
