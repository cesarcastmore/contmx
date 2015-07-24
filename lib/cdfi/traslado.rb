class Traslado < WriterXML
  def initialize(para)
    @attributes = ["impuesto", "importe", "tasa"]
    from_hash(para)
  end
end
