{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    espflash = {
      url = "github:esp-rs/espflash";
      flake = false;
    };
    espmonitor = {
      url = "github:esp-rs/espmonitor";
      flake = false;
    };
    embuild = {
      url = "github:ivmarkov/embuild";
      flake = false;
    };
    espressif-llvm-project = {
      url = "github:espressif/llvm-project/xtensa_release_13.0.0";
      flake = false;
    };
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    , espflash
    , espmonitor
    , embuild
    , espressif-llvm-project
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let pkgs = nixpkgs.legacyPackages.${system}; in
    rec {
      packages = flake-utils.lib.flattenTree {
        cargo-espflash = pkgs.callPackage ./cargo-espflash.nix { inherit espflash; };
        cargo-espmonitor = pkgs.callPackage ./cargo-espmonitor.nix { inherit espmonitor; };
        espflash = pkgs.callPackage ./espflash.nix { inherit espflash; };
        espmonitor = pkgs.callPackage ./espmonitor.nix { inherit espmonitor; };
        ldproxy = pkgs.callPackage ./ldproxy.nix { inherit embuild; };
        llvm-xtensa = pkgs.callPackage ./llvm-xtensa.nix { inherit espressif-llvm-project; };
      };
      apps = {
        cargo-espflash = flake-utils.lib.mkApp { drv = packages.cargo-espflash; };
        cargo-espmonitor = flake-utils.lib.mkApp { drv = packages.cargo-espmonitor; };
        espflash = flake-utils.lib.mkApp { drv = packages.espflash; };
        espmonitor = flake-utils.lib.mkApp { drv = packages.espmonitor; };
        ldproxy = flake-utils.lib.mkApp { drv = packages.ldproxy; };
      };
    }
    );
}
