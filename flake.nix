{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

  outputs = { nixpkgs, ... }: {
    formatter.aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.nixpkgs-fmt;

    nixosConfigurations.imgx = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";

      modules = [
        {
          imports =
            [
              ./hardware-configuration.nix
            ];

          networking.hostName = "imgx";

          boot.loader.systemd-boot.enable = true;
          boot.loader.efi.canTouchEfiVariables = true;

          time.timeZone = "Europe/Warsaw";

          i18n.defaultLocale = "en_US.UTF-8";

          users.users.mgradowski = {
            isNormalUser = true;
            extraGroups = [ "wheel" ];
            packages = with nixpkgs.legacyPackages.aarch64-linux; [
              cargo
              gcc
              gnumake
              keychain
              lua-language-server
              nix-index
              nixd
              nixpkgs-fmt
              rustc
            ];
            shell = nixpkgs.legacyPackages.aarch64-linux.fish;
          };

          programs.fish.enable = true;

          environment.systemPackages = with nixpkgs.legacyPackages.aarch64-linux; [
            btop
            fish
            fzf
            git
            magic-wormhole
            neofetch
            neovim
            ripgrep
            stow
            tmux
            tree
            xfsprogs
          ];

          nix.settings.experimental-features = [ "nix-command" "flakes" ];

          services.openssh.enable = true;

          networking.firewall.enable = false;

          system.stateVersion = "23.11"; # DO NOT EDIT
        }
      ];
    };
  };
}
