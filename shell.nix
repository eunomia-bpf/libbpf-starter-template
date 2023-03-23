with import <nixpkgs> { };
(mkShell.override { stdenv = llvmPackages_14.stdenv; }) {
  name = "libbpf-template";
  nativeBuildInputs = with pkgs; [
    cmake
    pkg-config
    llvm
  ];

  buildInputs = with pkgs; [
    zlib.static
    elfutils
    openssl
    libbfd
  ];
}
