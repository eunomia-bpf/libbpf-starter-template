{
  description = "libbpf starter template";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.mkShell {
          name = "libbpf-template";
          nativeBuildInputs = with pkgs; [
            clang
            llvm
            pkg-config
          ];

          packages = with pkgs; [
            elfutils
            zlib
          ];

          # See prior art in nixpkgs at:
          # * https://github.com/NixOS/nixpkgs/issues/325910
          # * https://github.com/NixOS/nixpkgs/pull/325587
          hardeningDisable = [
            "zerocallusedregs"
          ];
        };
      }
    );
}

