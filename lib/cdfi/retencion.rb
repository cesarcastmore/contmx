class Retencion < WriterXML
  def initialize(para=nil)
    @attributes =["importe", "impuesto"]

    init(para)
  end
end
