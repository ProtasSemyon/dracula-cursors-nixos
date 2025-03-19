{
  description = "Dracula Cursor Theme for NixOS";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system}.default = pkgs.stdenv.mkDerivation {
        pname = "dracula-cursors";
        version = "1.0";

        src = ./Dracula-cursors;  # Ensure this path is correct

        installPhase = ''
          mkdir -p $out/share/icons
          cp -r $src $out/share/icons/dracula-cursors
        '';

        meta = {
          description = "Dracula Cursor Theme";
          license = pkgs.lib.licenses.mit;
          platforms = pkgs.lib.platforms.linux;
        };
      };
    };
}
