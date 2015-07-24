class Retenciones < WriterXML
  def initialize(params)
    @sequence = ["Retencion"]
    from_hash(params)
  end
end
