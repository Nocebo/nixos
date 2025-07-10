{
  config,
  lib,
  pkgs,
  ...
}: {
  options.devshells.rust = lib.mkEnableOption "Enable Rust development environment";

  config = lib.mkIf config.devshells.rust {
    home.packages = with pkgs; [
      # Rust toolchain
      rustc
      cargo
      rustfmt
      rust-analyzer
      clippy
      
      # Additional Rust development tools
      cargo-watch        # Auto-rebuild on file changes
      cargo-edit         # Add/remove dependencies from command line
      cargo-outdated     # Check for outdated dependencies
      cargo-audit        # Security audit for dependencies
      cargo-expand       # Show result of macro expansion
      cargo-flamegraph   # Profiling tool
      cargo-nextest      # Next-generation test runner
      cargo-cross        # Cross-compilation helper
      
      # Development utilities
      just               # Command runner similar to make
      bacon              # Background rust code checker
    ];

    # Set up environment for Rust development
    home.sessionVariables = {
      RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    };

    # Add cargo bin to PATH
    home.sessionPath = [ "$HOME/.cargo/bin" ];

    # Configure bash with Rust-specific setup
    programs.bash = lib.mkIf config.devshells.rust {
      enable = true;
      
      # Shell aliases for Rust development
      shellAliases = {
        cb = "cargo build";
        cr = "cargo run";
        ct = "cargo test";
        cc = "cargo check";
        cf = "cargo fmt";
        clippy = "cargo clippy";
      };
      
      # Shell initialization for Rust (equivalent to environment.shellInit)
      initExtra = ''
        # Add cargo bin to PATH if not already present
        if [[ ":$PATH:" != *":$HOME/.cargo/bin:"* ]]; then
          export PATH="$HOME/.cargo/bin:$PATH"
        fi
        
        # Enable Rust completions if available
        if command -v rustup &> /dev/null; then
          source <(rustup completions bash)
        fi
        if command -v cargo &> /dev/null; then
          source <(cargo completions bash)
        fi
      '';
    };
  };
}
