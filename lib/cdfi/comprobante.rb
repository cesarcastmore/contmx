class Comprobante < WriterXML
  def initialize(hash)
    @targetNamespace = {:prefix => "cfdi", :namespace=>"http://www.sat.gob.mx/cfd/3"  }
    @schemaLocation = "http://www.sat.gob.mx/cfd/3 http://www.sat.gob.mx/sitio_internet/cfd/3/cfdv32.xsd .mx/cfd/3 http://www.sat.gob.mx/sitio_internet/cfd/3/cfdv32.xsd"
    @attributes = [ "serie", "folio", "fecha", "sello",
                  "formaDePago", "noCertificado" , "certificado",
                  "condicionesDePago", "subTotal", "descuentos",
                  "motivoDescuentos", "TipoCambio", "Moneda",
                  "total", "tipoDeComprobante", "metodoDePago",
                   "LugarExpedicion", "numCtaPago", "folioFiscalOrig",
                  "total", "serieFolioFiscalOrig",
                  "fechaFolioFiscalOrig", "montoFolioFiscalOrig", "version"]
    @sequence = ["Emisor", "Receptor", "Conceptos","Impuestos", "Complemento", "Adenda"]
    from_hash(hash)
  end


end

#https://github.com/deseretbook/classy_hash
