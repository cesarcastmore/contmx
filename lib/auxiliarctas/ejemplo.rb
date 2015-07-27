require "../writerxml.rb"

require "./detalleaux.rb"
require "./cuenta.rb"
require "./auxiliarctas.rb"
require "./auxctas.rb"


auxiliarctas= AuxiliarCtas.new(:version=>"1.2", :rfc=>"RUBY010215RAI")

cuenta_1 =Cuenta.new
cuenta_1["numCta"]="10002"
cuenta_1["desCta"]="cuenta 1"
cuenta_1["saldoIni"]="0"
cuenta_1["debe"]="10"
cuenta_1["haber"]="20"
cuenta_1["saldoFin"]="20"

cuenta_1.update(:DetalleAux=>[{:Fecha=>"01/01/2014", :concepto=>"concepto1" },
                            {:Fecha=>"01/02/2014", :concepto=>"concepto2"}])

auxiliarctas.cuenta= cuenta_1

xml=AuxCtas.to_xml(auxiliarctas)
puts xml
