class RegimenFiscal < WriterXML
  def initialize(para=nil)
    @attributes = ["Regimen"]
    init(para)
  end
end
