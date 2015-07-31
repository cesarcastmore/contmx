require "zip"

module Writer

  def to_xml(object)
    builder = Nokogiri::XML::Builder.new do |xml|
      object.writeXML(xml)
    end
    return  builder.to_xml
  end

  def write_to_file(path_file, object)
    xml = to_xml(object)
    File.write(path_file, xml)
  end

  def validate_scheme(path_file, path_scheme)
    array_errors= Array.new
    xsd = Nokogiri::XML::Schema(File.read(path_scheme))
    doc = Nokogiri::XML(File.read(path_file))
    xsd.validate(doc).each do |error|
      array_errors << error.message
    end
  end


  def to_zip(path_xml)

    puts path_xml

    path_zip = path_xml.sub ".xml" ,".zip"


    input_filenames = Array.new
    name_file = File.basename(path_xml)
    input_filenames << name_file

    Zip::File.open(path_zip, Zip::File::CREATE) do |zipfile|
      input_filenames.each do |filename|
        zipfile.add(filename, path_xml)
      end
    end
    end



end
