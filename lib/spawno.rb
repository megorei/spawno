require 'spawno/version'
require 'spawno/config'
require 'spawno/spawner'

module Spawno
  def self.root
    Dir.pwd
  end

  def self.setup(root = self.root)
    Config.setup(File.join(root, 'config', 'spawno.yml'))

    Config.processes.each do |process_conf|
      Spawner.new.spawn(process_conf)
    end
  end
end

if defined?(Rails)
  require 'spawno/railtie'
else
  Spawno.setup
end
