{ pkgs, ... }: {
  home.packages = with pkgs; [
    clang-tools
    fish-lsp
    nixd
    nixfmt
    prettier
    ruff
    taplo
    ty
    vscode-css-languageserver
    vscode-json-languageserver
  ];

  programs.helix.languages.language-server = {
    hx-lsp = {
      command = "${pkgs.hx-lsp}/bin/hx-lsp";
    };
    ruff = {
      command = "${pkgs.ruff}/bin/ruff";
      config.settings.lint.isort = {
        docstring-code-format = true;
        length-sort = true;
        lines-after-imports = 2;
      };
    };
  };
}
