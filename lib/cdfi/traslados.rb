class Traslados < WriterXML
  def initialize(para)
    @sequence = ["Traslado"]
    from_hash(para)
  end
end
