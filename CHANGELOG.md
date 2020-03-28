# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v3.0.1](https://github.com/voxpupuli/puppet-epel/tree/v3.0.1) (2020-03-28)

[Full Changelog](https://github.com/voxpupuli/puppet-epel/compare/v3.0.0...v3.0.1)

**Fixed bugs:**

- Fix compilation on Fedora [\#116](https://github.com/voxpupuli/puppet-epel/pull/116) ([alexjfisher](https://github.com/alexjfisher))

## [v3.0.0](https://github.com/voxpupuli/puppet-epel/tree/v3.0.0) (2020-02-20)

[Full Changelog](https://github.com/voxpupuli/puppet-epel/compare/2.0.0...v3.0.0)

This is the first release of this module under [Vox Pupuli](https://voxpupuli.org/)'s [puppet](https://forge.puppet.com/puppet) namespace.  It was migrated to Vox Pupuli from [stahnma/epel](https://forge.puppet.com/stahnma/epel).

In line with Vox Pupuli [policy](https://voxpupuli.org/blog/2019/01/03/dropping-puppet4/), this release no longer supports Puppet 3 or 4.  Support for EL5 has also been deprecated.

**Breaking changes:**

- Drop support for Puppet 3 and 4 [\#109](https://github.com/voxpupuli/puppet-epel/pull/109) ([alexjfisher](https://github.com/alexjfisher))

**Implemented enhancements:**

- Add best effort support for Amazon Linux 2016,2018 [\#112](https://github.com/voxpupuli/puppet-epel/pull/112) ([alexjfisher](https://github.com/alexjfisher))
- Make gpg command more resilient by using --with-colons [\#90](https://github.com/voxpupuli/puppet-epel/pull/90) ([fschaer](https://github.com/fschaer))

**Fixed bugs:**

- Module does not allow the management on Amazon Linux [\#77](https://github.com/voxpupuli/puppet-epel/issues/77)
- Make sure the GPG key is imported before Yum repositories are created [\#86](https://github.com/voxpupuli/puppet-epel/pull/86) ([hlaf](https://github.com/hlaf))

**Closed issues:**

- Add working acceptance tests [\#106](https://github.com/voxpupuli/puppet-epel/issues/106)
- Add compatibility with RHEL8/CentOS 8 [\#91](https://github.com/voxpupuli/puppet-epel/issues/91)
- Module does not expose the repo\_gpgcheck parameter [\#76](https://github.com/voxpupuli/puppet-epel/issues/76)
- Update to be a Puppet4/5 module.  [\#70](https://github.com/voxpupuli/puppet-epel/issues/70)

**Merged pull requests:**

- Replace erb `templates` with `files` [\#113](https://github.com/voxpupuli/puppet-epel/pull/113) ([alexjfisher](https://github.com/alexjfisher))
- Remove use of getvar and stdlib dependency [\#110](https://github.com/voxpupuli/puppet-epel/pull/110) ([alexjfisher](https://github.com/alexjfisher))
- Get acceptance tests running [\#107](https://github.com/voxpupuli/puppet-epel/pull/107) ([alexjfisher](https://github.com/alexjfisher))
- Update metadata.json for Vox Pupuli migration [\#103](https://github.com/voxpupuli/puppet-epel/pull/103) ([alexjfisher](https://github.com/alexjfisher))
- Remove `tests` directory [\#102](https://github.com/voxpupuli/puppet-epel/pull/102) ([alexjfisher](https://github.com/alexjfisher))
- Migrate changelog from README to HISTORY.md [\#101](https://github.com/voxpupuli/puppet-epel/pull/101) ([alexjfisher](https://github.com/alexjfisher))
- Fix github license detection [\#100](https://github.com/voxpupuli/puppet-epel/pull/100) ([alexjfisher](https://github.com/alexjfisher))
- Add badges to README [\#99](https://github.com/voxpupuli/puppet-epel/pull/99) ([alexjfisher](https://github.com/alexjfisher))

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


\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
