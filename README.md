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

## ToDo

* Package esp-rs compiler fork
* Create a devshell that can compile the hello world

## References

* [sdobz/rust-esp-nix](https://github.com/sdobz/rust-esp-nix)
* [Using Nix to write rust on the esp32](https://specific.solutions.limited/projects/hanging-plotter/esp-rust)

[esp-rs]: https://github.com/esp-rs
[nix]: https://nixos.org/
[nixpkgs repository]: https://github.com/NixOS/nixpkgs
