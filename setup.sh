#!/bin/sh

pwd=$(pwd)

if [ -z $GOPATH ]; then
	mkdir -p $HOME/dev/go/{bin,src,pkg}
	export GOPATH=$HOME/go
fi

ln -s $pwd/.vim $HOME/.vim
ln -s $pwd/.vim/vimrc $HOME/.vimrc
ln -s $pwd/.zshrc $HOME/.zshrc
ln -s $pwd/.gitconfig $HOME/.gitconfig

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
