require "nokogiri"

require "./writerxml.rb"

require "./cdfi.rb"
require "./comprobante.rb"

require "./emisor.rb"
require "./domiciliofiscal.rb"
require "./expedidoen.rb"
require "./regimenfiscal.rb"

require "./receptor.rb"
require "./domicilio.rb"

require "./conceptos.rb"
require "./concepto.rb"
require "./informacionaduanera.rb"

require "./complementos/timbrefiscaldigital.rb"
require "./comprobante.rb"
require "./complemento.rb"

require "./informacionaduanera.rb"
require "./concepto.rb"
require "./conceptos.rb"
require "./informacionaduanera.rb"

require "./traslado.rb"
require "./retencion.rb"
require "./traslados.rb"
require "./retenciones.rb"
require "./impuestos.rb"
#Nodos como objeto y hash como atributos de los objetos

=begin
Este es un ejemplo de comprobante usando atributos y nodos.
Cada uno de los nodos es declarado como un objecto.
Los atributos son inicializados por un hash
=end

#Cada objecto es inicializado por un hash con sus atributos
comprobante_1 = Comprobante.new( :version=> "3.2",
                :fecha => "2012-11-09T16:47:23", :sello => "vEkO8o2XuLDzfSXDAac5zFGv3G7HY5w11yla4DvUX22eYKWNmcXSO4Ux2w90zcM9A6e8EE3uo6noxWjlbDUUH8GTGqV9oqTiO/t44rM12SQO9MpPljCFIglc0Bl5gfGGK3iweijtG5jW7vXKr2m9ssebSrZUtJ81UwnDJzXr3t8=",
                :formaDePago=> "Pago en una sola exhibicion", :noCertificado=>"20001000000100001708",
                :certificado=>"MIIFGDCCBACgAwIBAgIUMjAwMDEwMDAwMDAxMDAwMDE3MDgwDQYJKoZIhvcNAQEFBQAwggFvMRgwFgYDVQQDDA9BLkMuIGRlIHBydWViYXMxLzAtBgNVBAoMJlNlcnZpY2lvIGRlIEFkbWluaXN0cmFjacOzbiBUcmlidXRhcmlhMTgwNgYDVQQLDC9BZG1pbmlzdHJhY2nDs24gZGUgU2VndXJpZGFkIGRlIGxhIEluZm9ybWFjacOzbjEpMCcGCSqGSIb3DQEJARYaYXNpc25ldEBwcnVlYmFzLnNhdC5nb2IubXgxJjAkBgNVBAkMHUF2LiBIaWRhbGdvIDc3LCBDb2wuIEd1ZXJyZXJvMQ4wDAYDVQQRDAUwNjMwMDELMAkGA1UEBhMCTVgxGTAXBgNVBAgMEERpc3RyaXRvIEZlZGVyYWwxEjAQBgNVBAcMCUNveW9hY8OhbjEVMBMGA1UELRMMU0FUOTcwNzAxTk4zMTIwMAYJKoZIhvcNAQkCDCNSZXNwb25zYWJsZTogSMOpY3RvciBPcm5lbGFzIEFyY2lnYTAeFw0xMDExMTkxOTUzNTZaFw0xMjExMTgxOTUzNTZaMIGxMSAwHgYDVQQDFBdBTkEgQ0VDSUxJQSBHT01FWiBZQdFFWjEgMB4GA1UEKRQXQU5BIENFQ0lMSUEgR09NRVogWUHRRVoxIDAeBgNVBAoUF0FOQSBDRUNJTElBIEdPTUVaIFlB0UVaMRYwFAYDVQQtEw1HT1lBNzgwNDE2R00wMRswGQYDVQQFExJHT1lBNzgwNDE2TURGTlNSMDgxFDASBgNVBAsTC1N1Y3Vyc2FsQVZMMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDUoeNm2qQS/UQJOC5s+QHPoqsXahXJwrKO0MIcY6yvSJJzylJFVTwvQEUjExflfdtzTQLoHGtkOj9/8IiO6yeZJft07tJczQQLpUF4GHg9wfP1xVND20skye7EfrTGTJBdAKahg9TFY20tfk3w1abBFQaV+j1IUvxWCw/dfxudmQIDAQABo4HqMIHnMAwGA1UdEwEB/wQCMAAwCwYDVR0PBAQDAgbAMB0GA1UdDgQWBBT1lw7UbZ795FaVA8ORZ/TkBEvZyzAuBgNVHR8EJzAlMCOgIaAfhh1odHRwOi8vcGtpLnNhdC5nb2IubXgvc2F0LmNybDAzBggrBgEFBQcBAQQnMCUwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNhdC5nb2IubXgvMB8GA1UdIwQYMBaAFOtZfQQimlONnnEaoFiWKfU54KDFMBAGA1UdIAQJMAcwBQYDKgMEMBMGA1UdJQQMMAoGCCsGAQUFBwMCMA0GCSqGSIb3DQEBBQUAA4IBAQCI6Br/9uOa0XpsjYKpq6X5A1PSQ8AsrwpukmnF89oGwr7NkccFZs8cIlX9cbaUsb63vaCK6g2EDuJDmlFco57+I+Wx0RqduRVVcoOc5odmpQJHP0tLE++UK/fUjbJvkGogYzwOQ8x/qJgkrI8StEvwzAUBAuQXCU0W5Unhg/dLyR7DcmEWmRwQkKJMnOEQ6RTiALmY2QIOIEIk6QJ7xmu1V1jLN8A/q9I54+0HZRV8FjoAG5iGEk7P/Mxgyc8btwNOROu3ZL5p2TvoXrb7CAF3sZpTf0FdtpIc/335H0zqS2m6ASk9d+HlA1TWN/I9XTssrHv0nmbtB5CRS8HOS4BR",
                :condicionesDePago => "Comprobante expresado en: Pesos. Con tipo de cambio:1",
                :subTotal => "190.0000", :TipoCambio => "1.0000",
                :moneda => "Pesos", :total => "220.4000",
                :metodoDePago => "Efectivo", :tipoDeComprobante => "ingreso",
                :LugarExpedicion=>"Victoria,Tamaulipas,México")

