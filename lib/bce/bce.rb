require "nokogiri"
require 'zip'


module BCE

  def BCE.to_xml(balanza)
    builder = Nokogiri::XML::Builder.new do |xml|
      balanza.writeXML(xml)
    end
    return  builder.to_xml
  end

  def BCE.write_to_file(path, balanza)
    xml = BCE.to_xml(balanza)
    File.write(path, xml)
  end

  def BCE.validateScheme(path)
    array_errors= Array.new
    xsd = Nokogiri::XML::Schema(File.read("BalanzaComprobacion_1_1.xsd"))
    doc = Nokogiri::XML(File.read(path))
    xsd.validate(doc).each do |error|
      array_errors << error.message
    end
  end

    def BCE.to_zip(folder, balanza)

      rfc = balanza["RFC"]
      anio = balanza["anio"]
      mes= balanza["mes"]
      preffix="B"+ balanza["TipoEnvio"] 

      name_file = rfc + anio + mes+ preffix
      path_xml = folder + "/" + name_file+ ".xml"
      path_zip = folder + "/" + name_file+ ".zip"

      BCE.write_to_file(path_xml, balanza)

      input_filenames = Array.new
      input_filenames << name_file + ".xml"

      Zip::File.open(path_zip, Zip::File::CREATE) do |zipfile|
        input_filenames.each do |filename|
          zipfile.add(filename, path_xml)
        end
      end
end


    def BCE.validateScheme?(path)
      array_errors = BCE.validateScheme(path)
      return array_errors.empty?
    end
end
