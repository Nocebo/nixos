{
  config,
  lib,
  pkgs,
  ...
}: {
  options.devshells.python = lib.mkEnableOption "Enable Python development environment";

  config = lib.mkIf config.devshells.python {
    home.packages = with pkgs; [
      # Python toolchain
      python3
      python3Packages.pip
      python3Packages.virtualenv
      python3Packages.pipenv
      python3Packages.poetry
      
      # Python development tools
      python3Packages.black        # Code formatter
      python3Packages.isort        # Import sorter
      python3Packages.flake8       # Linter
      python3Packages.mypy         # Type checker
      python3Packages.pylint       # Advanced linter
      python3Packages.pytest       # Testing framework
      python3Packages.pytest-cov   # Coverage plugin for pytest
      python3Packages.tox          # Testing automation
      
      # Popular Python libraries
      python3Packages.requests     # HTTP library
      python3Packages.urllib3      # HTTP client
      python3Packages.pandas       # Data manipulation
      python3Packages.numpy        # Numerical computing
      python3Packages.matplotlib   # Plotting library
      python3Packages.jupyter      # Interactive notebooks
      python3Packages.ipython      # Enhanced interactive shell
      
      # Database connectivity
      python3Packages.psycopg2     # PostgreSQL adapter
      python3Packages.sqlalchemy   # SQL toolkit
      
      # Development utilities
      just                         # Command runner similar to make
      direnv                       # Environment management
    ];

    # Set up environment for Python development
    home.sessionVariables = {
      PYTHONPATH = "$PYTHONPATH:$HOME/.local/lib/python3.11/site-packages";
      PIP_USER = "1";  # Install packages to user directory by default
      PYTHONDONTWRITEBYTECODE = "1";  # Don't create .pyc files
      PYTHONUNBUFFERED = "1";  # Unbuffered output
    };

    # Shell configuration for Python development
    programs.bash = lib.mkIf config.devshells.python {
      enable = true;
      
      # Shell aliases for Python development
      shellAliases = {
        py = "python3";
        pip = "pip3";
        venv = "python3 -m venv";
        activate = "source venv/bin/activate";
        notebook = "jupyter notebook";
        lab = "jupyter lab";
      };
      
      # Shell initialization for Python
      initExtra = ''
        # Add user Python bin to PATH if not already present
        if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
          export PATH="$HOME/.local/bin:$PATH"
        fi
        
        # Enable Python completions
        if command -v python3 &> /dev/null; then
          eval "$(register-python-argcomplete pipx 2>/dev/null || true)"
        fi
      '';
    };
  };
}
