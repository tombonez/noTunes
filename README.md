![noTunes Logo](/screenshots/app-icon.png)

![GitHub release (latest by date)](https://img.shields.io/github/v/release/tombonez/notunes)
![GitHub all releases](https://img.shields.io/github/downloads/tombonez/notunes/total)
![GitHub](https://img.shields.io/github/license/tombonez/notunes)

# noTunes

noTunes is a macOS application that will prevent iTunes _or_ Apple Music from launching.

Simply launch the noTunes app and iTunes/Music will no longer be able to launch. For example, when bluetooth headphones reconnect.

You can toggle the apps functionality via the menu bar icon with a simple left click.

## Installation

### Homebrew

```bash
brew install --cask notunes
```

### Direct Download

[noTunes-3.1.zip](https://github.com/tombonez/noTunes/releases/download/v3.1/noTunes-3.1.zip)

## Usage

### Toggle noTunes Functionality

Left click the menu bar icon to toggle between its active states.

**Enabled (prevents iTunes/Music from opening)**

![noTunes Enabled](/screenshots/menubar-enabled.png)

**Disabled (allows iTunes/Music to open)**

![noTunes Disabled](/screenshots/menubar-disabled.png)

### Hide Menu Bar Icon

Right click the menu bar icon and click `Hide Icon`.

### Restore Menu Bar Icon

[Quit noTunes](#quit-notunes), run the following command in Terminal and re-open the app:

```bash
defaults delete digital.twisted.noTunes
```

### Quit noTunes

To quit the app either:

**With menu bar icon visible**

Right click the menu bar icon and click quit.

**With menu bar icon hidden**

Quit the app via Activity Monitor or run the following command in Terminal:

```bash
osascript -e 'quit app "noTunes"'
```

## License

The code is available under the [MIT License](https://github.com/tombonez/notunes/blob/master/LICENSE).
