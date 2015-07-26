class Transferencia < WriterXML
  def initialize(para)
    @attributes=["CtaOri", "BancoOriNal", "BancoOriExt", "CtaDesNal", "BancoOriExt",
                  "Fecha", "Benef", "RFC", "Monto", "TipCamb"]
                  
    from_hash(para)
  end
end
