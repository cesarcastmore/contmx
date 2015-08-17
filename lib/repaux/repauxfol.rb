class RepAuxFol < WriterXML
  def initialize(para=nil)
    @attributes= ["Version", "RFC", "Mes", "Anio", "TipoSolicitud", "NumOrden",
    	"NumTramite", "Sello", "noCertificado", "Certificado"]
    @sequence = ["DetAuxFol"]
    @schemaLocation = "http://www.sat.gob.mx/esquemas/ContabilidadE/1_1/AuxiliarFolios http://www.sat.gob.mx/esquemas/ContabilidadE/1_1/AuxiliarFolios/AuxiliarFolios_1_2.xsd"
    @targetNamespace = {
    	:prefix => "RepAux", 
    	:namespace=>"www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas" 
    }
    init(para)
end
