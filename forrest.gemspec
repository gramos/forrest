require 'date'

Gem::Specification.new do |s|
  s.name              = %q{forrest}
  s.version           = "0.1.0"
  s.date              = Date.today.to_s
  s.summary           = %q{Forrest is a runner for stories framework, you can run one story inside of a file that have many stories, can run one scenario or print the list of stories inside a file.}
  s.description       =<<DESCRIPTION
Forrest is a runner for stories framework, you can run one story
inside of a file that have many stories, can run one scenario
or print the list of stories inside a file.
DESCRIPTION

  s.author                = %q{Gaston Ramos}
  s.email                 = %q{ramos.gaston@gmail.com}
  s.homepage              = %q{http://github.com/gramos/forrest}
  s.bindir                = 'bin'
  s.executables           = ['forrest']
  s.default_executable = %q{forrest}
  s.require_paths         = %w{lib bin .}
  s.autorequire           = 'forrest'
  s.rubyforge_project     = %q{forrest}
  s.has_rdoc              = true
  s.required_ruby_version = '>= 1.8'

  # s.add_dependency("rmagick", ">= 1.15.7")
  # s.add_dependency("OptionParser", ">= 0.5.1")

  s.files = Dir.glob("**/*").delete_if { |item| item.include?(".git") }

  # s.signing_key = '/home/gramos/src/ruby/ruby-sign/gem-private_key.pem'
  # s.cert_chain  = ['/home/gramos/src/ruby/ruby-sign/gem-public_cert.pem']

end
