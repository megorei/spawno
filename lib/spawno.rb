require 'spawno/version'
require 'spawno/config'

module Spawno
  def self.root
    Dir.pwd
  end

  def self.spawn(command, env = {}, options = {})
    Kernel.spawn({'SPAWNO' => 'true'}.merge(env), command, options) if ENV['SPAWNO'].nil?
  end

  def self.setup(root = self.root)
    Config.setup(File.join(root, 'config', 'spawno.yml'))

    Config.processes.each do |process_conf|
      env, command, options = process_conf.values_at('env', 'command', 'options')
      env     ||= {}
      options ||= {}
      Spawno.spawn(command, defined?(Rails) ? env.merge('RAILS_ENV' => Rails.env) : env, options)
    end
  end
end

if defined?(Rails)
  require 'spawno/railtie'
else
  Spawno.setup
end
