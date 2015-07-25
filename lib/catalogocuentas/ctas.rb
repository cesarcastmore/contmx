class Ctas <WriterXML
  def initialize(para)
    @attributes=["CodAgrup", "NumCta", "Desc", "SubCtaDe", "Nivel", "Natur"]
    from_hash(para)
  end
end
