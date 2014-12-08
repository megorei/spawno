module Spawno
  class Railtie < ::Rails::Railtie
    initializer 'spawno' do |app|
      Spawno.setup(app.root) if ENV['SERVER_MODE'] == '1'
    end
  end
end