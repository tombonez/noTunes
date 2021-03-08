![noTunes Logo](/screenshots/app-icon.png)

# noTunes

noTunes is a macOS application that will prevent iTunes _or_ Apple Music from launching.

Simply launch the noTunes app and iTunes/Music will no longer be able to launch. For example, when bluetooth headphones reconnect to a laptop which may trigger iTunes/Music to open.

You can enable/disable the apps functionality via the menu bar icon, which is a simple toggle.

## Usage

Left clicking the menu bar icon will toggle between its active states.

**Enabled**

![noTunes Enabled](/screenshots/menubar-enabled.png)

**Disabled**

![noTunes Disabled](/screenshots/menubar-disabled.png)

To quit the app either:

**Menu bar version**

Right click the menu bar icon and click quit.

**No menu bar version**

Either quit the app via Activity Monitor or run the following command in the terminal:

```bash
osascript -e 'quit app "noTunes"'
```

## Downloads

noTunes 3.0 (with menu bar icon): [noTunes-3.0.zip](https://github.com/tombonez/noTunes/releases/download/v3.0/noTunes-3.0.zip)

noTunes 3.0 (without menu bar icon): [noTunes-3.0-noMenu.zip](https://github.com/tombonez/noTunes/releases/download/v3.0/noTunes-3.0-noMenu.zip)
