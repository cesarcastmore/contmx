class Polizas < WriterXML
  def initialize(para)
    @attributes=["Version", "RFC", "Mes", "Anio", "TipoSolicitud", "NumOrden",
                 "NumTramite", "Sello", "noCertificado", "Certificado"]
    @sequence = ["Poliza"]
    @schemaLocation="http://www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo http://www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo/PolizasPeriodo_1_1.xsd"
    @targetNamespace={:prefix => "PLZ", :namespace=>"http://www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo" }
    from_hash(para)
  end
end
