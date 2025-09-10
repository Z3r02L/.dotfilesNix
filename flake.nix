{
  description = "Модульная конфигурация NixOS с Roles и Standalone Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-alien = {
      url = "github:thiagokokada/nix-alien";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    prism = {
      url = "github:IogaMaster/prism";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
    };

    stylix.url = "github:nix-community/stylix";
    ags.url = "github:Aylur/ags/v1";
    persist-retro.url = "github:Geometer1729/persist-retro";

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    nix-minecraft.inputs.nixpkgs.follows = "nixpkgs";

    nix-ai-tools.url = "github:numtide/nix-ai-tools";

    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, stylix, nix-ai-tools, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;

    # unstable-pkgs =

      overlays = [
        (final: prev: {
          unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        })
      ];

    };

    # pkgs-unstable = import nixpkgs-unstable {
    #   inherit system;
    #   config.allowUnfree = true;
    # };
  in {
    # Системные конфигурации NixOS (БЕЗ home-manager)
    nixosConfigurations = {
      zerg = nixpkgs.lib.nixosSystem {
        inherit system;
        inherit pkgs;
        modules = [
          ./hosts/zerg/default.nix
          ./roles/workstation.nix
          ./modules/core/default.nix
          ./modules/desktop/programs.nix
          ./modules/development/default.nix
          ./modules/security/default.nix
          # ./modules/core/nix.nix # Оптимизации Nix
        ];
        specialArgs = {
          inherit (nixpkgs) lib;
          inherit system;
        };
      };
    };

    # Standalone конфигурации home-manager
    homeConfigurations = {
     zerg = home-manager.lib.homeManagerConfiguration {
       pkgs = pkgs;
       modules = [
         ./home-manager/zerg/home.nix
       ];
       extraSpecialArgs = {
         inherit nix-ai-tools;
       };
     };
    };

    # Development shells
    devShells.${system} = {
      default = pkgs.mkShell {
        buildInputs = with pkgs; [
          nixpkgs-fmt
          nil
        ];
      };
    };
  };
}
