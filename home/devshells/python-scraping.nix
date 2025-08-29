{
  config,
  lib,
  pkgs,
  ...
}: {
  options.devshells.python-scraping = lib.mkEnableOption "Enable Python web scraping development environment";

  config = lib.mkIf config.devshells.python-scraping {
    home.packages = with pkgs; [
      # Base Python toolchain
      python3
      python3Packages.pip
      python3Packages.virtualenv
      python3Packages.pipenv
      python3Packages.poetry
      
      # Python development tools
      python3Packages.black        # Code formatter
      python3Packages.isort        # Import sorter
      python3Packages.flake8       # Linter
      python3Packages.pytest       # Testing framework
      python3Packages.ipython      # Enhanced interactive shell
      
      # Core Python libraries
      python3Packages.requests     # HTTP library
      python3Packages.urllib3      # HTTP client
      python3Packages.pandas       # Data manipulation
      python3Packages.numpy        # Numerical computing
      
      # Web scraping specific libraries
      python3Packages.beautifulsoup4  # HTML/XML parser
      python3Packages.lxml            # Fast XML and HTML parser
      python3Packages.selenium        # Browser automation
      python3Packages.scrapy          # Web scraping framework
      python3Packages.aiohttp         # Async HTTP client
      python3Packages.httpx           # Modern HTTP client
      python3Packages.fake-useragent  # Random user agents
      python3Packages.cloudscraper    # Cloudflare bypass
      
      # Data processing and storage
      python3Packages.jsonschema   # JSON validation
      python3Packages.pyyaml       # YAML processing
      python3Packages.openpyxl     # Excel file handling
      python3Packages.csvkit       # CSV utilities
      python3Packages.sqlalchemy   # SQL toolkit
      python3Packages.psycopg2     # PostgreSQL adapter
      
      # Network and proxy tools
      python3Packages.pysocks      # SOCKS proxy support
      python3Packages.requests-oauthlib  # OAuth support
      python3Packages.certifi      # Certificate bundle
      
      # Rate limiting and async
      python3Packages.aiofiles     # Async file operations
      python3Packages.ratelimit    # Rate limiting
      python3Packages.tenacity     # Retry library
      
      # Command line tools for scraping
      curl                         # HTTP client
      wget                         # Web downloader
      httpie                       # Modern HTTP client
      jq                          # JSON processor
      pup                         # HTML processor
      htmlq                       # HTML processor with CSS selectors
      
      # Text processing utilities
      ripgrep                     # Fast text search
      fd                          # Find alternative
      miller                      # Data processing tool
      
      # Development utilities
      just                        # Command runner
      direnv                      # Environment management
    ];

    # Set up environment for Python web scraping
    home.sessionVariables = {
      PYTHONPATH = "$PYTHONPATH:$HOME/.local/lib/python3.11/site-packages";
      PIP_USER = "1";
      PYTHONDONTWRITEBYTECODE = "1";
      PYTHONUNBUFFERED = "1";
      
      # SSL certificates
      REQUESTS_CA_BUNDLE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
      SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
    };

    # Shell aliases for Python scraping development
    programs.bash.shellAliases = lib.mkIf config.devshells.python-scraping {
      py = "python3";
      pip = "pip3";
      venv = "python3 -m venv";
      activate = "source venv/bin/activate";
      
      # Scraping aliases
      scrape-headers = "curl -I";
      scrape-robots = "curl -s";
      user-agent = "curl -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36'";
      
      # Jupyter for data analysis
      notebook = "jupyter notebook";
      lab = "jupyter lab";
      
      # Common scraping setup
      setup-scraping = "pip install --user requests beautifulsoup4 selenium scrapy pandas";
      
      # Virtual environment helpers
      mkenv = "python3 -m venv scraping_env && source scraping_env/bin/activate";
      requirements = "pip freeze > requirements.txt";
    };
  };
}
