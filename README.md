# esp-rs with nix

[esp-rs] is a project that contains libraries, crates and examples for using Rust on Espressif SoC's.

This packages tools from [esp-rs] with [nix].

## Tools

* [`cargo-espflash`](https://github.com/esp-rs/espflash)
* [`cargo-espmonitor`](https://github.com/esp-rs/espmonitor)
* [`espflash`](https://github.com/esp-rs/espflash)
* [`espmonitor`](https://github.com/esp-rs/espmonitor)
* [`ldproxy`](https://github.com/ivmarkov/embuild)

## Usage

1. [Install NixOS or nixpkgs](https://nixos.org/download.html)
2. Enable [nix flakes](https://nixos.wiki/wiki/Flakes)
3. Run a tool, e.g. `nix run github:newam/esp-rs-nix#espflash`

## Compiling Code

At the moment anything that depends on the esp-idf will fail to compile.  Pure rust respoitories will compile.

[esp-hal@02c5f4564b0fca1321b18e98e66e124a0b276643](https://github.com/esp-rs/esp-hal/tree/02c5f4564b0fca1321b18e98e66e124a0b276643):

```bash
nix develop github:newAM/esp-rs-nix -i -L -c cargo -Z build-std build --target xtensa-esp32-none-elf -p esp32-hal
```

## References

* [sdobz/rust-esp-nix](https://github.com/sdobz/rust-esp-nix)
* [Using Nix to write rust on the esp32](https://specific.solutions.limited/projects/hanging-plotter/esp-rust)
* [tomjnixon/nix-esp-idf](https://github.com/tomjnixon/nix-esp-idf)

[esp-rs]: https://github.com/esp-rs
[nix]: https://nixos.org/
[nixpkgs repository]: https://github.com/NixOS/nixpkgs
