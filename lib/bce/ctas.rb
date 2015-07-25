class Ctas< WriterXML
  def initialize(para)
    @attributes=["NumCta", "SaldoIni", "Debe", "Haber", "SaldoFin", "Importe"]
    from_hash(para)

  end

end
