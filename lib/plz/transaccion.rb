class Transaccion < WriterXML
  def initialize(para=nil)
    @attributes=["NumCta", "DesCta", "Concepto", "Debe", "Haber"]
    @sequence=["CompNal", "CompNalOtr", "CompExt", "Cheque", "Transferencia","OtrMetodoPago"]
    init(para)
  end
end
