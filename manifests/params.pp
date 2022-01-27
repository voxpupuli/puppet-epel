# @api private
class epel::params {
  # Setting to 'absent' will fall back to the yum.conf
  # Setting proxy here will be the default for all repos.
  #
  #  If you wish to set a proxy for an individual set of repos,
  #   you can declare $proxy in that class, and should scope to
  #   the most specific declaration of proxy.
  $proxy = 'absent'

  if $facts['os']['name'] == 'Amazon' and $facts['os']['release']['major'] == '2' {
    # Amazon Linux 2 is equivalent of Enterprise Linux 7 so we use that version for epel
    # https://aws.amazon.com/premiumsupport/knowledge-center/ec2-enable-epel/
    $os_maj_release = '7'
  } elsif $facts['os']['name'] == 'Amazon' and $facts['os']['release']['major'] in ['2016','2018'] {
    # Older versions are based on EL6
    $os_maj_release = '6'
  } else {
    $os_maj_release = $facts['os']['release']['major']
  }

  if versioncmp($os_maj_release,'8') >= 0 {
    $failovermethod = 'absent'
  } else {
    $failovermethod = 'priority'
  }

  $epel_mirrorlist                        = "https://mirrors.fedoraproject.org/metalink?repo=epel-${os_maj_release}&arch=\$basearch"
  $epel_baseurl                           = 'absent'
  $epel_failovermethod                    = $failovermethod
  $epel_proxy                             = $proxy
  $epel_enabled                           = '1'
  $epel_gpgcheck                          = '1'
  $epel_repo_gpgcheck                     = '0'
  $epel_metalink                          = "https://mirrors.fedoraproject.org/metalink?repo=epel-${os_maj_release}&arch=\$basearch"
  $epel_testing_mirrorlist                = "https://mirrors.fedoraproject.org/metalink?repo=testing-epel${os_maj_release}&arch=\$basearch"
  $epel_testing_baseurl                   = 'absent'
  $epel_testing_failovermethod            = $failovermethod
  $epel_testing_proxy                     = $proxy
  $epel_testing_enabled                   = '0'
  $epel_testing_gpgcheck                  = '1'
  $epel_testing_repo_gpgcheck             = '0'
  $epel_testing_metalink                  = "https://mirrors.fedoraproject.org/metalink?repo=testing-epel${os_maj_release}&arch=\$basearch"
  $epel_source_mirrorlist                 = "https://mirrors.fedoraproject.org/metalink?repo=epel-source-${os_maj_release}&arch=\$basearch"
  $epel_source_baseurl                    = 'absent'
  $epel_source_failovermethod             = $failovermethod
  $epel_source_proxy                      = $proxy
  $epel_source_enabled                    = '0'
  $epel_source_gpgcheck                   = '1'
  $epel_source_repo_gpgcheck              = '0'
  $epel_source_metalink                   = "https://mirrors.fedoraproject.org/metalink?repo=epel-source-${os_maj_release}&arch=\$basearch"
  $epel_debuginfo_mirrorlist              = "https://mirrors.fedoraproject.org/metalink?repo=epel-debug-${os_maj_release}&arch=\$basearch"
  $epel_debuginfo_baseurl                 = 'absent'
  $epel_debuginfo_failovermethod          = $failovermethod
  $epel_debuginfo_proxy                   = $proxy
  $epel_debuginfo_enabled                 = '0'
  $epel_debuginfo_gpgcheck                = '1'
  $epel_debuginfo_repo_gpgcheck           = '0'
  $epel_debuginfo_metalink                = "https://mirrors.fedoraproject.org/metalink?repo=epel-debug-${os_maj_release}&arch=\$basearch"
  $epel_testing_source_mirrorlist         = "https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel${os_maj_release}&arch=\$basearch"
  $epel_testing_source_baseurl            = 'absent'
  $epel_testing_source_failovermethod     = $failovermethod
  $epel_testing_source_proxy              = $proxy
  $epel_testing_source_enabled            = '0'
  $epel_testing_source_gpgcheck           = '1'
  $epel_testing_source_repo_gpgcheck      = '0'
  $epel_testing_source_metalink           = "https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel${os_maj_release}&arch=\$basearch"
  $epel_testing_debuginfo_mirrorlist      = "https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel${os_maj_release}&arch=\$basearch"
  $epel_testing_debuginfo_baseurl         = 'absent'
  $epel_testing_debuginfo_failovermethod  = $failovermethod
  $epel_testing_debuginfo_proxy           = $proxy
  $epel_testing_debuginfo_enabled         = '0'
  $epel_testing_debuginfo_gpgcheck        = '1'
  $epel_testing_debuginfo_repo_gpgcheck   = '0'
  $epel_testing_debuginfo_metalink        = "https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel${os_maj_release}&arch=\$basearch"
  $epel_playground_mirrorlist             = "https://mirrors.fedoraproject.org/metalink?repo=playground-epel8&arch=\$basearch"
  $epel_playground_baseurl                = 'absent'
  $epel_playground_failovermethod         = 'priority'
  $epel_playground_proxy                  = $proxy
  $epel_playground_enabled                = '0'
  $epel_playground_gpgcheck               = '1'
  $epel_playground_repo_gpgcheck          = '0'
  $epel_playground_metalink               = "https://mirrors.fedoraproject.org/metalink?repo=playground-debug-epel8&arch=\$basearch"
  $epel_playground_debug_mirrorlist       = "https://mirrors.fedoraproject.org/metalink?repo=playground-debug-epel8&arch=\$basearch"
  $epel_playground_debug_baseurl          = 'absent'
  $epel_playground_debug_failovermethod   = 'priority'
  $epel_playground_debug_proxy            = $proxy
  $epel_playground_debug_enabled          = '0'
  $epel_playground_debug_gpgcheck         = '1'
  $epel_playground_debug_repo_gpgcheck    = '0'
  $epel_playground_debug_metalink         = "https://mirrors.fedoraproject.org/metalink?repo=playground-debug-epel8&arch=\$basearch"
  if versioncmp($os_maj_release, '8') >= 0 {
    $epel_playground_debug_managed = true
    $epel_playground_managed = true
  } else {
    $epel_playground_debug_managed = false
    $epel_playground_managed = false
  }
}
