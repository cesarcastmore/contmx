require "./writerxml.rb"
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
                   :desc =>"cuenta 1 ", :subCtaDe=>"1.01",
                    :nivel=>"1", :natur=>"D")
cuentas << cuenta_2
catalogo.set(:ctas, cuentas)


CatalogoCuentas.write_to_file("catalogocuenta.xml", catalogo)
CatalogoCuentas.validateScheme("catalogocuenta.xml")
