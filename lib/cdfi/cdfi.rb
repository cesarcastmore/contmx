require "nokogiri"

module CDFI

  def CDFI.to_xml(comprobante)
    builder = Nokogiri::XML::Builder.new do |xml|
      comprobante.writeXML(xml)
    end
    return  builder.to_xml
  end

  def CDFI.write_to_file(path, comprobante)
    xml = CDFI.to_xml(comprobante)
    File.write(path, xml)
  end

  def CDFI.validateScheme(path)
    array_errors= Array.new
    xsd = Nokogiri::XML::Schema(File.read("cfdv32.xsd"))
    doc = Nokogiri::XML(File.read(path))
    xsd.validate(doc).each do |error|
      array_errors << error.message
      puts error.message
    end

  end


    def CDFI.validateScheme?(path)
      array_errors = CDFI.validateScheme(path)
      return array_errors.empty?
    end



end
