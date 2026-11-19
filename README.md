# Piano Chord & Jazz Trainer

A piano practice app for tablet, phone and Linux desktop. It covers note reading, key signatures, songs with jazz chord symbols, and (coming next) chords, voicings and progressions.

The whole app is one HTML file. It installs as an offline web app (PWA), needs no build step and has no dependencies.

## Files

| File | Purpose |
|---|---|
| `index.html` | The entire app |
| `manifest.webmanifest` | App name, icons and colours, used when installing |
| `sw.js` | Offline cache, versioned |
| `icons/` | Home-screen and app icons |
| `scripts/bump-version.sh` | Sets the release version in `index.html` and `sw.js` |
| `CHANGELOG.md` | Release notes |

## Publish on GitHub Pages

1. Create a repository, e.g. `piano-trainer`. It can be public, or private on a plan that allows Pages for private repos.
2. Upload everything in this folder to the repo root, or push it:
   ```bash
   cd piano-trainer
   git init -b main
   git add .
   git commit -m "Piano Trainer 0.3.0"
   git remote add origin git@github.com:<your-user>/piano-trainer.git
   git push -u origin main
   ```
3. On GitHub, go to **Settings → Pages**. Under **Build and deployment**, choose **Source: Deploy from a branch** and **Branch: `main` / `(root)`**, then press **Save**.
4. After a minute the app is live at `https://<your-user>.github.io/piano-trainer/`.

The app must be served over HTTPS (GitHub Pages does this). HTTPS is required for offline use, for installing, and later for the microphone.

## Install

| Device | How |
|---|---|
| iPad / iPhone | Open the URL in **Safari** → Share button → **Add to Home Screen** |
| Android | Open in **Chrome** → menu ⋮ → **Install app** |
| Linux Mint | Open in **Chromium, Chrome or Brave** → install icon in the address bar, or menu ⋮ → *Cast, save and share* → **Install page as app**. It gets its own window and a menu entry. |

Firefox can run the app in a tab but can't install it.

After the first visit the app works fully offline.

## Release an update

```bash
scripts/bump-version.sh 0.3.1      # updates index.html and sw.js together
# add a line to CHANGELOG.md
git commit -am "0.3.1: <what changed>" && git push
```

Installed copies check for updates when the app is opened. When a new version is found they show **"New version ready → Reload"**. If you change `index.html` without bumping the version, installed apps keep the old cached copy.

## Test locally

```bash
python3 -m http.server 8000
# open http://localhost:8000
```

`localhost` counts as secure, so the offline cache and installing both work there. Opening `index.html` directly as a file also works, but without offline caching.

## Your data

- Progress, settings and your own songs are stored on each device in IndexedDB (with a localStorage fallback). Nothing is sent anywhere.
- To move data between devices: **Progress → Save backup file**, then **Open backup file** on the other device.
- Your own songs can be imported and exported as `.txt` files from the **Songs** tab. The format is explained on that page.

## Computer keyboard (desktop)

`A W S E D F T G Y H U J K O L P ;` play C up to E, like a piano layout. `Z` / `X` move down / up an octave.

`Space` starts or stops a song. `N` moves to the next note in Step mode. `Esc` leaves full view.
