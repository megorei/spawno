# Spawno

Spawno starts parallel processes upon rails initialization. Just configure which processes you want to spawn using YAML file.

## Installation

Add this line to your application's Gemfile:

    gem 'spawno', github: 'megorei/spawno'

And then execute:

    $ bundle

Add this line on top of your config.ru file:

```ruby
ENV['SERVER_MODE'] = '1'
```

or set `SERVER_MODE` enviroment variable another way. For example:

    SERVER_MODE=1 rails server

## Usage

Create configuration file in your config directory. For example:

config/spawno.yml

    processes:
      -
        environment: production
        command: clockwork clock.rb
        options:
          :out:
            - log/clockwork.log
            - w+
          :err: :out
      -
        environment: test
        command: another_process
        env:
          RACK_ENV: test
      -
        command: third
env, command and options should be the same as for [spawn](http://www.ruby-doc.org/core-2.1.5/Kernel.html#method-i-spawn) method.
Spawno sets RAILS_ENV to the rails environment it was started from.


## Caveats

If your application runs in [passenger](https://www.phusionpassenger.com/) or similar dispatcher started processes won't be stopped properly upon shutdown as passenger does not terminate parent process.
In this case you can stop processes by stopping them manually like:

config/spawno.yml

    processes:
      - environment: production
        command: pkill -f clockwork

      -
        environment: production
        command: clockwork clock.rb


## Contributing

1. Fork it ( http://github.com/<my-github-username>/spawno/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
