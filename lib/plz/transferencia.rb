class Transferencia < WriterXML
  def initialize(para=nil)
    @attributes=["CtaOri", "BancoOriNal", "BancoOriExt", "CtaDesNal", "BancoOriExt",
                  "Fecha", "Benef", "RFC", "Monto", "TipCamb"]

    init(para)
  end
end
