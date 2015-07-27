class CompNal < WriterXML

  def initialize(para=nil)
    @attributes=["UUID_CFDI", "RFC", "MontoTotal", "Moneda", "TipCamb"]
    init(para)
  end

end
