
  class InformacionAduanera < WriterXML

    def initialize(para=nil)
      @attributes=[ "numero", "fecha", "aduana"];
      init(para)
    end




  end
