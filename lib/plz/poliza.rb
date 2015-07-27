class Poliza < WriterXML
  def initialize(para=nil)
    @attributes=["NumUnIdenPol", "Fecha", "Concepto"]
    @sequence =["Transaccion"]

    init(para)
  end
end
