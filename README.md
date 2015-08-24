## Mjolnir Configuration

[Mjolnir](https://github.com/sdegutis/mjolnir) is a lightweight automation and
productivity app for OS X.

---

### Installation

Make sure that you've got Mjolnir installed. Try to make sure you can run a
simple init.lua before you continue, just to ensure everything is ship shape.

Installing mjolnir should be quite easy if you have [homebrew][homebrew] and
[homebrew cask][homebrew-cask] installed. (`brew cask install mjolnir`)

Then *install* the mjolnir config:
```bash
git clone https://github.com/0robustus1/.mjolnir.git ~/.mjolnir
cd ~/.mjolnir
bash deps.sh
```

Please check the `deps.sh` beforehand, but it should only install the
dependencies of this init.lua.

Now go up to the hammer icon in your menu, click it, and select 'Reload
Config'.

You should get a fancy "Mjolnir now rests safely in your hand" message and
*cool* alert noise. Boom, installation complete.

### Usage

You should definitely check out `init.lua` for the full "how to use" experience. That's where
all of the usage is defined, after all. For a brief breakdown though, here's what does what:

* "hit" refers to pressing <kbd>⌘ + ⌃ </kbd> at once.
* "hits" refers to pressing <kbd>⌘ + ⌃ + ⇧ </kbd> at once.

| Key Combination            | Description                                              |
| ---------------------------| ---------------------------------------------------------|
| hits + <kbd>←</kbd>        | Focuses on the window to the left of the current window. |
| hits + <kbd>→</kbd>        | Focuses on the window to the right of the current window.|
| hits + <kbd>↑</kbd>        | Focuses on the window above the current window.          |
| hits + <kbd>↓</kbd>        | Focuses on the window below the current window.          |
| hit + <kbd>M</kbd>         | Maximize the current window.                             |
| hits + <kbd>M</kbd>        | Minimize the current window.                             |
| hits + <kbd>spacebar</kbd> | Toggle spotify playback                                  |
| hits + <kbd>K</kbd>        | Increase volume by increment of 5                        |
| hits + <kbd>J</kbd>        | Decrease volume by increment of 5                        |
| hits + <kbd>L</kbd>        | Skip to next song on Spotify.                            |
| hits + <kbd>H</kbd>        | Skip to previous song on Spotify.                        |