#La Direccion Fiscal es un nodo hijo de Emisor se puede iniciar tambien desde un hash
emisor =  Emisor.new(:nombre => "RUBY SA de CV", :rfc =>"RUB010101CRS",
                            :DomicilioFiscal => { :calle=>"calle", :municipio=>"Monterrey",
                            :estado=>"Nuevo Leon", :pais=>"Mexico", :codigoPostal=>"34123"},
                            :RegimenFiscal => {:regimen => "REGIMEN GENERAL PERSONAS MORALES"})

#Tambien es posible unir el nodo hijo al padre usando un symbol  y asinar el nodo, pero el
#nombre de los atributos y de los nodos debe de estar en minusculas para usar el set
expedidoen = ExpedidoEn.new(:calle=> "calle", :pais=>"Mexico")
emisor.set(:expedidoen,  expedidoen)
comprobante_1.set(:emisor , emisor)

receptor =  Receptor.new(:nombre => "RAILS SA de CV", :rfc =>"RAI010101CRS")
domicilio = Domicilio.new(:calle=>"calle", :pais=>"Mexico")
receptor.set(:domicilio , domicilio)

comprobante_1.set(:receptor, receptor)

#El nodo de los conceptos es una lista por lo tanto es necesario crear un arreglo
# que se usara como lista
listaConceptos=[]
concepto1 = Concepto.new(:valorUnitario =>"100", :cantidad=>"1",:importe =>"100",
          :unidad=>"unidad", :descripcion=>"Concepto 1")
listaConceptos << concepto1
concepto2 = Concepto.new(:valorUnitario =>"1", :cantidad=>"1",:importe=> "100",
          :unidad=>"unidad", :descripcion=>"Concepto 1")
listaConceptos << concepto2
conceptos = Conceptos.new
#conceptos.inspect
conceptos.set(:concepto, listaConceptos)
comprobante_1.set(:conceptos, conceptos)


#Los impuesto lo podemos inicializar un un arreglo de hashing y luego asignarlo al
#nodo de impuestos
traslados = Traslados.new([{ :Traslado => {:impuesto =>"IVA", :importe=>"32", :tasa=>"16" }}])

traslados.inspect
impuestos = Impuestos.new
impuestos.set(:traslados, traslados)
comprobante_1.set(:impuestos, impuestos);

=begin
El nodo de complementos puede aceptar  nodos hijos como TimbreFiscalDigital y Nomina.
Complementos es una agregado de la SAT donde puede agregar otros nodos que nos son
unicamente los que estan definidos, puede que dentro de unos años agregue mas complementos
o modifique los que tienen definidos.
Si traducimos esto en programacion estamos diciendo que el objeto Complemento tiene una lista
de objecto predefinidos por la SAT.
En este ejemplo agregamos un Timbre al complemento que es uno de los mas comunes en mexico
y mas usado en la programacion.
=end

complemento = Complemento.new([{TimbreFiscalDigital=> { :selloSAT=>"12wef43drg4terdf3"} }])
#complemento.inspect
#timbreFiscal = TimbreFiscalDigital.new(:selloSAT => "12sdf3rfsf3s3")
#complemento.add(timbreFiscal);

comprobante_1.set(:complemento, complemento)

# El CDFI es una especie de lector, escritura y transformaciones.
xml = CDFI.to_xml(comprobante_1);
puts xml
CDFI.write_to_file("comprobante.xml", comprobante_1);
CDFI.validateScheme("comprobante.xml")

#comprobante_2 = CDFI::Comprobante.new(:metodoDePago =>"ingreso",
#          :Emisor => {:nombre => "ruby sa de cv",
#                      :rfc =>"RUB010101CRS",
#                      :ExpedidoEn => { :calle => "calle"}},
#          :Receptor => { :nombre =>"rail sa de cv",
#                        :rfc => "RAI010201ASB",
#                        :Domicilio => { :calle => "calle"}
#                        },
#          :Conceptos => [
#                        {:Concepto => { :valorUnitario => "12.12"}},
#                        {:Concepto => {:valorUnitario => "13.12"}}]);
=begin
Si deseamos agregar el complemento es necesario separar
del hash para crear el objeto Complemento que necesitamos y luego agregarlo al objeto comprobante.
La mayoria de los proveedores te proporcionan los nodos de Complementos por lo tanto fue
una buena estrategia separlos del hash y añadirlos cuando estubieran timbrados.
=end

#complemento = CDFI::Complemento.new;
#timbreFiscal = CDFI::Complementos::TimbreFiscalDigital.new(:selloSAT => "12sdf3rfsf3s3");
#complemento.add(timbreFiscal);
#comprobante_2.complemento =complemento;

#xml = CDFI.to_xml(comprobante_2);
#puts  xml;
