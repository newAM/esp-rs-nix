{ lib
, callPackage
, cargo
, rustc
}:

let
  rust = callPackage ./rust.nix { };
in
cargo.overrideAttrs (oA: rec {
  name = "cargo-xtensa";
  inherit (rust) version src cargoDeps;
  inherit rustc;

  postConfigure = ''
    unpackFile "$cargoDeps"
    mv $(stripHash $cargoDeps) vendor
    # export VERBOSE=1
  '';
})
