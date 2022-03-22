{ lib
, rustPlatform
, espmonitor
}:

let
  cargoToml = lib.importTOML "${espmonitor}/espmonitor/Cargo.toml";
in
rustPlatform.buildRustPackage {
  pname = cargoToml.package.name;
  inherit (cargoToml.package) version;

  src = espmonitor;

  buildAndTestSubdir = "espmonitor";

  cargoLock.lockFile = "${espmonitor}/Cargo.lock";

  meta = with lib; {
    inherit (cargoToml.package) description;
    homepage = cargoToml.package.repository;
    licenses = with licenses; [ gpl3 ];
  };
}
