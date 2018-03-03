# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "shackleton/version"

Gem::Specification.new do |spec|
  spec.name          = "shackleton"
  spec.version       = Shackleton::VERSION
  spec.authors       = ["Adam Carlile"]
  spec.email         = ["github@adamcarlile.com"]

  spec.summary       = %q{Map your way across that cold tudra of API consuming}
  spec.homepage      = "https://github.com/adamcarlile/shackelton"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "mustermann"
  spec.add_dependency "mustermann-contrib"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
