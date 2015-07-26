class Transaccion < WriterXML
  def initialize(para)
    @attributes=["NumCta", "DesCta", "Concepto", "Debe", "Haber"]
    @sequence=["CompNal", "CompNalOtr", "CompExt", "Cheque", "Transferencia","OtrMetodoPago"]
    
  end
end
