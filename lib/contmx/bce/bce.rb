require "nokogiri"
require "zip"

module Contmx
  class BCE
    include Writer
    def name_file(repauxfol)
      rfc = repauxfol["RFC"]
      anio = repauxfol["anio"]
      mes= repauxfol["mes"]
      tipo_envio = repauxfol["TipoEnvio"]
      preffix = tipo_envio == 'N' ? "BN" : "BC"
      
      name_file_xml = rfc + anio + mes+ preffix
      return name_file_xml + ".xml"
    end

    def to_xml_file_sat(folder, repauxfol)
      xml_name=name_file(repauxfol)
      path_file_xml = folder+ "/"+ xml_name
      write_to_file(path_file_xml, repauxfol)
      return  path_file_xml
    end

    def validate_scheme_sat(path_file_xml)
      return validate_scheme(path_file_xml, 
        File.dirname(__FILE__)+"/BalanzaComprobacion_1_1.xsd")
    end

    def validate_scheme_sat?(path_file_xml)
      array_errors = validate_scheme(path_file_xml, 
        File.dirname(__FILE__)+"/AuxiliarFolios_1_2.xsd")
      if array_errors.empty?
        return true
      else
        return false
      end
    end
  end
end
