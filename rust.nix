{ callPackage
, fetchFromGitHub
}:

rec {
  version = "1.58.0.0";

  src = callPackage ./rust-src.nix { };

  fetchCargoTarball = callPackage ./fetch-cargo-tarball { };
  cargoDeps = fetchCargoTarball {
    inherit src;
    sha256 = "sha256-Wn41cKQl4CkT3hwfr6ivFDvBUuLfjFme+yWi7KEnpC0=";
  };
}
