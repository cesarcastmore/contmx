class CuentaPredial < WriterXML
  def initializa(para=nil)
    @attributes= ["numero"]
    init(para)
  end

end
