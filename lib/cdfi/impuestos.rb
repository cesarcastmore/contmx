class Impuestos < WriterXML
  def initialize(param=nil)
    @attributes = ["totalImpuestosRetenidos", "totalImpuestosTrasladados"]
    @sequence = ["Retenciones", "Traslados"]
    from_hash(param)

  end
end
