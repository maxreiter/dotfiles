# dotfiles

A collection of all the configurations I use for software at work.

> Information

These dotfiles were written and are intended to be used on a system running [Arch Linux](https://archlinux.org). The configurations themselves *should* work on other Linux systems, most probably those also running `systemd`, but packages **will not** be automatically installed.

They are managed using [chezmoi](https://chezmoi.io), so that is required. Once you run `chezmoi apply`, and assuming you are on Arch, a script will be ran to automatically install required packages. The script expects you to have [yay](https://github.com/Jguer/yay) installed, otherwise it will exit with an error. See [packages.jsonc](.chezmoidata/packages.jsonc) for a list of packages that are installed.

> License

You should probably write your own configs, but see [LICENSE](LICENSE) if you want.
