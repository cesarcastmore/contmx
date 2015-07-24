class Retencion < WriterXML
  def initialize(param)
    @attributes =["importe", "impuesto"]

    from_hash(param)
  end
end
