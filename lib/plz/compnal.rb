class CompNal < WriterXML

  def initialize(para)
    @attributes=["UUID_CFDI", "RFC", "MontoTotal", "Moneda", "TipCamb"]
    from_hash(para)
  end

end
