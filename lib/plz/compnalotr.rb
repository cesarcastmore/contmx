class CompNalOtr < WriterXML
  def initialize(para)
    @attributes=["CFD_CBB_Serie", "CFD_CBB_NumFol", "RFC", "MontoTotal", "Moneda", "TipCamb", ]
    from_hash(para)
  end
end
