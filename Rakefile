require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = "reversi_spec.rb"
  t.rspec_opts = ["--format documentation", "--color", "--order=default"]

#  t.rspec_opts << "-I #{ARGV[1]}"
end

task :default => :spec
