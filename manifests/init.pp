# @summary Configure the proper EPEL repositories and import GPG keys
#
# @param epel_managed
#   Determines if the main EPEL repository is managed.
# @param epel_source_managed
#   Determines if the `epel-source` repository is managed.
# @param epel_debuginfo_managed
#   Determines if the `epel-debuginfo` repository is managed.
# @param epel_testing_managed
#   Determines if the `epel-testing` repository is managed.
# @param epel_testing_source_managed
#   Determines if the `epel-testing-source` repository is managed.
# @param epel_testing_debuginfo_managed
#   Determines if the `epel-testing-debuginfo` repository is managed.
# @param epel_gpg_managed
#   Detemines if the module manages the rpm-gpg key for EPEL.
#
# @example Basic Usage
#   include epel
#
# @see https://fedoraproject.org/wiki/EPEL
class epel (
  $epel_mirrorlist                        = $epel::params::epel_mirrorlist,
  $epel_baseurl                           = $epel::params::epel_baseurl,
  $epel_failovermethod                    = $epel::params::epel_failovermethod,
  $epel_proxy                             = $epel::params::epel_proxy,
  $epel_enabled                           = $epel::params::epel_enabled,
  $epel_gpgcheck                          = $epel::params::epel_gpgcheck,
  $epel_repo_gpgcheck                     = $epel::params::epel_repo_gpgcheck,
  $epel_metalink                          = $epel::params::epel_metalink,
  Boolean $epel_managed                   = true,
  $epel_exclude                           = undef,
  $epel_includepkgs                       = undef,
  $epel_sslclientkey                      = undef,
  $epel_sslclientcert                     = undef,
  $epel_testing_mirrorlist                = $epel::params::epel_testing_mirrorlist,
  $epel_testing_baseurl                   = $epel::params::epel_testing_baseurl,
  $epel_testing_failovermethod            = $epel::params::epel_testing_failovermethod,
  $epel_testing_proxy                     = $epel::params::epel_testing_proxy,
  $epel_testing_enabled                   = $epel::params::epel_testing_enabled,
  $epel_testing_gpgcheck                  = $epel::params::epel_testing_gpgcheck,
  $epel_testing_repo_gpgcheck             = $epel::params::epel_testing_repo_gpgcheck,
  $epel_testing_metalink                  = $epel::params::epel_testing_metalink,
  Boolean $epel_testing_managed           = true,
  $epel_testing_exclude                   = undef,
  $epel_testing_includepkgs               = undef,
  $epel_testing_sslclientkey              = undef,
  $epel_testing_sslclientcert             = undef,
  $epel_source_mirrorlist                 = $epel::params::epel_source_mirrorlist,
  $epel_source_baseurl                    = $epel::params::epel_source_baseurl,
  $epel_source_failovermethod             = $epel::params::epel_source_failovermethod,
  $epel_source_proxy                      = $epel::params::epel_source_proxy,
  $epel_source_enabled                    = $epel::params::epel_source_enabled,
  $epel_source_gpgcheck                   = $epel::params::epel_source_gpgcheck,
  $epel_source_repo_gpgcheck              = $epel::params::epel_source_repo_gpgcheck,
  $epel_source_metalink                   = $epel::params::epel_source_metalink,
  Boolean $epel_source_managed            = true,
  $epel_source_exclude                    = undef,
  $epel_source_includepkgs                = undef,
  $epel_source_sslclientkey               = undef,
  $epel_source_sslclientcert              = undef,
  $epel_debuginfo_mirrorlist              = $epel::params::epel_debuginfo_mirrorlist,
  $epel_debuginfo_baseurl                 = $epel::params::epel_debuginfo_baseurl,
  $epel_debuginfo_failovermethod          = $epel::params::epel_debuginfo_failovermethod,
  $epel_debuginfo_proxy                   = $epel::params::epel_debuginfo_proxy,
  $epel_debuginfo_enabled                 = $epel::params::epel_debuginfo_enabled,
  $epel_debuginfo_gpgcheck                = $epel::params::epel_debuginfo_gpgcheck,
  $epel_debuginfo_repo_gpgcheck           = $epel::params::epel_debuginfo_repo_gpgcheck,
  $epel_debuginfo_metalink                = $epel::params::epel_debuginfo_metalink,
  Boolean $epel_debuginfo_managed         = true,
  $epel_debuginfo_exclude                 = undef,
  $epel_debuginfo_includepkgs             = undef,
  $epel_debuginfo_sslclientkey            = undef,
  $epel_debuginfo_sslclientcert           = undef,
  $epel_testing_source_mirrorlist         = $epel::params::epel_testing_source_mirrorlist,
  $epel_testing_source_baseurl            = $epel::params::epel_testing_source_baseurl,
  $epel_testing_source_failovermethod     = $epel::params::epel_testing_source_failovermethod,
  $epel_testing_source_proxy              = $epel::params::epel_testing_source_proxy,
  $epel_testing_source_enabled            = $epel::params::epel_testing_source_enabled,
  $epel_testing_source_gpgcheck           = $epel::params::epel_testing_source_gpgcheck,
  $epel_testing_source_repo_gpgcheck      = $epel::params::epel_testing_source_repo_gpgcheck,
  $epel_testing_source_metalink           = $epel::params::epel_testing_source_metalink,
  Boolean $epel_testing_source_managed    = true,
  $epel_testing_source_exclude            = undef,
  $epel_testing_source_includepkgs        = undef,
  $epel_testing_source_sslclientkey       = undef,
  $epel_testing_source_sslclientcert      = undef,
  $epel_testing_debuginfo_mirrorlist      = $epel::params::epel_testing_debuginfo_mirrorlist,
  $epel_testing_debuginfo_baseurl         = $epel::params::epel_testing_debuginfo_baseurl,
  $epel_testing_debuginfo_failovermethod  = $epel::params::epel_testing_debuginfo_failovermethod,
  $epel_testing_debuginfo_proxy           = $epel::params::epel_testing_debuginfo_proxy,
  $epel_testing_debuginfo_enabled         = $epel::params::epel_testing_debuginfo_enabled,
  $epel_testing_debuginfo_gpgcheck        = $epel::params::epel_testing_debuginfo_gpgcheck,
  $epel_testing_debuginfo_repo_gpgcheck   = $epel::params::epel_testing_debuginfo_repo_gpgcheck,
  $epel_testing_debuginfo_metalink        = $epel::params::epel_testing_debuginfo_metalink,
  Boolean $epel_testing_debuginfo_managed = true,
  $epel_testing_debuginfo_exclude         = undef,
  $epel_testing_debuginfo_includepkgs     = undef,
  $epel_testing_debuginfo_sslclientkey    = undef,
  $epel_testing_debuginfo_sslclientcert   = undef,
  Boolean $epel_gpg_managed               = true,
  $os_maj_release                         = $epel::params::os_maj_release,
) inherits epel::params {
  if $facts['os']['family'] == 'RedHat' and $facts['os']['name'] != 'Fedora' {
  if $epel_testing_managed {
    yumrepo { 'epel-testing':
      # lint:ignore:selector_inside_resource
      mirrorlist     => $epel_testing_baseurl ? {
        'absent' => $epel_testing_mirrorlist,
        default  => 'absent',
      },
      # lint:endignore
      baseurl        => $epel_testing_baseurl,
      failovermethod => $epel_testing_failovermethod,
      proxy          => $epel_testing_proxy,
      enabled        => $epel_testing_enabled,
      gpgcheck       => $epel_testing_gpgcheck,
      repo_gpgcheck  => $epel_testing_repo_gpgcheck,
      gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${os_maj_release}",
      metalink       => $epel_testing_metalink,
      descr          => "Extra Packages for Enterprise Linux ${os_maj_release} - Testing - \$basearch",
      exclude        => $epel_testing_exclude,
      includepkgs    => $epel_testing_includepkgs,
      sslclientkey   => $epel_testing_sslclientkey,
      sslclientcert  => $epel_testing_sslclientcert,
    }

    if $epel_gpg_managed {
      Epel::Rpm_gpg_key["EPEL-${os_maj_release}"] -> Yumrepo['epel-testing']
    }
  }

  if $epel_testing_debuginfo_managed {
    yumrepo { 'epel-testing-debuginfo':
      # lint:ignore:selector_inside_resource
      mirrorlist     => $epel_testing_debuginfo_baseurl ? {
        'absent' => $epel_testing_debuginfo_mirrorlist,
        default  => 'absent',
      },
      # lint:endignore
      baseurl        => $epel_testing_debuginfo_baseurl,
      failovermethod => $epel_testing_debuginfo_failovermethod,
      proxy          => $epel_testing_debuginfo_proxy,
      enabled        => $epel_testing_debuginfo_enabled,
      gpgcheck       => $epel_testing_debuginfo_gpgcheck,
      repo_gpgcheck  => $epel_testing_debuginfo_repo_gpgcheck,
      gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${os_maj_release}",
      metalink       => $epel_testing_debuginfo_metalink,
      descr          => "Extra Packages for Enterprise Linux ${os_maj_release} - Testing - \$basearch - Debug",
      exclude        => $epel_testing_debuginfo_exclude,
      includepkgs    => $epel_testing_debuginfo_includepkgs,
      sslclientkey   => $epel_testing_debuginfo_sslclientkey,
      sslclientcert  => $epel_testing_debuginfo_sslclientcert,
    }

    if $epel_gpg_managed {
      Epel::Rpm_gpg_key["EPEL-${os_maj_release}"] -> Yumrepo['epel-testing-debuginfo']
    }
  }

  if $epel_testing_source_managed {
    yumrepo { 'epel-testing-source':
      # lint:ignore:selector_inside_resource
      mirrorlist     => $epel_testing_source_baseurl ? {
        'absent' => $epel_testing_source_mirrorlist,
        default  => 'absent',
      },
      # lint:endignore
      baseurl        => $epel_testing_source_baseurl,
      failovermethod => $epel_testing_source_failovermethod,
      proxy          => $epel_testing_source_proxy,
      enabled        => $epel_testing_source_enabled,
      gpgcheck       => $epel_testing_source_gpgcheck,
      repo_gpgcheck  => $epel_testing_source_repo_gpgcheck,
      gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${os_maj_release}",
      metalink       => $epel_testing_source_metalink,
      descr          => "Extra Packages for Enterprise Linux ${os_maj_release} - Testing - \$basearch - Source",
      exclude        => $epel_testing_source_exclude,
      includepkgs    => $epel_testing_source_includepkgs,
      sslclientkey   => $epel_testing_source_sslclientkey,
      sslclientcert  => $epel_testing_source_sslclientcert,
    }

    if $epel_gpg_managed {
      Epel::Rpm_gpg_key["EPEL-${os_maj_release}"] -> Yumrepo['epel-testing-source']
    }
  }

  if $epel_managed {
    yumrepo { 'epel':
      # lint:ignore:selector_inside_resource
      mirrorlist     => $epel_baseurl ? {
        'absent' => $epel_mirrorlist,
        default  => 'absent',
      },
      # lint:endignore
      baseurl        => $epel_baseurl,
      failovermethod => $epel_failovermethod,
      proxy          => $epel_proxy,
      enabled        => $epel_enabled,
      gpgcheck       => $epel_gpgcheck,
      repo_gpgcheck  => $epel_repo_gpgcheck,
      gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${os_maj_release}",
      metalink       => $epel_metalink,
      descr          => "Extra Packages for Enterprise Linux ${os_maj_release} - \$basearch",
      exclude        => $epel_exclude,
      includepkgs    => $epel_includepkgs,
      sslclientkey   => $epel_sslclientkey,
      sslclientcert  => $epel_sslclientcert,
    }

    if $epel_gpg_managed {
      Epel::Rpm_gpg_key["EPEL-${os_maj_release}"] -> Yumrepo['epel']
    }
  }

  if $epel_debuginfo_managed {
    yumrepo { 'epel-debuginfo':
      # lint:ignore:selector_inside_resource
      mirrorlist     => $epel_debuginfo_baseurl ? {
        'absent' => $epel_debuginfo_mirrorlist,
        default  => 'absent',
      },
      # lint:endignore
      baseurl        => $epel_debuginfo_baseurl,
      failovermethod => $epel_debuginfo_failovermethod,
      proxy          => $epel_debuginfo_proxy,
      enabled        => $epel_debuginfo_enabled,
      gpgcheck       => $epel_debuginfo_gpgcheck,
      repo_gpgcheck  => $epel_debuginfo_repo_gpgcheck,
      gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${os_maj_release}",
      descr          => "Extra Packages for Enterprise Linux ${os_maj_release} - \$basearch - Debug",
      metalink       => $epel_debuginfo_metalink,
      exclude        => $epel_debuginfo_exclude,
      includepkgs    => $epel_debuginfo_includepkgs,
      sslclientkey   => $epel_debuginfo_sslclientkey,
      sslclientcert  => $epel_debuginfo_sslclientcert,
    }

    if $epel_gpg_managed {
      Epel::Rpm_gpg_key["EPEL-${os_maj_release}"] -> Yumrepo['epel-debuginfo']
    }
  }

  if $epel_source_managed {
    yumrepo { 'epel-source':
      # lint:ignore:selector_inside_resource
      mirrorlist     => $epel_source_baseurl ? {
        'absent' => $epel_source_mirrorlist,
        default  => 'absent',
      },
      # lint:endignore
      baseurl        => $epel_source_baseurl,
      failovermethod => $epel_source_failovermethod,
      proxy          => $epel_source_proxy,
      enabled        => $epel_source_enabled,
      gpgcheck       => $epel_source_gpgcheck,
      repo_gpgcheck  => $epel_source_repo_gpgcheck,
      gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${os_maj_release}",
      descr          => "Extra Packages for Enterprise Linux ${os_maj_release} - \$basearch - Source",
      metalink       => $epel_source_metalink,
      exclude        => $epel_source_exclude,
      includepkgs    => $epel_source_includepkgs,
      sslclientkey   => $epel_source_sslclientkey,
      sslclientcert  => $epel_source_sslclientcert,
    }

    if $epel_gpg_managed {
      Epel::Rpm_gpg_key["EPEL-${os_maj_release}"] -> Yumrepo['epel-source']
    }
  }

  if $epel_gpg_managed {
    file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${os_maj_release}":
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => file("epel/RPM-GPG-KEY-EPEL-${os_maj_release}"),
    }

    epel::rpm_gpg_key{ "EPEL-${os_maj_release}":
      path   => "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${os_maj_release}",
    }
  }

  } else {
    notice ("Your operating system ${facts['os']['name']} will not have the EPEL repository applied")
  }
}
