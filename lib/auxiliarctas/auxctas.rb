require "nokogiri"

module  AuxCtas
  def AuxCtas.to_xml(auxiliarctas)
  builder = Nokogiri::XML::Builder.new do |xml|
    auxiliarctas.writeXML(xml)
  end
  return  builder.to_xml
end

def AuxCtas.write_to_file(path, auxiliarctas)
  xml = AuxCtas.to_xml(auxiliarctas)
  File.write(path, xml)
end

def AuxCtas.validateScheme(path)
  array_errors= Array.new
  xsd = Nokogiri::XML::Schema(File.read("AuxiliarCtas_1_1.xsd"))
  doc = Nokogiri::XML(File.read(path))
  xsd.validate(doc).each do |error|
    array_errors << error.message
  end

end


  def AuxCtas.validateScheme?(path)
    array_errors = AuxCtas.validateScheme(path)
    return array_errors.empty?
  end
end
