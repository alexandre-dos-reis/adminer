{ pkgs, config, ... }:

let 
  domain = "adminer.dev";
in {
  certificates = [domain];
  hosts.${domain} = "127.0.0.1";

  languages.php = {
    enable = true;
    version = "7.4";
    fpm.pools.web.settings = {
      "pm" = "dynamic";
      "pm.max_children" = 5;
      "pm.start_servers" = 2;
      "pm.min_spare_servers" = 1;
      "pm.max_spare_servers" = 5;
    };
  };

  services.caddy = {
    enable = true;
    virtualHosts.${domain} = {
      extraConfig = ''
        tls ${config.env.DEVENV_STATE}/mkcert/${domain}.pem ${config.env.DEVENV_STATE}/mkcert/${domain}-key.pem
        root * public
        php_fastcgi unix/${config.languages.php.fpm.pools.web.socket}
        file_server
      '';
    };
  };
}
