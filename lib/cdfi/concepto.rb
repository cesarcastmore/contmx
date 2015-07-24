
class Concepto < WriterXML

  def initialize(hash)
    @attributes=[ "cantidad", "unidad", "noIdentificacion",
        "descripcion", "valorUnitario", "importe"];
    @sequence=["InformacionAduanera", "CuentaPredial", "ComplementoConcepto", "Parte"]
    from_hash(hash)
    end

  end
