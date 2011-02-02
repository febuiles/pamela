# Pamela

I find myself writing the same Rake tasks over and over. Pamela takes care of that for me.

## Installation

    $ gem install pamela

## Usage

In your Rakefile:

    require 'pamela'

    Pamela.load :spec, :console

Then in your terminal:

    $ rake spec
    $ rake console

There are currently three tasks available: `spec`, `test` and `console`.

## Tasks

### spec

Adds your typical `rake spec` task. Includes all the files ending in `_spec.rb` in your `spec/`
directory.


### test

Adds the `rake test` task. Includes all the files matchin in `*test*.rb` in your `test/`
directory.

### console

Adds a console to your application that loads the environment in `lib/`. This is useful for
debugging your applications without having to manually require the files everytime. Expects the
file name of the main file (`lib/something.rb`) to match the project directory name (`something/`).

## Ch-ch-ch-changes

This is a work in progress. Fork away and send pull requests. Report any problems in the [issue
tracker](http://github.com/febuiles/pamela/issues).

Federico Builes - [federico.builes@gmail.com](federico.builes@gmail.com)


