class CuentaPredial < WriterXML
  def initializa(para)
    @attributes= ["numero"]
    from_hash(para)
  end

end
