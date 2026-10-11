# Homebrew tap for Cavvy

[Cavvy](https://cavvy.app) is a native macOS home for coding agents.

```sh
brew install --cask mojm-development/tap/cavvy
```

Cavvy updates itself. `brew upgrade` works too.

## Pflege

Gepflegt wird dieses Repo auf git.mojm.de (`cavvy/homebrew-tap`); GitHub ist ein
Push-Spiegel, dort nichts direkt ändern. Version und Prüfsumme in `Casks/cavvy.rb`
setzt beim Release `make cask` im App-Repo, aus dem notarisierten DMG in `dist/`.
