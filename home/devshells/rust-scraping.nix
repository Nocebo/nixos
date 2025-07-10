{
  config,
  lib,
  pkgs,
  ...
}: {
  options.devshells.rust-scraping = lib.mkEnableOption "Enable Rust web scraping development environment";

  config = lib.mkIf config.devshells.rust-scraping {
    home.packages = with pkgs; [
      # Base Rust toolchain
      rustc
      cargo
      rustfmt
      rust-analyzer
      clippy
      
      # Essential Rust development tools
      cargo-watch        # Auto-rebuild on file changes
      cargo-edit         # Add/remove dependencies from command line
      cargo-audit        # Security audit for dependencies
      cargo-nextest      # Next-generation test runner
      
      # Web scraping and HTTP tools
      curl               # Command line HTTP client
      wget               # Web content downloader
      httpie             # Modern HTTP client
      
      # HTML/XML processing tools
      htmlq              # HTML processor using CSS selectors
      pup                # HTML processor and parser
      jq                 # JSON processor
      yq-go              # YAML/XML processor
      
      # Text processing utilities
      ripgrep            # Fast text search
      fd                 # Find alternative
      sd                 # Sed alternative
      
      # Development utilities
      just               # Command runner similar to make
      bacon              # Background rust code checker
    ];

    # Set up environment for Rust scraping development
    home.sessionVariables = {
      RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
      CURL_CA_BUNDLE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
    };

    # Add cargo bin to PATH
    home.sessionPath = [ "$HOME/.cargo/bin" ];

    # Shell aliases for Rust scraping development
    programs.bash.shellAliases = lib.mkIf config.devshells.rust-scraping {
      cb = "cargo build";
      cr = "cargo run";
      ct = "cargo test";
      cc = "cargo check";
      cf = "cargo fmt";
      clippy = "cargo clippy";
      
      # Scraping aliases
      scrape-headers = "curl -I";
      scrape-robots = "curl -s";
      check-ssl = "openssl s_client -connect";
    };
  };
}
