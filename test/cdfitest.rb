require "writerxml"

require "cdfi"
require "comprobante"

require "emisor"
require "domiciliofiscal"
require "expedidoen"
require "regimenfiscal"

require "receptor"
require "domicilio"

require "conceptos"
require "concepto"
require "informacionaduanera"

require "complementos/timbrefiscaldigital"
require "./cdfi/comprobante"
require "complemento"

require "informacionaduanera"
require "concepto"
require "conceptos"
require "informacionaduanera"

require "traslado"
require "retencion"
require "traslados"
require "retenciones"
require "impuestos"

class CdfiTest < Minitest::Test
  def create_comprobante
    assert_equal "Hola",

    comprobante_1 = Comprobante.new( :version=> "3.2",
                    :fecha => "2012-11-09T16:47:23", :sello => "vEkO8o2XuLDzfSXDAac5zFGv3G7HY5w11yla4DvUX22eYKWNmcXSO4Ux2w90zcM9A6e8EE3uo6noxWjlbDUUH8GTGqV9oqTiO/t44rM12SQO9MpPljCFIglc0Bl5gfGGK3iweijtG5jW7vXKr2m9ssebSrZUtJ81UwnDJzXr3t8=",
                    :formaDePago=> "Pago en una sola exhibicion", :noCertificado=>"20001000000100001708",
                    :certificado=>"MIIFGDCCBACgAwIBAgIUMjAwMDEwMDAwMDAxMDAwMDE3MDgwDQYJKoZIhvcNAQEFBQAwggFvMRgwFgYDVQQDDA9BLkMuIGRlIHBydWViYXMxLzAtBgNVBAoMJlNlcnZpY2lvIGRlIEFkbWluaXN0cmFjacOzbiBUcmlidXRhcmlhMTgwNgYDVQQLDC9BZG1pbmlzdHJhY2nDs24gZGUgU2VndXJpZGFkIGRlIGxhIEluZm9ybWFjacOzbjEpMCcGCSqGSIb3DQEJARYaYXNpc25ldEBwcnVlYmFzLnNhdC5nb2IubXgxJjAkBgNVBAkMHUF2LiBIaWRhbGdvIDc3LCBDb2wuIEd1ZXJyZXJvMQ4wDAYDVQQRDAUwNjMwMDELMAkGA1UEBhMCTVgxGTAXBgNVBAgMEERpc3RyaXRvIEZlZGVyYWwxEjAQBgNVBAcMCUNveW9hY8OhbjEVMBMGA1UELRMMU0FUOTcwNzAxTk4zMTIwMAYJKoZIhvcNAQkCDCNSZXNwb25zYWJsZTogSMOpY3RvciBPcm5lbGFzIEFyY2lnYTAeFw0xMDExMTkxOTUzNTZaFw0xMjExMTgxOTUzNTZaMIGxMSAwHgYDVQQDFBdBTkEgQ0VDSUxJQSBHT01FWiBZQdFFWjEgMB4GA1UEKRQXQU5BIENFQ0lMSUEgR09NRVogWUHRRVoxIDAeBgNVBAoUF0FOQSBDRUNJTElBIEdPTUVaIFlB0UVaMRYwFAYDVQQtEw1HT1lBNzgwNDE2R00wMRswGQYDVQQFExJHT1lBNzgwNDE2TURGTlNSMDgxFDASBgNVBAsTC1N1Y3Vyc2FsQVZMMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDUoeNm2qQS/UQJOC5s+QHPoqsXahXJwrKO0MIcY6yvSJJzylJFVTwvQEUjExflfdtzTQLoHGtkOj9/8IiO6yeZJft07tJczQQLpUF4GHg9wfP1xVND20skye7EfrTGTJBdAKahg9TFY20tfk3w1abBFQaV+j1IUvxWCw/dfxudmQIDAQABo4HqMIHnMAwGA1UdEwEB/wQCMAAwCwYDVR0PBAQDAgbAMB0GA1UdDgQWBBT1lw7UbZ795FaVA8ORZ/TkBEvZyzAuBgNVHR8EJzAlMCOgIaAfhh1odHRwOi8vcGtpLnNhdC5nb2IubXgvc2F0LmNybDAzBggrBgEFBQcBAQQnMCUwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNhdC5nb2IubXgvMB8GA1UdIwQYMBaAFOtZfQQimlONnnEaoFiWKfU54KDFMBAGA1UdIAQJMAcwBQYDKgMEMBMGA1UdJQQMMAoGCCsGAQUFBwMCMA0GCSqGSIb3DQEBBQUAA4IBAQCI6Br/9uOa0XpsjYKpq6X5A1PSQ8AsrwpukmnF89oGwr7NkccFZs8cIlX9cbaUsb63vaCK6g2EDuJDmlFco57+I+Wx0RqduRVVcoOc5odmpQJHP0tLE++UK/fUjbJvkGogYzwOQ8x/qJgkrI8StEvwzAUBAuQXCU0W5Unhg/dLyR7DcmEWmRwQkKJMnOEQ6RTiALmY2QIOIEIk6QJ7xmu1V1jLN8A/q9I54+0HZRV8FjoAG5iGEk7P/Mxgyc8btwNOROu3ZL5p2TvoXrb7CAF3sZpTf0FdtpIc/335H0zqS2m6ASk9d+HlA1TWN/I9XTssrHv0nmbtB5CRS8HOS4BR",
                    :condicionesDePago => "Comprobante expresado en: Pesos. Con tipo de cambio:1",
                    :subTotal => "190.0000", :TipoCambio => "1.0000",
                    :moneda => "Pesos", :total => "220.4000",
                    :metodoDePago => "Efectivo", :tipoDeComprobante => "ingreso",
                    :LugarExpedicion=>"Victoria,Tamaulipas,México")

  end

end
