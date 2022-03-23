{ fetchFromGitHub }:

fetchFromGitHub {
  owner = "esp-rs";
  repo = "rust";
  # https://github.com/esp-rs/rust/tree/esp-1.58.0.0
  rev = "de915f898306706ce86bd8737be9fc3f095dcc8c";
  fetchSubmodules = true;
  sha256 = "sha256-xwp2c4bKlFOQ1qoUmanFsqAzTb93Z3x2XfJOchCl59Y=";
}
