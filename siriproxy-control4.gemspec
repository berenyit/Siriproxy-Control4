# -*- encoding: utf-8 -*-
require File.expand_path('../lib/siriproxy-control4/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Csaba Pales"]
  gem.email         = ["cpales@gmail.com"]
  gem.description   = %q{Siri Proxy Control4 plugin}
  gem.summary       = %q{Siri Proxy Control4 plugin}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "siriproxy-control4"
  gem.require_paths = ["lib"]
  gem.version       = Siriproxy::Control4::VERSION
end
