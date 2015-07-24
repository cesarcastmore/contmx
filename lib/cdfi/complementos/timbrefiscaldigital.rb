class TimbreFiscalDigital < WriterXML
  def initialize(hash)
    @targetNamespace = {:prefix => "tfd", :namespace=> "http://www.sat.gob.mx/TimbreFiscalDigital" }
    @schemaLocation = "http://www.sat.gob.mx/TimbreFiscalDigital http://www.sat.gob.mx/TimbreFiscalDigital/TimbreFiscalDigital.xsd"
    @attributes =  ["selloSAT", "noCertificadoSAT", "selloCFD", "fechaTimbrado", "uiid", "version"]
    from_hash(hash);
  end
end
