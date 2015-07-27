class Impuestos < WriterXML
  def initialize(para=nil)
    @attributes = ["totalImpuestosRetenidos", "totalImpuestosTrasladados"]
    @sequence = ["Retenciones", "Traslados"]
    init(para)

  end
end
