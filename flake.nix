{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
  };

  outputs = { self, nixpkgs, systems } @ inputs:
    let
      forAllSystems = function:
        nixpkgs.lib.genAttrs (import systems) (system:
          function (import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [ ];
          }));
    in
    {
      packages = forAllSystems (pkgs: {
        default = pkgs.neovim;
      });

      apps = forAllSystems (pkgs: {
        default = {
          type = "app";
          program = pkgs.hello;
        };
      });

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          buildInputs = [ ];
        };
      });

      overlays.default = import ./overlay.nix;
    };
}
