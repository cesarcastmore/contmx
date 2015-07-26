class Cheque <WriterXML
  def initialize(para)
    @attributes=["Num", "BanEmisNal", "BanEmisExt", "CtaOri", "Fecha", "Benef", "RFC", "Monto",
                "Moneda", "TipCamb"]
    from_hash(para)
  end
end
