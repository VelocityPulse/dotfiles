package main

import (
	"flag"
	"fmt"
	"os"
	"os/exec"
	"strings"
	"time"
)

func getGoPkg(name string) {
	spl := strings.Split(name, "/")
	pkgName := spl[len(spl)-1]

	finish := make(chan bool)
	go func() {
		cmd := exec.Command("go", "get", "-u", name)
		cmd.Run()
		finish <- true
	}()
loop:
	for {
		select {
		case <-finish:
			break loop
		default:
			for _, c := range "\\|/-\\|/-" {
				fmt.Printf("\r%c Installing %s", c, pkgName)
				time.Sleep(200 * time.Millisecond)
			}
		}
	}
	fmt.Print("\r")
}

func installGoPkg(update bool) {
	gopath := os.Getenv("GOPATH")
	if gopath == "" {
		fmt.Println("GOPATH not set")
		return
	}
	packages := []string{
		"golang.org/x/tools/cmd/goimports",
		"github.com/nsf/gocode",
		"github.com/rogpeppe/godef",
		"github.com/golang/lint/golint",
		"github.com/kisielk/errcheck",
		"golang.org/x/tools/cmd/oracle"}

	for _, pkg := range packages {
		if update || !exists(gopath+"/src/"+pkg) {
			getGoPkg(pkg)
		}
	}
}

func exists(name string) bool {
	if _, err := os.Stat(name); err != nil {
		if os.IsNotExist(err) {
			return false
		}
	}
	return true
}

func makeSymLinks() {
	pwd, err := os.Getwd()
	if err != nil {
		fmt.Println("Cannot find PWD")
		return
	}
	home := os.Getenv("HOME")
	if home == "" {
		fmt.Println("HOME not set")
		return
	}
	cfgFiles := []string{
		"/.vim",
		"/.vimrc",
		"/.zshrc",
		"/.gitconfig"}
	for _, f := range cfgFiles {
		if !exists(home + f) {
			linkTarget := pwd + f
			if err = os.Symlink(linkTarget, home+f); err != nil {
				fmt.Println("Unable to create symlink", home+f)
			}
		}
	}
}

func main() {
	updateFlag := flag.Bool("u", false, "Force update of go packages")
	flag.Parse()
	installGoPkg(*updateFlag)
	makeSymLinks()
}
