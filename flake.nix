{
  description = "Config...";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "github:osipog/nix-firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fcitx5-im-emoji-picker = {
      url = "github:lillongg/nix-fcitx5-im-emoji-picker";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      firefox-addons,
      fcitx5-im-emoji-picker,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs-stable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.TNonggChann-no-PC = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit
            pkgs-stable
            inputs
            system
            ;
        };

        modules = [
          ./nixos/configuration.nix
        ];
      };

      homeConfigurations.TNonggChann = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            firefox-addons.overlays.default
            fcitx5-im-emoji-picker.overlays.default
          ];
        };
        modules = [
          ./home-manager/TNonggChann.nix
        ];
        extraSpecialArgs = {
          inherit pkgs-stable;
          osConfig = self.nixosConfigurations.TNonggChann-no-PC.config;
        };
      };
    };
}
