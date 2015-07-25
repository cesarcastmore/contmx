require "nokogiri"

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


    def BCE.validateScheme?(path)
      array_errors = BCE.validateScheme(path)
      return array_errors.empty?
    end
end
