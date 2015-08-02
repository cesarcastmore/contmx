require "../writerxml.rb"
require "./plz.rb"
require "./transferencia.rb"
require "./cheque.rb"
require "./transaccion.rb"
require "./poliza.rb"
require "./polizas.rb"

#Creamos el encabezado de la polizas
polizas = Polizas.new(:RFC => "RUBY010215RAI", :version =>"1.1", :mes=>"01", :anio=>"2015")

#El objcto de Polizas es una lista de objectos poliza, entonces estamos inicializando un arreglo
polizas.poliza= Array.new

#Se esta inicializando la primera poliza con sus atributos
poliza_1= Poliza.new(:concepto=> "concepto 1", :fecha=>"12/12/2015")

#En la polizas existe una lista transacciones por lo tanto tambien estamos inicializando un arreglo
poliza_1.transaccion = Array.new

#Creamos la primera transaccion con sus atributos
transaccion_1 = Transaccion.new(:debe=>"12", :haber=>"0")

#Vamos a crear dos cheques y una transaccion para ver la diferencias de usar arreglo y nos arreglos
cheque_1 = Cheque.new(:num =>"12.12")
cheque_2 = Cheque.new(:num =>"12.12")
transaccion_1.cheque= Array.new
transaccion_1.cheque << cheque_1
transaccion_1.cheque << cheque_2

#Estamos escribiendo transferencia como un solo objeto y no como una lista
transferencia_1 = Transferencia.new(:ctaori =>"12345678")
transaccion_1.transferencia = transferencia_1


#Escribimos las primera transacciones
poliza_1.transaccion << transaccion_1


#Podemos colocar mas transacciones si es necesario
transaccion_2 = Transaccion.new(:debe=>"12", :haber=>"0")
poliza_1.transaccion << transaccion_2


#Escribimos la primera poliza a polizas
polizas.poliza << poliza_1

#Se pueden agregar mas polizas si se desea
poliza_2= Poliza.new(:concepto=> "concepto 1", :fecha=>"12/12/2015")
polizas.poliza << poliza_2


#Imprimimos xml a archivo y luegos lo transformamos a zip
writer=PLZ.new
path_xml = writer.to_xml_file_sat("/home/ccastillo/Desktop", polizas)

array_errors = writer.validate_scheme_sat(path_xml)
writer.to_zip(path_xml)
