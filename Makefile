PKGNAME := $(shell grep -m1 'pkgname = ' .SRCINFO | cut -d' ' -f3)
PKGVER := $(shell grep -m1 'pkgver = ' .SRCINFO | cut -d' ' -f3)
PKGREL := $(shell grep -m1 'pkgrel = ' .SRCINFO | cut -d' ' -f3)
PKGDESC := $(shell grep -m1 'pkgdesc = ' .SRCINFO | cut -d' ' -f3-)

.PHONY: all clean package srcinfo publish check install info

info:
	@echo "Package: $(PKGNAME)"
	@echo "Version: $(PKGVER)-$(PKGREL)"
	@echo "Description: $(PKGDESC)"

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
	git commit -m "Update $(PKGNAME) $(PKGVER)-$(PKGREL)"
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
