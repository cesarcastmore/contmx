class Poliza < WriterXML
  def initialize(para)
    @attributes=["NumUnIdenPol", "Fecha", "Concepto"]
    @sequence =["Transaccion"]

    from_hash(para)
  end
end
