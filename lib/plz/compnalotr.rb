class CompNalOtr < WriterXML
  def initialize(para=nil)
    @attributes=["CFD_CBB_Serie", "CFD_CBB_NumFol", "RFC", "MontoTotal", "Moneda", "TipCamb", ]
    init(para)
  end
end
