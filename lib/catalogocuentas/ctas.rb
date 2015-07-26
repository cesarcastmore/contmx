class Ctas <WriterXML
  def initialize(para=nil)
    @attributes=["CodAgrup", "NumCta", "Desc", "SubCtaDe", "Nivel", "Natur"]
    from_hash(para)
  end
end
