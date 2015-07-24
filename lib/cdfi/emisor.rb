class Emisor < WriterXML
  def initialize(hash)
    @attributes = ["nombre", "rfc"]
    @sequence = ["DomicilioFiscal", "ExpedidoEn", "RegimenFiscal"]
    from_hash(hash)
  end
end
