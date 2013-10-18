class people::t93 {

  include zsh
  include vagrant
  include charles
  include processing
  include skype
  include chrome
  include firefox
  include dropbox
  include evernote
  include alfred

  package {
    [
      'gnupg',
      'tig',
      'macvim'
    ]:
  }

  $home     = "/Users/${::boxen_user}"
  $github   = "${home}/github"
  $dotfiles = "${github}/dotfiles"

  file { $github:
    ensure  => directory
  }

  repository { $dotfiles:
    source  => "t93/dotfiles",
    require => File[$github]
  }

  exec { "sh ${dotfiles}/install.sh":
    require => Repository[$dotfiles]
  }
}
