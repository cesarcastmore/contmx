require "../writerxml.rb"
require "./ctas.rb"
require "./balanza.rb"
require "./bce.rb"

balanza = Balanza.new(:version =>"1.1", :rfc => "AAA010101AAA", :anio=>"2015", :mes=>"01",
                       :TipoEnvio=>"N")

cuentas = Array.new
cuenta_1 = Ctas.new(:numCta=>"10000", :saldoini=>"0",
                    :debe =>"100", :haber=>"0",
                     :saldofin =>"100")
cuentas <<cuenta_1
cuenta_2 = Ctas.new(:numCta=>"10002", :saldoini=>"0",
                    :debe =>"100", :haber=>"0",
                     :saldofin =>"100")
cuentas << cuenta_2
balanza.set(:ctas, cuentas)
#balanza.sellar("/home/ccastillo/Desktop/CSD01_AAA010101AAA.cer",
#               "/home/ccastillo/Desktop/CSD01_AAA010101AAA.key", "12345678a")

writer=BCE.new
path_xml = writer.to_xml_file_sat("/home/ccastillo/Desktop", balanza)

array_errors = writer.validate_scheme_sat(path_xml)
puts array_errors
writer.to_zip(path_xml)
