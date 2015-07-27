class Balanza< WriterXML
  def initialize(para=nil)
    @attributes = ["Version", "RFC", "Mes", "Anio","TipoEnvio", "FechaModBal","Sello", "noCertificacion", "Certificacion"]
    @sequence = ["Ctas"]
    @schemaLocation="www.sat.gob.mx/esquemas/ContabilidadE/1_1/BalanzaComprobacion http://www.sat.gob.mx/esquemas/ContabilidadE/1_1/BalanzaComprobacion/BalanzaComprobacion_1_1.xsd"
    @targetNamespace = {:prefix => "BCE", :namespace=>"http://www.sat.gob.mx/esquemas/ContabilidadE/1_1/BalanzaComprobacion" }

    init(para)
  end
end
