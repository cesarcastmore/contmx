class Emisor < WriterXML
  def initialize(para=nil)
    @attributes = ["nombre", "rfc"]
    @sequence = ["DomicilioFiscal", "ExpedidoEn", "RegimenFiscal"]
    init(para)
  end
end
