require "nokogiri"

module CatalogoCuentas

  def CatalogoCuentas.to_xml(catalogo)
    builder = Nokogiri::XML::Builder.new do |xml|
      catalogo.writeXML(xml)
    end
    return  builder.to_xml
  end

  def CatalogoCuentas.write_to_file(path, catalogo)
    xml = CatalogoCuentas.to_xml(catalogo)
    File.write(path, xml)
  end

  def CatalogoCuentas.validateScheme(path)
    array_errors= Array.new
    xsd = Nokogiri::XML::Schema(File.read("CatalogoCuentas_1_1.xsd"))
    doc = Nokogiri::XML(File.read(path))
    xsd.validate(doc).each do |error|
      array_errors << error.message
      puts error.message
    end

  end


    def CatalogoCuentas.validateScheme?(path)
      array_errors = CDFI.validateScheme(path)
      return array_errors.empty?
    end



end
