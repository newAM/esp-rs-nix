{ lib
, rustPlatform
, embuild
}:

let
  cargoToml = lib.importTOML "${embuild}/ldproxy/Cargo.toml";
in
rustPlatform.buildRustPackage {
  pname = cargoToml.package.name;
  inherit (cargoToml.package) version;

  src = embuild;

  buildAndTestSubdir = "ldproxy";

  cargoLock.lockFile = ./ldproxy-Cargo.lock;

  postPatch = ''
    cp ${./ldproxy-Cargo.lock} Cargo.lock
  '';

  meta = with lib; {
    inherit (cargoToml.package) description;
    homepage = cargoToml.package.repository;
    licenses = with licenses; [ gpl3 ];
  };
}
