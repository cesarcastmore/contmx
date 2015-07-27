class Receptor < WriterXML
  def initialize(para=nil)
    @attributes = ["nombre", "rfc"]
    @sequence = ["Domicilio"]
    init(para)
  end
end
