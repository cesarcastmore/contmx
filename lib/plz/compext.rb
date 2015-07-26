class CompExt < WriterXML
  def initialze(para)
    @attributes= ["NumFactExt", "TaxID", "MontoTotal", "Moneda", "TipCamb"]
    from_hash(para)
  end
end
