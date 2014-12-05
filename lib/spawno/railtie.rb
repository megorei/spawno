module Spawno
  class Railtie < ::Rails::Railtie
    initializer 'spawno' do |app|
      Spawno.setup(app.root)
    end
  end
end