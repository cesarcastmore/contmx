require "../writerxml.rb"
require "./ctas.rb"
require "./balanza.rb"
require "./bce.rb"

balanza = Balanza.new(:version =>"1.1", :rfc => "RUB010215RAI", :anio=>"2015", :mes=>"01")

cuentas = Array.new
cuenta_1 = Ctas.new(:numCta=>"10000", :saldoini=>"0",
                    :debe =>"100", :haber=>"0",
                     :saldofin =>"100" , :importe=>"100")
cuentas <<cuenta_1
cuenta_2 = Ctas.new(:numCta=>"10002", :saldoini=>"0",
                    :debe =>"100", :haber=>"0",
                     :saldofin =>"100" , :importe=>"100")
cuentas << cuenta_2
balanza.set(:ctas, cuentas)


BCE.write_to_file("balanza.xml", balanza)
BCE.validateScheme("balanza.xml")
