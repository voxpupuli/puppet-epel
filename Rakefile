require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'

# Disable specific puppet-lint checks
PuppetLint.configuration.send("disable_80chars")

namespace :spec do
  desc "Run rspec-puppet and puppet-lint tasks"
  task :all => [ :spec, :lint ]
end
