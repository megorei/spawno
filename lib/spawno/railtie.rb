module Spawno
  class Railtie < ::Rails::Railtie
    initializer 'spawno' do |app|
      Spawno.setup(app.root) if defined?(Rails::Server)
    end
  end
end