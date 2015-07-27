class AuxiliarCtas < WriterXML
  def initialize(para=nil)
    @attributes=["Version", "RFC", "Mes", "Anio", "TipoSolicitud", "NumOrden", "NumTramite",
      "Sello", "noCertificado", "Certificado"]
      @sequence=["Cuenta"]
      @schemaLocation="http://www.sat.gob.mx/esquemas/ContabilidadE/1_1/AuxiliarCtas http://www.sat.gob.mx/esquemas/ContabilidadE/1_1/AuxiliarCtas/AuxiliarCtas_1_1.xsd"
      @targetNamespace={:prefix => "AuxiliarCtas", :namespace=>"http://www.sat.gob.mx/esquemas/ContabilidadE/1_1/AuxiliarCtas" }
      init(para)
  end

end
