# Configure EPEL (Extra Repository for Enterprise Linux)

[![License](https://img.shields.io/github/license/voxpupuli/puppet-epel.svg)](https://github.com/voxpupuli/puppet-epel/blob/master/LICENSE)
[![Build Status](https://travis-ci.org/voxpupuli/puppet-epel.png?branch=master)](https://travis-ci.org/voxpupuli/puppet-epel)
[![Puppet Forge](https://img.shields.io/puppetforge/v/puppet/epel.svg)](https://forge.puppetlabs.com/puppet/epel)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/puppet/epel.svg)](https://forge.puppetlabs.com/puppet/epel)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/puppet/epel.svg)](https://forge.puppetlabs.com/puppet/epel)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/puppet/epel.svg)](https://forge.puppetlabs.com/puppet/epel)

# About
This module basically just mimics the epel-release rpm. The same repos are
enabled/disabled and the GPG key is imported.  In the end you will end up with
the EPEL repos configured.

The following Repos will be setup and enabled by default:

  * epel

Other repositories that will setup but disabled (as per the epel-release setup)

  * epel-debuginfo
  * epel-source
  * epel-testing
  * epel-testing-debuginfo
  * epel-testing-source

# Usage

In nearly all cases, you can simply _include epel_ or classify your nodes with
the epel class. There are quite a few parameters available if you need to modify
the default settings for the epel repository such as having your own mirror, an
http proxy, or disable gpg checking.

A list of all parameters is available in [REFERENCE.md](REFERENCE.md).

You can also use a puppet one-liner to get epel onto a system.

    puppet apply -e 'include epel'

# Proxy
If you have a http proxy required to access the internet, you can use either
a class parameter in the _epel_ class (epel_proxy), or edit the $proxy variable
in the params.pp file. By default no proxy is assumed.

# Why?
I am a big fan of EPEL. I actually was one of the people who helped get it
going. I am also the owner of the epel-release package, so in general this
module should stay fairly up to date with the official upstream package.

I just got sick of coding Puppet modules and basically having an assumption
that EPEL was setup or installed. I can now depend on this module instead.

I realize it is fairly trivial to get EPEL setup. Every now-and-then however
the path to epel-release changes because something changes in the package (mass
rebuild, rpm build macros updates, etc). This module will bypass the changing
URL and just setup the package mirrors.

This does mean that if you are looking for RPM macros that are normally
included with EPEL release, this will not have them.

# Further Information

* [EPEL Wiki](http://fedoraproject.org/wiki/EPEL)
* [epel-release package information](http://mirrors.servercentral.net/fedora/epel/6/i386/repoview/epel-release.html)

# Testing and Compatibility

* This module is tested on CentOS 6, 7 and 8 with Puppet 5 and Puppet 6.
* It should work on any RHEL variant such as RedHat, OracleLinux, Scientific Linux etc.
* Amazon Linux compatability is not promised, as EPEL doesn't always work with it.
* Support for EL5 is deprecated. It *may* still work but we have no acceptance tests.  CentOS 5 is EOL and RHEL5 and OracleLinux 5 extended support for most customers is due to end in 2020.

## Unit tests

Install the necessary gems

    bundle install --path vendor --without system_tests

Run the RSpec and puppet-lint tests

    bundle exec rake test

## System tests

If you have Vagrant >=1.1.0 you can also run system tests:

    RSPEC_SET=centos-64-x64 bundle exec rake spec:system

Available RSPEC_SET options are in .nodeset.yml

# License

This module is distributed under the [Apache License 2.0](LICENSE).
Since version 3, it is maintained by [Vox Pupuli](https://voxpupuli.org/).

# Author/Contributors
 * Aaron <slapula@users.noreply.github.com>
 * Alex Harvey <Alex_Harvey@amp.com.au>
 * Chad Metcalf <metcalfc@gmail.com>
 * Ewoud Kohl van Wijngaarden <e.kohlvanwijngaarden@oxilion.nl>
 * Jeffrey Clark <jclark@nmi.com>
 * Joseph Swick <joseph.swick@meltwater.com>
 * Matthaus Owens <mlitteken@gmail.com>
 * Michael Hanselmann <hansmi@vshn.ch>
 * Michael Stahnke <stahnma@fedoraproject.org>
 * Michael Stahnke <stahnma@puppet.com>
 * Michael Stahnke <stahnma@puppetlabs.com>
 * Michael Stahnke <stahnma@websages.com>
 * Mickaël Canévet <mickael.canevet@camptocamp.com>
 * Nick Le Mouton <nick@noodles.net.nz>
 * Pro Cabales <proletaryo@gmail.com>
 * Proletaryo Cabales <proletaryo@gmail.com>
 * Riccardo Calixte <rcalixte@broadinstitute.org>
 * Robert Story <rstory@localhost>
 * Rob Nelson <rnelson0@gmail.com>
 * Siebrand Mazeland <siebrand@kitano.nl>
 * Stefan Goethals <stefan@zipkid.eu>
 * Tim Rupp <caphrim007@gmail.com>
 * Toni Schmidbauer <toni@stderr.at>
 * Trey Dockendorf <treydock@gmail.com>
 * Troy Bollinger <troy@us.ibm.com>
 * Vlastimil Holer <holer@ics.muni.cz>

# Alternatives
If you're on CentOS 7 or CentOS 8, you can just `yum install epel-release` as it's in centos-extras.
