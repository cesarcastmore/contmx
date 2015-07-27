class Cuenta< WriterXML
  def initialize(para=nil)
    @attributes=["NumCta", "DesCta", "SaldoIni", "Debe", "Haber", "SaldoFin"]
    @sequence=["DetalleAux"]
    init(para)
  end
end
