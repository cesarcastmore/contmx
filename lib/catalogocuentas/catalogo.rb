class Catalogo <WriterXML
  def initialize(para=nil)
    @attributes = ["Version", "RFC", "Mes", "Anio", "Sello", "noCertificacion", "Certificacion"]
    @sequence = ["Ctas"]
    @schemaLocation="www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas http://www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas/CatalogoCuentas_1_1.xsd"
    @targetNamespace = {:prefix => "catalogocuentas", :namespace=>"www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas" }

    from_hash(para)
  end

end
