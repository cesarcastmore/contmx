class Parte < WriterXML
  def initialize(params)
    @sequence = ["InformacionAduanera"]
    from_hash(params)
  end
end
