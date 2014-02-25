# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'audio_fingerprint/version'

Gem::Specification.new do |spec|
  spec.name          = "audio-fingerprint"
  spec.version       = AudioFingerprint::VERSION
  spec.authors       = ["Rafael Fragoso"]
  spec.email         = ["rafaelfragosom@gmail.com"]
  spec.summary       = %q{Small gem to fingerprint .wav audio files and compare them}
  spec.description   = %q{This gem can fingerprint from small to large pieces of wav audio and run a math to compare them (this is very handy to compare audio notes)}
  spec.homepage      = "https://github.com/rafaelfragosom/audio-fingerprint"
  spec.license       = "MIT"

  spec.files         = Dir["{lib,bin,test}/**/*", "Rakefile", "README.rdoc", "*.gemspec"]
  spec.executables   = %w(audio_fingerprint)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", '~> 0'
  spec.add_dependency "fftw3", '~> 0'
end
