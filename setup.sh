#!/bin/sh

if [ -z $GOROOT ]; then
	echo "It seems that go is not installed, please install go and retry"
	exit
fi

if [ -z $GOPATH ]; then
	mkdir -p $HOME/dev/go/{bin,src,pkg}
	export GOPATH=$HOME/go
fi

ln -s ./.vim $HOME/.vim
ln -s ./.vim/vimrc .vimrc
ln -s ./.zshrc $HOME/.zshrc

# goimports
go get -u golang.org/x/tools/cmd/goimports

# gocode
go get -u github.com/nsf/gocode

# godef
go get -u github.com/rogpeppe/godef

# golint
go get -u github.com/golang/lint/golint

# errcheck
go get -u github.com/kisielk/errcheck

# oracle
go get -u golang.org/x/tools/cmd/oracle
