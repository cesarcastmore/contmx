
  class InformacionAduanera < WriterXML

    def initialize(hash)
      @attributes=[ "numero", "fecha", "aduana"];
      from_hash(hash)
    end




  end
