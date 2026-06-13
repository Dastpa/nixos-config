.PHONY: rebuild
rebuild:
	sudo nixos-rebuild switch --flake ~/nixos-config#desktop

.PHONY: home-rebuild
home-rebuild:
	home-manager switch --flake .#patrick

.PHONY: clean-generations
clean-generations:
	sudo nix-collect-garbage --delete-older-than 2d
