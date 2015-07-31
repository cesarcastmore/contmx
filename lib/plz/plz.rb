require "nokogiri"
require "../writer.rb"


class PLZ
  include Writer

  def name_file(polizas)
    rfc = polizas["RFC"]
    anio = polizas["anio"]
    mes= polizas["mes"]
    preffix="PL"

    name_file_xml = rfc + anio + mes+ preffix
    return name_file_xml + ".xml"
  end

  def to_xml_file_sat(folder, polizas)
    xml_name=name_file(polizas)
    path_file_xml = folder+ "/"+ xml_name
    write_to_file(path_file_xml, polizas)
    return  path_file_xml
  end

  def validate_scheme_sat(path_file_xml)
    return validate_scheme(path_file_xml, "PolizasPeriodo_1_1.xsd")
  end


  def validate_scheme_sat?(path_file_xml)
    array_errors = validate_scheme(path_file_xml, "PolizasPeriodo_1_1.xsd")
    if array_errors.empty?
      return true
    else
      return false
    end
  end


end
