# @summary Import an RPM gpg key
#
# @api private
#
# @param path
#   Path of the RPM GPG key to import
#
# @example Sample Usage
#   epel::rpm_gpg_key{ 'EPEL-6':
#     path => '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
#   }
define epel::rpm_gpg_key($path) {
  # Given the path to a key, see if it is imported, if not, import it
  exec {  "import-${name}":
    path      => '/bin:/usr/bin:/sbin:/usr/sbin',
    command   => "rpm --import ${path}",
    unless    => "rpm -q gpg-pubkey-$(echo $(gpg -q --batch --with-colons --throw-keyids --keyid-format short < ${path}) | grep pub | cut -d ':' -f 5 | cut --characters=9- | tr '[A-Z]' '[a-z]')",
    require   => File[$path],
    logoutput => 'on_failure',
  }
}
