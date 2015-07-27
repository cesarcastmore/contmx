class Traslados < WriterXML
  def initialize(para=nil)
    @sequence = ["Traslado"]
    init(para)
  end
end
