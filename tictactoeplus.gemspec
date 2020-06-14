
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tictactoeplus/version"

Gem::Specification.new do |spec|
  spec.name          = "tictactoeplus"
  spec.version       = Tictactoeplus::VERSION
  spec.authors       = ["SVR"]
  spec.email         = ["samuel@rourke.tech"]

  spec.summary       = %q{Tic Tac Toe PvP or PvC.}
  spec.homepage      = "https://github.com/SVRourke/tic-tac-toe-plus"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "/bin"
  spec.executables   = "tictactoe"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.13.0"
end
