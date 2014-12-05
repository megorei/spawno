class Spawner
  def spawn(process_conf)
    command, env, options, environment = spawn_arguments(process_conf)
    if ENV['SPAWNO'].nil? and matching_environment?(environment)
      Kernel.spawn(env, command, options)
    end
  end

  def env_vars(env)
    {'SPAWNO' => 'true'}.merge(rails? ? env.merge('RAILS_ENV' => Rails.env) : env)
  end

  def matching_environment?(environment)
    rails? ? Rails.env == environment : true
  end

  def rails?
    defined?(Rails)
  end

  def spawn_arguments(process_conf)
    command, env, options, environment = process_conf.values_at('command', 'env', 'options', 'environment')
    env     ||= {}
    options ||= {}
    [command, env_vars(env), options, environment]
  end
end