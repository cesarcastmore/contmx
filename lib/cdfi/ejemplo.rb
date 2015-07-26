require "nokogiri"

require "../writerxml.rb"

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
                :fecha => "2012-11-09T16:47:23",
                :formaDePago=> "Pago en una sola exhibicion",
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
domicilio = Domicilio.new(:calle=>" cumbres oro", :pais=>"Mexico")

#Metodo para obtener  los atributos
calle = domicilio["calle"]

#Se pueden sobrescribir en los atributos
domicilio["calle"]="calle nueva"

#Se puede asignar por medio del punto, pero aqui solo es por nodos y no por atributos
receptor.domicilio=domicilio
comprobante_1.receptor=receptor

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

#Se esta certificando el comprobante
comprobante_1.sellar("emisor.cer", "emisor.key", "12345678a")



# El CDFI es una especie de lector, escritura y transformaciones.
xml = CDFI.to_xml(comprobante_1);
puts xml
CDFI.write_to_file("comprobante.xml", comprobante_1);
CDFI.validateScheme("comprobante.xml")




#Ejemplo dos usando totolmento Hash
comprobante_2 = Comprobante.new(:metodoDePago =>"ingreso",
          :Emisor => {:nombre => "ruby sa de cv",
                      :rfc =>"RUB010101CRS",
                      :ExpedidoEn => { :calle => "calle"}},
          :Receptor => { :nombre =>"rail sa de cv",
                        :rfc => "RAI010201ASB",
                        :Domicilio => { :calle => "calle"}
                        },
          :Conceptos => [
                        {:Concepto => { :valorUnitario => "12.12"}},
                        {:Concepto => {:valorUnitario => "13.12"}}])
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

xml = CDFI.to_xml(comprobante_2)
