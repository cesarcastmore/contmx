class Receptor < WriterXML
  def initialize(hash)
    @attributes = ["nombre", "rfc"]
    @sequence = ["Domicilio"]
    from_hash(hash)
  end
end
