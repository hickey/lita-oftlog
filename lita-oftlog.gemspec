Gem::Specification.new do |spec|
  spec.name          = "lita-oftlog"
  spec.version       = "1.0.0"
  spec.authors       = ["Gerard Hickey"]
  spec.email         = ["gerard.hickey@audiencescience.com"]
  spec.description   = "Displays an image deserving of the slap you should receive"
  spec.summary       = "Displays an image deserving of the slap you should receive"
  spec.homepage      = "https://github.com/hickey/lita-oftlog"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.3"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
end
