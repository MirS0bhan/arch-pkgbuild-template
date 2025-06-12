# General AUR package Makefile
.PHONY: all clean package srcinfo

all: package

clean:
	rm -rf pkg/
	rm -rf src/
	rm -f *.pkg.tar.zst
	rm -f *.pkg.tar.xz

package:
	makepkg -f

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

publish: push aur

push:
	git push origin main

aur: srcinfo
	git checkout main
	git checkout -B aur
	git rm -rf --cached .
	git add PKGBUILD .SRCINFO Makefile *.install *.patch *.service
	git commit -m "Update AUR package files"
	git push aur aur:master
	git checkout main

check:
	namcap PKGBUILD
	namcap *.pkg.tar.zst || namcap *.pkg.tar.xz

install:
	makepkg -si

clean-all: clean
	rm -rf ~/.cache/yay/*
	rm -rf ~/.cache/pacman/pkg/*
