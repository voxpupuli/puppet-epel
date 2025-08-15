# @api private
class epel::params {
  # Setting to 'absent' will fall back to the yum.conf
  # Setting proxy here will be the default for all repos.
  #
  #  If you wish to set a proxy for an individual set of repos,
  #   you can declare $proxy in that class, and should scope to
  #   the most specific declaration of proxy.
  $proxy = 'absent'

  if versioncmp($facts['os']['release']['major'],'8') >= 0 {
    $failovermethod = 'absent'
  } else {
    $failovermethod = 'priority'
  }

  $epel_mirrorlist                        = "https://mirrors.fedoraproject.org/metalink?repo=epel-${facts['os']['release']['major']}&arch=\$basearch"
  $epel_baseurl                           = 'absent'
  $epel_failovermethod                    = $failovermethod
  $epel_proxy                             = $proxy
  $epel_enabled                           = '1'
  $epel_gpgcheck                          = '1'
  $epel_repo_gpgcheck                     = '0'
  $epel_metalink                          = "https://mirrors.fedoraproject.org/metalink?repo=epel-${facts['os']['release']['major']}&arch=\$basearch"
  $epel_testing_mirrorlist                = "https://mirrors.fedoraproject.org/metalink?repo=testing-epel${facts['os']['release']['major']}&arch=\$basearch"
  $epel_testing_baseurl                   = 'absent'
  $epel_testing_failovermethod            = $failovermethod
  $epel_testing_proxy                     = $proxy
  $epel_testing_enabled                   = '0'
  $epel_testing_gpgcheck                  = '1'
  $epel_testing_repo_gpgcheck             = '0'
  $epel_testing_metalink                  = "https://mirrors.fedoraproject.org/metalink?repo=testing-epel${facts['os']['release']['major']}&arch=\$basearch"
  $epel_source_mirrorlist                 = "https://mirrors.fedoraproject.org/metalink?repo=epel-source-${facts['os']['release']['major']}&arch=\$basearch"
  $epel_source_baseurl                    = 'absent'
  $epel_source_failovermethod             = $failovermethod
  $epel_source_proxy                      = $proxy
  $epel_source_enabled                    = '0'
  $epel_source_gpgcheck                   = '1'
  $epel_source_repo_gpgcheck              = '0'
  $epel_source_metalink                   = "https://mirrors.fedoraproject.org/metalink?repo=epel-source-${facts['os']['release']['major']}&arch=\$basearch"
  $epel_debuginfo_mirrorlist              = "https://mirrors.fedoraproject.org/metalink?repo=epel-debug-${facts['os']['release']['major']}&arch=\$basearch"
  $epel_debuginfo_baseurl                 = 'absent'
  $epel_debuginfo_failovermethod          = $failovermethod
  $epel_debuginfo_proxy                   = $proxy
  $epel_debuginfo_enabled                 = '0'
  $epel_debuginfo_gpgcheck                = '1'
  $epel_debuginfo_repo_gpgcheck           = '0'
  $epel_debuginfo_metalink                = "https://mirrors.fedoraproject.org/metalink?repo=epel-debug-${facts['os']['release']['major']}&arch=\$basearch"
  $epel_testing_source_mirrorlist         = "https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel${facts['os']['release']['major']}&arch=\$basearch"
  $epel_testing_source_baseurl            = 'absent'
  $epel_testing_source_failovermethod     = $failovermethod
  $epel_testing_source_proxy              = $proxy
  $epel_testing_source_enabled            = '0'
  $epel_testing_source_gpgcheck           = '1'
  $epel_testing_source_repo_gpgcheck      = '0'
  $epel_testing_source_metalink           = "https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel${facts['os']['release']['major']}&arch=\$basearch"
  $epel_testing_debuginfo_mirrorlist      = "https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel${facts['os']['release']['major']}&arch=\$basearch"
  $epel_testing_debuginfo_baseurl         = 'absent'
  $epel_testing_debuginfo_failovermethod  = $failovermethod
  $epel_testing_debuginfo_proxy           = $proxy
  $epel_testing_debuginfo_enabled         = '0'
  $epel_testing_debuginfo_gpgcheck        = '1'
  $epel_testing_debuginfo_repo_gpgcheck   = '0'
  $epel_testing_debuginfo_metalink        = "https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel${facts['os']['release']['major']}&arch=\$basearch"
}
