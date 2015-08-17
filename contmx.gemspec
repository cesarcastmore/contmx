Gem::Specification.new do |s|
  s.name        = 'contmx'
  s.version     = '0.0.4'
  s.date        = '2015-07-27'
  s.summary     = "XML de contabilidad de mexico"
  s.description = "Contabilidad en medios electronicos"
  s.authors     = ["Cesar Castillo Moreno"]
  s.email       = 'cesar.cast.more@gmail.com'
  s.files    = `git ls-files`.split($/)
  s.homepage    =
    'https://github.com/cesarcastmore/contmx'
  s.license       = 'MIT'
  s.add_development_dependency 'nokogiri', '>= 1.6.6.2'
  s.add_development_dependency 'rubyzip' , '>= 1.1.4'

end
