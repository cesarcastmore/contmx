require "../writerxml.rb"
require "./ctas.rb"
require "./balanza.rb"
require "./bce.rb"

#Se inicializa el encabezado de la balanza
balanza = Balanza.new(:version =>"1.1", :rfc => "AAA010101AAA", :anio=>"2015", :mes=>"01",
                       :TipoEnvio=>"N")

#Se inicializa las ctas como un arreglo
balanza.ctas= Array.new

#Se inicializa la primera cuenta con un Hash
cuenta_1 = Ctas.new(:numCta=>"10000", :saldoini=>"0",
                    :debe =>"100", :haber=>"0",
                     :saldofin =>"100")

#Si por alguna razon hay un error podemos usar el update para inicializar varios atributos
cuenta_1.update(  :debe =>"0", :haber=>"100")


#Se colocar la primera cuenta a balanza
balanza.ctas <<cuenta_1

#Se inicializa la segunda cuenta en vacio
cuenta_2 = Ctas.new

#Se colocar los atributos uno por uno usando las expresion de arreglo
cuenta_2["numCta"]="100001"
cuenta_2["saldoini"]="0"
cuenta_2["debe"]="100"
cuenta_2["haber"]="0"

balanza.ctas << cuenta_2


#Se sella el con los archivos
balanza.sellar("/home/ccastillo/Desktop/CSD01_AAA010101AAA.cer",
               "/home/ccastillo/Desktop/CSD01_AAA010101AAA.key", "12345678a")

#Se hace el xml, se revice el esquema y luego se hace el zip
writer=BCE.new
path_xml = writer.to_xml_file_sat("/home/ccastillo/Desktop", balanza)

array_errors = writer.validate_scheme_sat(path_xml)
writer.to_zip(path_xml)
