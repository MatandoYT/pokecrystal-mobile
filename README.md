WIP Pokemon Crystal mobile restoration and localization, the most complete one as far as I know.
Contains code disassembled from the Japanese ROM.
Old version of RGBDS required, 0.3.8 should work.

Things that still need work:
- Easy Chat is not localized yet
- many graphics still need localization
- some random NPCs throughout the game might not have their original text restored yet
- translations could be a lot better

To use this properly with an already existing save file for normal Crystal:
- let the emulator create a new save for this mod, start a new game and save once you can
- open your normal Crystal save and the newly created one in a hex editor and replace the first 0x8000 bytes of the new save with the first 0x8000 bytes of your normal Crystal save

# Pokémon Crystal

This is a disassembly of Pokémon Crystal.

It builds the following ROMs:

- Pokemon - Crystal Version (UE) (V1.0) [C][!].gbc `sha1: 76f90a61e05ff4af09383227437977d22657aec2`
- Pokemon - Crystal Version (UE) (V1.1) [C][!].gbc `sha1: 01484847d9caac9c040692d17cdb99099f481e7c`
- Pokemon - Crystal Version (A) [C][!].gbc `sha1: a5ebc0b0b4ad4c721cc328f73b55af8a2422c8b4`

To set up the repository, see [INSTALL.md](INSTALL.md).

## See also

- [**FAQ**](FAQ.md)
- [**Documentation**][docs]
- [**Wiki**][wiki] (includes [tutorials][tutorials])
- **Discord:** [pret][discord]
- **IRC:** [freenode#pret][irc]

Other disassembly projects:

- [**Pokémon Red/Blue**][pokered]
- [**Pokémon Yellow**][pokeyellow]
- [**Pokémon Gold**][pokegold]
- [**Pokémon Pinball**][pokepinball]
- [**Pokémon TCG**][poketcg]
- [**Pokémon Ruby**][pokeruby]
- [**Pokémon Fire Red**][pokefirered]
- [**Pokémon Emerald**][pokeemerald]

[pokered]: https://github.com/pret/pokered
[pokeyellow]: https://github.com/pret/pokeyellow
[pokegold]: https://github.com/pret/pokegold
[pokepinball]: https://github.com/pret/pokepinball
[poketcg]: https://github.com/pret/poketcg
[pokeruby]: https://github.com/pret/pokeruby
[pokefirered]: https://github.com/pret/pokefirered
[pokeemerald]: https://github.com/pret/pokeemerald
[docs]: https://pret.github.io/pokecrystal/
[wiki]: https://github.com/pret/pokecrystal/wiki
[tutorials]: https://github.com/pret/pokecrystal/wiki/Tutorials
[discord]: https://discord.gg/6EuWgX9
[irc]: https://kiwiirc.com/client/irc.freenode.net/?#pret
[travis]: https://travis-ci.org/pret/pokecrystal
[travis-badge]: https://travis-ci.org/pret/pokecrystal.svg?branch=master
