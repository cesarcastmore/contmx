class Cheque <WriterXML
  def initialize(para=nil)
    @attributes=["Num", "BanEmisNal", "BanEmisExt", "CtaOri", "Fecha", "Benef", "RFC", "Monto",
                "Moneda", "TipCamb"]
    init(para)
  end
end
