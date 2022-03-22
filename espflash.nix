{ lib
, rustPlatform
, espflash
, pkg-config
, udev
}:

let
  cargoToml = lib.importTOML "${espflash}/espflash/Cargo.toml";
in
rustPlatform.buildRustPackage {
  pname = cargoToml.package.name;
  inherit (cargoToml.package) version;

  src = espflash;

  buildAndTestSubdir = "espflash";

  cargoLock.lockFile = "${espflash}/Cargo.lock";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ udev ];

  meta = with lib; {
    inherit (cargoToml.package) description;
    homepage = cargoToml.package.repository;
    licenses = with licenses; [ gpl2 ];
  };
}
