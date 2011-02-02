$LOAD_PATH.unshift 'lib'
require 'pamela/version'

Gem::Specification.new do |s|
  s.name              = "pamela"
  s.version           = Pamela::VERSION
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "Pamela is your personal Rake assistant."
  s.homepage          = "http://github.com/febuiles/pamela"
  s.email             = "federico.builes@gmail.com"
  s.authors           = [ "Federico Builes" ]
  s.has_rdoc          = false

  s.files             = %w( README.md Rakefile  )
  s.files            += Dir.glob("lib/**/*")

  s.add_development_dependency "mocha"

  s.description       = "See the README or https://github.com/febuiles/pamela for usage information."
end
