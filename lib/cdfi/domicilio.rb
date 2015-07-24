class Domicilio < WriterXML

  def initialize(hash)
    @attributes=["calle", "noExterior", "noInterior", "colonia", "localidad", "referencia",
                  "municipio", "estado", "pais", "codigoPostal"]
    from_hash(hash)
  end

end
