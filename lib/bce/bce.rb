require "nokogiri"
require 'zip'
require "../writer.rb"

class BCE
  include Writer

  def name_file(balanza)
    rfc = balanza["RFC"]
    anio = balanza["anio"]
    mes= balanza["mes"]
    preffix="B"+ balanza["TipoEnvio"]

    name_file_xml = rfc + anio + mes+ preffix
    return name_file_xml + ".xml"
  end

  def to_xml_file_sat(folder, balanza)
    xml_name=name_file(balanza)
    path_file_xml = folder+ "/"+ xml_name
    write_to_file(path_file_xml, balanza)
    return  path_file_xml
  end

  def validate_scheme_sat(path_file_xml)
    return validate_scheme(path_file_xml, "BalanzaComprobacion_1_1.xsd")
  end


  def validate_scheme_sat?(path_file_xml)
    array_errors = validate_scheme(path_file_xml, "BalanzaComprobacion_1_1.xsd")
    if array_errors.empty?
      return true
    else
      return false
    end
  end
end
