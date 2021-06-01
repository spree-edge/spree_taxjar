# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_taxjar'
  s.version     = '4.2.0'
  s.summary     = 'Spree extension to calculate sales tax in states of USA'
  s.description = 'Spree extension for providing TaxJar services in USA'
  s.required_ruby_version = '>= 2.1.0'

  s.author    = ['Nimish Gupta', 'Tanmay Sinha']
  s.email     = ['nimish.gupta@vinsol.com', 'tanmay@vinsol.com']
  s.license = 'BSD-3'

  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version = '>= 3.2.0'

  s.add_dependency 'spree_backend', spree_version
  s.add_dependency 'taxjar-ruby', '>= 2.6', '< 3.1'
  s.add_dependency 'deface', '~> 1.0'

  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'spree_dev_tools'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
end
