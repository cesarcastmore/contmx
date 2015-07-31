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


writer=PLZ.new
path_xml = writer.to_xml_file_sat("/home/ccastillo/Desktop", polizas)

array_errors = writer.validate_scheme_sat(path_xml)
puts array_errors
writer.to_zip(path_xml)
