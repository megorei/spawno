# Spawno

Spawno starts parallel processes upon rails initialization. Just configure which processes you want to spawn using YAML file.

## Installation

Add this line to your application's Gemfile:

    gem 'spawno', github: 'megorei/spawno'

And then execute:

    $ bundle

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

## Contributing

1. Fork it ( http://github.com/<my-github-username>/spawno/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
