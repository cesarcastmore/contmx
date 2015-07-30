require 'openssl'
require 'base64'

class Balanza< WriterXML
  def initialize(para=nil)
    @attributes = ["Version", "RFC", "Mes", "Anio","TipoEnvio", "FechaModBal","Sello", "noCertificado", "Certificado"]
    @sequence = ["Ctas"]
    @schemaLocation="www.sat.gob.mx/esquemas/ContabilidadE/1_1/BalanzaComprobacion http://www.sat.gob.mx/esquemas/ContabilidadE/1_1/BalanzaComprobacion/BalanzaComprobacion_1_1.xsd"
    @targetNamespace = {:prefix => "BCE", :namespace=>"http://www.sat.gob.mx/esquemas/ContabilidadE/1_1/BalanzaComprobacion" }

    init(para)
  end
  #Metodo que sella  con el certificado, la llave privada y el password

  def sellar(cert_file, key_file, password)
    nocertificado=""
    certificado=""
    raw = File.read cert_file
    certificate = OpenSSL::X509::Certificate.new raw
    certificate.serial.to_s(16).scan(/.{2}/).each {|v| nocertificado += v[1] }
    certificado = certificate.to_s.gsub(/^-.+/, '').gsub(/\n/, '')

    digest = OpenSSL::Digest::SHA1.new
    pem_file = export_to_pem(key_file, password )

    pkey = OpenSSL::PKey::RSA.new( File.read(pem_file), password)
    signature = pkey.sign(OpenSSL::Digest::SHA1.new, certificado)
    #puts pkey.verify(digest, signature,  certificado)
    sello =Base64.encode64(signature).gsub(/\n/, '')

    set(:certificado, certificado)
    set(:nocertificado, nocertificado)
    set(:sello, sello)


  end

#Metodo que hace el archivo key a pem, se esta utilizando la consola del sistema.
  def export_to_pem(key, password)
    pem_file = key.gsub('.key', '.pem')

    if File.exist?(pem_file)
      return pem_file
    else
      command = "openssl pkcs8 -inform DER -in someKey.key -passin pass:somePassword -out key.pem"

      pem_file = key.gsub('.key', '.pem')

      command.gsub! 'someKey.key', key
      command.gsub! 'somePassword', password
      command.gsub! 'key.pem', pem_file

      result = system(  command )
      return pem_file
    end


  end
end
