#!/usr/bin/env perl


# Script to install arbitrary pkg via default package manager.
#
# Usage:
#   <progname> <exec-name> <arch-pkg> <ubuntu-pkg>

use strict;
use warnings;

my $arch = "arch";
my $ubuntu = "ubuntu";
my $os = get_os();
main();


sub get_os {
  if (qx/uname -r/ =~ /generic/) {
    $os = $ubuntu;
  } else {
    $os = $arch;
  }
}

sub choose {
  my ($arch_opt, $ubuntu_opt) = @_;
  if ($os =~ /$arch/) {
    return $arch_opt;
  } else {
    return $ubuntu_opt;
  }
}

sub main {
  my $exec_name   = $ARGV[0];
  my $pkg_name    = choose $ARGV[1], $ARGV[2];
  my $install_cmd = choose "sudo pacman -S --noconfirm", "sudo apt install -y";
  my $full_cmd    = "$install_cmd $pkg_name";

  if (system("which $exec_name > /dev/null") == 0) {
    print "[+] $exec_name already installed, skipping install for $pkg_name\n";
    exit 0;
  }

  my $exit_code   = system $full_cmd;
  if ($exit_code != 0) {
    print "[---] '$full_cmd' failed with exit code $exit_code\n";
    exit $exit_code;
  }
  print "[+] package $pkg_name successfully installed\n";
}
