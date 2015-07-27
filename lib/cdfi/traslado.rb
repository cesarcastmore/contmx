class Traslado < WriterXML
  def initialize(para=nil)
    @attributes = ["impuesto", "importe", "tasa"]
    init(para)
  end
end
