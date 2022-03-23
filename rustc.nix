{ lib
, callPackage
, llvm-xtensa
, rustc
}:

let
  rust = callPackage ./rust.nix { };
in
rustc.overrideAttrs (oA: rec {
  pname = "rustc-xtensa";
  inherit (rust) version src cargoDeps;

  llvmSharedForBuild = llvm-xtensa;
  llvmSharedForHost = llvm-xtensa;
  llvmSharedForTarget = llvm-xtensa;
  llvmShared = llvm-xtensa;

  configureFlags =
    (lib.lists.remove "--enable-llvm-link-shared"
      (lib.lists.remove "--release-channel=stable" oA.configureFlags)) ++ [
      "--llvm-root=${llvm-xtensa}"
      "--experimental-targets=Xtensa"
      "--release-channel=nightly"
    ];

  postConfigure = ''
    ${oA.postConfigure}
    unpackFile "$cargoDeps"
    mv $(stripHash $cargoDeps) vendor
    # export VERBOSE=1
  '';

  postInstall = ''
    ${oA.postInstall}
    mkdir -p $out/lib/rustlib/src
    ln -s $src $out/lib/rustlib/src/rust
    mkdir $out/vendor
    ln -s $src/library/rustc-std-workspace-alloc $out/vendor/rustc-std-workspace-alloc
    ln -s $src/library/rustc-std-workspace-core $out/vendor/rustc-std-workspace-core
    ln -s $src/library/rustc-std-workspace-std $out/vendor/rustc-std-workspace-std
  '';
})
