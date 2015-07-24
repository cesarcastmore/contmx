class RegimenFiscal < WriterXML
  def initialize(para)
    @attributes = ["Regimen"]
    from_hash(para)
  end
end
