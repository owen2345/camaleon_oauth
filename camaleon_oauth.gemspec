$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'camaleon_oauth/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = 'camaleon_oauth'
  s.version = CamaleonOauth::VERSION
  s.authors = ['Owen']
  s.email = ['owenperedo@gmail.com']
  s.homepage = ''
  s.summary = ': Summary of CamaleonOauth.'
  s.description = ': Description of CamaleonOauth.'
  s.license = 'MIT'

  s.files = Dir['{app,config,db,lib,docs}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails'
  s.add_dependency 'doorkeeper', '~> 3.0'
  s.add_dependency 'responders', '~> 2.0'
  s.add_dependency 'swagger-docs', '~> 0.1'
  s.add_dependency 'active_model_serializers', '0.9.2'
  s.add_dependency 'faraday', '~> 0.9.2'

  s.add_development_dependency 'sqlite3'
end
