# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "capistrano-requirejs-optimizer"
  gem.version       = '0.0.1'
  gem.authors       = ["Yuki Takei"]
  gem.email         = ["yuki@miketokyo.com", "yuki@smartdrive.co.jp"]
  gem.description   = %q{A capistrano task for r.js optimization.}
  gem.summary       = %q{A capistrano task for r.js optimization.}
  gem.homepage      = "https://github.com/SmartDriveInc/capistrano-requirejs-optimizer.git"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'capistrano', '~> 3.1'
  gem.add_dependency 'capistrano-bundler', '~> 1.1'

end
