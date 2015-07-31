require "../writerxml.rb"
require "./ctas.rb"
require "./catalogo.rb"
require "./catalogocuentas.rb"


#Se esta inicializando todos el catalogo de cuentas con un hash

catalogo = Catalogo.new(:version =>"1.1", :rfc => "RUB010215RAI", :anio=>"2015", :mes=>"01")

cuentas = Array.new
cuenta_1 = Ctas.new(:codAgrup=>"604.49", :numCta=>"100001",
                    :desc =>"cuenta 1 ", :subCtaDe=>"1.01",
                     :nivel =>"1" , :natur=>"D")
cuentas <<cuenta_1
cuenta_2= Ctas.new(:codAgrup=>"604.49", :numCta=>"100001",
                   :desc =>"cuenta 2", :subCtaDe=>"1.01",
                    :nivel=>"1", :natur=>"D")
cuentas << cuenta_2

#otra forma divertida de crear  una cuenta
cuenta_3 = Ctas.new
cuenta_3["desc"] = "cuenta 3"
cuenta_3["subCtaDe"] = "1.01"
cuenta_3["nivel"] = "2"
cuenta_3["codAgrup"] = "60"
cuenta_3["natur"] = "D"
cuenta_3["numCta"] = "100003"


cuentas << cuenta_3

catalogo.set(:ctas, cuentas)

writer=CatalogoCuentas.new
path_xml = writer.to_xml_file_sat("/home/ccastillo/Desktop", catalogo)

array_errors = writer.validate_scheme_sat(path_xml)
puts array_errors
writer.to_zip(path_xml)
