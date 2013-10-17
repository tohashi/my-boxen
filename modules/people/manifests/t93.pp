class people::t93 {

  package {
    [
      'gnupg',
      'tig',
      'zsh',
      'macvim',
      'nodebrew'
    ]:
  }

  $home     = "/Users/${::boxen_user}"
  $github   = "${home}/github"
  $dotfiles = "${github}/dotfiles"

  repository: { $dotfiles:
    source  => "t93/dotfiles",
    require => File[$github]
  }

  exec { "sh ${dotfiles}/install.sh":
    require => File[$home]
  }
}
