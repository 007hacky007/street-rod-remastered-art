# Street Rod Remastered - art pack

The remastered pictures for [Street Rod Remastered](https://github.com/007hacky007/street-rod-remastered):
every picture of *Street Rod* (California Dreams, 1989) redrawn as pixel art at four times the original
resolution. The game's downloads don't include them: the launcher offers to download the latest release from
here (`Street-Rod-Remastered-art.txt`, then `Street-Rod-Remastered-art.zip`) and offers an update when a newer
one is out.

* `pack.json`: the pack format and the palette each picture was drawn in.
* `pics/<sha1>.png`: the picture, RGBA, exactly 4x the original; `<sha1>` is the SHA-1 of the original
  picture's packed bytes in the game's picture library.
* `pics/<sha1>.idx.png`: the original palette index of every texel.

How the pack is made and how the game shows it: `REMASTER.md` and `tools/remaster/README.md` in the game
repository.

## Releasing

A new or redone picture is a commit here. A tag `vN` publishes it (`.github/workflows/release.yml` runs
`tools/make-release.sh`): the zip, with the top folder `Remaster`, and the manifest with the version, the pack
format, and the zip's size and SHA-256. Launchers pick it up as the latest release.

## Rights

These pictures are derived from Street Rod's art, which belongs to its copyright owner. They are **not**
covered by the game repository's MIT license, and no license is granted for them here. The original game is
free from its copyright owner at <https://www.streetrodonline.com/downloads/>.
