# -*- encoding: utf-8 -*-
require File.expand_path('../lib/with_locking/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Marty Kraft"]
  gem.email         = ["marty.kraft@gmail.com"]
  gem.description   = %q{A gem to execute a block of code and ensure that one 
                        does not execute other code until the block has 
                        completed executing.}
  gem.summary       = %q{Writes a file before executing a given block and then 
                        deletes the file when the block has executed. If the 
                        file is still there then next time a block is invoked 
                        through WithLocking then it is assumed that the first 
                        block is still running and the new block isn't 
                        executed.}
  gem.homepage      = "https://github.com/mkraft/with_locking"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "with_locking"
  gem.require_paths = ["lib"]
  gem.version       = WithLocking::VERSION
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rake"
end
