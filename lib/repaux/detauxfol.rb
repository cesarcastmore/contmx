class DetAuxFol < WriterXML
  def initialize(para)
    @Attributes=["NumUnIdenPol", "Fecha"]
    @sequence=["ComprNal", "ComprNalOtr", "ComprExt"]
    init(para)
  end
end
