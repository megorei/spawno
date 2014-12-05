require 'yaml'

module Spawno
  class Configuration
    attr_accessor :settings

    def initialize
      self.settings = {}
    end

    def load_from_file(path)
      self.settings.merge! YAML.load_file(path)
    end

    def setup(path = nil)
      load_from_file(path) if path
    end

    def method_missing(method_name)
      settings[method_name.to_s]
    end
  end

  Config = Configuration.new
end

