# arch-pkgbuild-template
Description of your package

<-- remove this section after fork -->
`#TODO after clone consider add your aur package remote to git remote with aur name` 

## Installation

### Using an AUR Helper (Recommended)

#### Using yay
```bash
yay -S package-name
```

#### Using paru
```bash
paru -S package-name
```

### Manual Installation

Clone the AUR repository:
```bash
git clone https://aur.archlinux.org/package-name.git
cd package-name
```
Build and install:
```bash
# Check PKGBUILD (recommended)
less PKGBUILD

# Build package
makepkg -sf

# Install package
makepkg -si
```

## Contributing

There are several ways to contribute:

- **Package Testing**: Build, install and test new versions
- **Issue Reporting**: Report bugs, suggest improvements
- **Package Maintenance**: Submit updates, co-maintain package
- **Documentation**: Improve instructions and examples

See [CONTRIBUTING.md](CONTRIBUTING.md) for more details.

## License

[License Name] - See [LICENSE](LICENSE) for details.

## Support

- Open an issue for bug reports
- Check [AUR Package](https://aur.archlinux.org/packages/package-name) for comments
- Read [Arch Wiki](https://wiki.archlinux.org/title/Arch_User_Repository) for AUR guidelines
