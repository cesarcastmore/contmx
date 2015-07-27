class Parte < WriterXML
  def initialize(para=nil)
    @sequence = ["InformacionAduanera"]
    init(para)
  end
end
