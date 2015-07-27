class DomicilioFiscal < WriterXML
  def initialize(para=nil)
    @attributes =["calle", "noExterior", "noInterior", "colonia", "localidad", "referencia",
                "municipio", "estado", "pais", "codigoPostal"]
    init(para)
  end
end
