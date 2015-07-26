require "nokogiri"
module PLZ

def PLZ.to_xml(polizas)
  builder = Nokogiri::XML::Builder.new do |xml|
    polizas.writeXML(xml)
  end
  return  builder.to_xml
end

def PLZ.write_to_file(path, polizas)
  xml = PLZ.to_xml(polizas)
  File.write(path, xml)
end

def PLZ.validateScheme(path)
  array_errors= Array.new
  xsd = Nokogiri::XML::Schema(File.read("PolizasPeriodo_1_1.xsd"))
  doc = Nokogiri::XML(File.read(path))
  xsd.validate(doc).each do |error|
    array_errors << error.message
  end

end


  def PLZ.validateScheme?(path)
    array_errors = PLZ.validateScheme(path)
    return array_errors.empty?
  end
end
