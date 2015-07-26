require "../writerxml.rb"
require "./plz.rb"
require "./transferencia.rb"
require "./cheque.rb"
require "./transaccion.rb"
require "./poliza.rb"
require "./polizas.rb"

polizas = Polizas.new(:RFC => "RUBY010215RAI", :version =>"1.1", :mes=>"01", :anio=>"2015",
         :Poliza=>[{:concepto => "concepto 1" }, {:concepto => "concepto 2"},
           { :concepto => "concepto 3"}])

polizas.inspect

PLZ.write_to_file("polizas.xml", polizas)
