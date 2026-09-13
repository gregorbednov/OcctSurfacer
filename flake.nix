{
  description = "Surface relation extractor for OCCT";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          cmake
          opencascade-occt
          clang
        ];
      };
      defaultPackage.x86_64-linux = pkgs.stdenv.mkDerivation {
        pname = "OcctSurfacer";
        version = "1.0.0";
        src = ./.;
        nativeBuildInputs = [
          pkgs.cmake
          pkgs.opencascade-occt
        ];

        cmakeFlags = [ "-DBUILD_TESTING=OFF" ];

        meta.mainProgram = "OCCTSurfacer";
      };
    };
}
