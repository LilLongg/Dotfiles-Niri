{ pkgs, ... }: {
  home.file.".clang-format".source = ./.clang-format;
  xdg.configFile."clangd/config.yaml".source = (pkgs.formats.yaml { }).generate "config.yaml" {
    CompileFlags = {
      Add = [ "-std=c++23" ];
    };
  };
}
