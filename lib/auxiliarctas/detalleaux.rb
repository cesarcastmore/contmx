class DetalleAux < WriterXML
  def initialize(para=nil)
    @attributes=["Fecha", "NumUnIdenPol", "Concepto", "Debe", "Haber"]
    init(para)
  end

end
