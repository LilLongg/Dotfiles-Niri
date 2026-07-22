{
  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "virbr0" ];
  };
}
