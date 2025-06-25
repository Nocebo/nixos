{
  pkgs,
  lib,
  config,
  ...
}: {
  users.users = {
    kleanzy = {
      initialHashedPassword = "$6$OLITvrh1zpKBixoh$OhKacreIrEvHoLfhCw8x.krjAUILTx3/uRPy5WLQZcBzFj5c9DUU366uk0KY5p/V9N72kC.BpP8LFksYqdbvl.";
      isNormalUser = true;
      uid = 1337;
      #shell = pkgs.nushell;
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDEy+h8sXKqG76l8TbdgeLD8E7rKpNjXt8TG0kJsLqAFF+9oeSNISMO3x819oNVEWb/NGMyww3IsfqOSRXlhpEeAjMbZAoT9yvrXMiWrGTdwd6UkcWKP9P+8cEf7GP2r34uYmz79EefQ5y+fm9MxeYvnlJG/C4cxNEavjUPCkJF/rSy3pN0mqKiNLpdGq6RBjasJ4uf/8dpAZRcjEJmz+MkkrSaOUXrNk3i8WojIXp22P0Fqxnp9RjWVRH8iPzqlko3TwvSg/RDNjD0Wweauan//yNRsKgSwOgkc3n6ouktE3LJPFZh+/c7RZLV9t87Z0AsqP8v71aeMDo6b8276EErAfMBDd7+aEud8cRZd2tKTIwVS/C31EnZfEJ6D6AUehIZugwLlm0wp/7U6Bd6rwTdJExx3SvmJfS2o+9vqd97cs1sbr/cdpd488bXf0pQk3J0qq/2/aI1x0Qpwj7xScm7XOF9tdjj9N85Sl5/onlJCCNutOzoi8ZN3H0sL6cGuGCjlhucCZJIvcE/Ej4oXCPFSXTvOj74T28VUI38JkWHT5nEbplsbzBMqyZ4NU7lWzJMDugOg+tggmzPbouQyNXJMmX2yN8ZxmpqZ/vQ37FrurWPsNt8NWNCN9feuJoexUPgxToy9gN6ymWzHMgu7cI3Lxy8lec5TIeUS4E27Pl3sw== kleanzy"
      ];
      extraGroups = [
        "wheel"
        "networkmanager"
        "docker"
        "vboxusers"
        "libvirtd"
        "plugdev"
        "storage"
      ];
      packages = with pkgs; [
        #move everything to home-manager
        home-manager
      ];
    };
  };
}
