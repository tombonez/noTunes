![noTunes Logo](/screenshots/app-icon.png)

![GitHub release (latest by date)](https://img.shields.io/github/v/release/tombonez/notunes)
![GitHub all releases](https://img.shields.io/github/downloads/tombonez/notunes/total)
![GitHub](https://img.shields.io/github/license/tombonez/notunes)

# Notice

The certificate used in noTunes prior to version 3.2 is set to expire on the 14th January 2022.

To continue using noTunes please update to version 3.2 or greater.

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

[noTunes-3.5.zip](https://github.com/tombonez/noTunes/releases/download/v3.5/noTunes-3.5.zip)

## Usage

### Set noTunes to launch at startup

#### Before Ventura:

Navigate to System Preferences -> Users & Groups. Under your user, select "Login Items", click the lock on the bottom left and enter your login password to make changes. Click the plus sign (+) in the main panel and search for noTunes. Select it and click "Add".

#### Ventura and later:

1. Navigate to System Settings
2. Select General
3. Select Login Items
4. Click the + under Open at Login and select noTunes

### Toggle noTunes Functionality

Left click the menu bar icon to toggle between its active states.

**Enabled (prevents iTunes/Music from opening)**

![noTunes Enabled](/screenshots/menubar-enabled.png)

**Disabled (allows iTunes/Music to open)**

![noTunes Disabled](/screenshots/menubar-disabled.png)

### Hide Menu Bar Icon

Right click or control-click the menu bar icon and click `Hide Icon`.

### Restore Menu Bar Icon

[Quit noTunes](#quit-notunes), run the following command in Terminal and re-open the app:

```bash
defaults delete digital.twisted.noTunes
```

### Quit noTunes

To quit the app either:

**With menu bar icon visible**

Right click or control-click the menu bar icon and click quit.

**With menu bar icon hidden**

Quit the app via Activity Monitor or run the following command in Terminal:

```bash
osascript -e 'quit app "noTunes"'
```

### Set replacement for iTunes / Apple Music

Replace `YOUR_MUSIC_APP` with the name of your music app in the following command.

```bash
defaults write digital.twisted.noTunes replacement /Applications/YOUR_MUSIC_APP.app
```

Then `/Applications/YOUR_MUSIC_APP.app` will launch when iTunes/Music attempts to launch.

This can be used to open a website too, for example, YouTube Music.

```bash
defaults write digital.twisted.noTunes replacement https://music.youtube.com/
```

The following command will disable the replacement.

```bash
defaults delete digital.twisted.noTunes replacement
```

## License

The code is available under the [MIT License](https://github.com/tombonez/notunes/blob/master/LICENSE).
