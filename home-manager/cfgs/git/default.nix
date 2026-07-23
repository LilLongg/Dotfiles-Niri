{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      name = "LilLongg";
      email = "glivingstone70@gmail.com";
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
