# WithLocking

A gem for creating a semaphore using a pid file.

## Installation

Add this line to your application's Gemfile:

    gem 'with_locking'

Or install it yourself as:

    $ gem install with_locking

## Usage

A block of code can be executed like so:

    WithLocking.run { puts "this code is locked!" }

Alternatively, run the block of code with an optional name (recommended), that 
way multiple WithLocking blocks with different names can be invoked without 
conflicting:

    WithLocking.run(name: "sleeper") { sleep 60 }
    WithLocking.run(name: "sleeper") do 
        puts "I won't execute and will return false because 'sleeper' 
              is still running the first block." 
    end
    WithLocking.run(name: "other_name") do 
        puts "But I will run because 'other_name' isn't running!"
    end
    # => "But I will run because 'other_name' isn't running!"

To simply test if a named block is still running without executing a block use 
the `locked?` method:

    WithLocking.locked?("sleeper")
    # => true or false

To raise an exception when the block isn't run (rather than simply returning 
false), use the `do!` method:

    WithLocking.run!(name: "sleeper") { puts "Blah" }
    # => raises an error if 'sleeper' block is still running from before
