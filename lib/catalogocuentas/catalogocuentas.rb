require "nokogiri"
require "../writer.rb"

class CatalogoCuentas
  include Writer

  def name_file(catalogo)
    rfc = catalogo["RFC"]
    anio = catalogo["anio"]
    mes= catalogo["mes"]
    preffix="CT"

    name_file_xml = rfc + anio + mes+ preffix
    return name_file_xml + ".xml"
  end

  def to_xml_file_sat(folder, catalogo)
    xml_name=name_file(catalogo)
    path_file_xml = folder+ "/"+ xml_name
    write_to_file(path_file_xml, catalogo)
    return  path_file_xml
  end

  def validate_scheme_sat(path_file_xml)
    return validate_scheme(path_file_xml, "CatalogoCuentas_1_1.xsd")
  end


  def validate_scheme_sat?(path_file_xml)
    array_errors = validate_scheme(path_file_xml, "CatalogoCuentas_1_1.xsd")
    if array_errors.empty?
      return true
    else
      return false
    end
  end

end
