
class Concepto < WriterXML

  def initialize(para=nil)
    @attributes=[ "cantidad", "unidad", "noIdentificacion",
        "descripcion", "valorUnitario", "importe"];
    @sequence=["InformacionAduanera", "CuentaPredial", "ComplementoConcepto", "Parte"]
    init(para)
    end

  end
