{ lib
, stdenv
, espressif-llvm-project
, python3
, cmake
, ninja
}:

stdenv.mkDerivation rec {
  name = "llvm-xtensa";
  version = "13.0.0";

  src = espressif-llvm-project;

  buildInputs = [
    python3
    cmake
    ninja
  ];

  sourceRoot = "source/llvm";

  cmakeFlags = [
    "-DLLVM_ENABLE_PROJECTS='clang'"
    "-DLLVM_INSTALL_UTILS=ON"
  ];

  meta = with lib; {
    description = "LLVM xtensa";
    homepage = https://github.com/espressif/llvm-project;
    license = licenses.asl20;
  };
}
