require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'

# Disable specific puppet-lint checks
PuppetLint.configuration.send("disable_80chars")
PuppetLint.configuration.send("disable_class_inherits_from_params_class")

namespace :spec do
  desc "Run rspec-puppet and puppet-lint tasks"
  task :all => [ :spec, :lint ]
end
