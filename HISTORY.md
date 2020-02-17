## 2.0.0 (2020-02-13)

- Allow this module to work on systems when global `repo_gpgcheck` = 1 [#82](https://github.com/voxpupuli/puppet-epel/pull/82)
- Amazon Linux 2 - bugfix - use enterprise linux 7 [#95](https://github.com/voxpupuli/puppet-epel/pull/95)
- Add support for RHEL 8 and CentOS 8 [#92](https://github.com/voxpupuli/puppet-epel/pull/92)
- Adjust gpg args to account for slightly different display. [#84](https://github.com/voxpupuli/puppet-epel/pull/84)

## 1.3.1 (2018-07-16)

- Remove an `Epel::Rpm_gpg_key` collector that could cause circular dependencies

## 1.3.0 (2017-10-24)

- Add ability to disable and not define any resources from this module. This is useful if another module pulls in this module, but you already have epel managed another way.
- Ability to specify your own TLS certs
- repo files are now templated instead of sourced.
- properly use metalink vs mirrorlist

##  1.2.2 (2015-12-05)

- Add dep on stdlib for getvar function call

## 1.2.1 (2015-12-05)
- Minor fix that lets facter 1.6 still work
- Enforce strict variables

## 1.2.0 (2015-12-01)

- Rework testing to use TravisCI
- If you specify a baseurl, disable mirrorlist

## 1.1.1 (2015-08-28)

- Ensure that GPG keys are using short IDs (issue #33)

## 1.1.0 (2015-08-21)

- Default URLs to be https
- Add ability to include/exclude packages

##  1.0.2 (2014-12-12)

- Update README with usage section.
- Fix regression when `os_maj_version` fact was required
- Ready for 1.0 - replace Modulefile with metadata.json
- Replace `os_maj_version` custom fact with operatingsystemmajrelease
- Works for EPEL7 now as well.
