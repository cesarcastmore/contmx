class CompExt < WriterXML
  def initialze(para=nil)
    @attributes= ["NumFactExt", "TaxID", "MontoTotal", "Moneda", "TipCamb"]
    init(para)
  end
end
