class WriterXML
  attr_reader  :attributes, :elements, :schemaLocation, :targetNamespace, :objects;

  def initialize(hash)

  end

=begin
Metodo que lee el hash o el arreglo y asigna cada uno de los valores a sus respetivas
variables
@param [Hash] [Array]
=end
  def from_hash(para)

    @attributes = Array.new if @attributes.nil?
    @sequence = Array.new if @sequence.nil?
    set_objects_to_acessor

    if !para.nil?
      hash_objects = from_hash_to_array_objects(para)
      set_atr_object_from_hash(para,hash_objects)
    end
  end

=begin
Metodo para colocar los objecto como attr_acessor
=end

def set_objects_to_acessor
  if !@sequence.empty?
    @sequence.each { |ele|
      self.class.__send__(:attr_accessor, ele.downcase)
    }
  end

end

=begin
Metodo que leera cada uno de los atributos y hara un hash de toda la clase
@return [Hash] crear un hash leyendo las variables
=end
  def to_hash
    hash = {}
    if !@attributes.nil?
      return hash
    end
    @attributes.each { |attr|
      downcaseAttr =  attr.downcase
      if instance_attribute_defined?(downcaseAttr)
        hash[attr.to_sym] = get(downcaseAttr)
      end
    }
    return hash;
  end

=begin
Metodo que obtiene el objecto o el atributos de la clase
@return [Object] regresa un objecto dependiendo del atributos o nodos
=end

  def get(key)
    case key
    when Symbol
      return instance_variable_get("@#{key}")
    when String
      return instance_variable_get("@#{key}")
    end

  end

=begin
Asignara una instancia basandose en el symbolo que se indica en el parametro
@param  [Symbol, String] , [Object]
=end
  def set(key, value)
    case key
    when Symbol
      return instance_variable_set("@#{key}", value)
    when String
      return instance_variable_set("@#{key}", value)
    end
  end

=begin
Metodo para obtener los atributos del objecto
=end

def [](key)
  @attributes = Array.new if @attributes.nil?
  if @attributes.include? key.downcase
    return get(key)
  else
    raise 'El atributo no ha sido encontrado en el objecto'
  end
end

=begin
Metodo para escribir atributos en el objecto
=end
def []= (key, value)
  @attributes = Array.new if @attributes.nil?
  if @attributes.include? key.downcase
    return set(key, value)
  else
    raise 'El atributo no ha sido encontrado en el objecto'
  end
end

=begin
Metodo que revise la existencia del atributos dentro de la clase
@param [Sysbol, String]
@return [Boolean]
=end
  def instance_attribute_defined?(key)
    case key
    when Symbol
      return instance_variable_defined?("@#{key}")
    when String
      return instance_variable_defined?("@#{key}")
    end
  end

=begin
Escribira en el objecto del parametro y revisara si el objecto es raiz o
es un nodo de una sequencia, si es la raiz agregara un prefijo si esta especificado
en las variables de instancia
@param [Nokogiri::XML::Builder ]
=end

  def writeXML(xml)
    if @targetNamespace.nil?
      xml.send(self.class.to_s){
        write_attributes_elements(xml)
      }
    else
      prefix = "#{@targetNamespace[:prefix]}"
      namespace = "#{@targetNamespace[:namespace]}"
      xml.send(self.class.to_s){
        ins = xml.parent.add_namespace_definition(prefix, namespace)
        xml.parent.namespace = ins
        write_attributes_elements(xml)
      }
    end
  end

#@private
private
=begin
Este metodo coloca todos los atributos  y ademas tambien coloca los namespace en
un hash, es usando para poder usar el metodo de writerXML
@return [Hash]
=end
def attribites_to_hash
  hash = {}
  if !@attributes.nil?
    @attributes.each { |attr|
      downcaseAttr =  attr.downcase
      if instance_attribute_defined?(downcaseAttr)
        hash[attr.to_sym] = get(downcaseAttr)
      end
    }
  end

  if !@schemaLocation.nil?
    hash["xmlns:xsi"] = "http://www.w3.org/2001/XMLSchema-instance"
    hash["xsi:schemaLocation"] = "#{@schemaLocation}"
  end
  return hash;
end
=begin
Metodo que sirve para escribir los atributos y los nodos en el Nokogiri::XML::Builder
@param [Nokogiri::XML::Builder ] parametro que se escribira
=end

  def write_attributes_elements(xml)
    attributes = attribites_to_hash
    if !attributes.nil?
      attributes.each { |key, value|
        xml.parent.set_attribute(key,value)
       }
    end
     array_elements = sequence_to_array_objects
     if !array_elements.empty?
       array_elements.each { |object|
         object.writeXML(xml)
         }
     end
  end

=begin
Metodo para buscar los objecto de la secuencia y instanciarlos en un arreglo donde
seran utilizado para el metodo writeXML
@return [Array]
=end

  def sequence_to_array_objects
    @attributes = Array.new if @attributes.nil?
    @sequence = Array.new if @sequence.nil?

    array = []
    if !@sequence.empty?
      @sequence.each { |element|
        downcaseElement =  element.downcase
        if instance_attribute_defined?(downcaseElement)
          object = get(downcaseElement)
          if object.kind_of?(Array)
            return object
          else
            array << object
          end
        end
      }
    else
      if !@objects.nil?
        @objects.each { |o|
          array << o
         }
      end
    end
    return array;
  end
=begin
Revisa la secuencia, si la secuencia no esta en vacio reguesa un hash con el nombre
de las clases, en cambio si esta vacio, asigna variables de objecto a la clase raiz
@param  [Hash] [Array]
@return  [Hash] regresa el nombre de clases con key de la clase en minusculas
=end


  def from_hash_to_array_objects(para)
    hash_objects = {}
    if !@sequence.empty?
      @sequence.each { |o|
        hash_objects[o.downcase.to_sym] = o
        }
    else
      if para.kind_of?(Array)
        @objects= Array.new
        array_hashing = para
        array_hashing.each { | l |
          l.each { |k, v|
            object = Object.const_get(k.to_s).new(v)
            @objects << object
          }
        }
      end
    end
    return hash_objects
  end
=begin
Metodo que mapea todo el hash a un asignacion en la clase, se basa los atributos y sequence
inicializada en la para de arriba
@param [Hash] es hash es para mapear todos los atributos con sus asignaciones
@param [Array] es un arreglo con el nombre de los objectos, es como se llaman los objectos
ya que se inicializara y se asignaran
=end
  def set_atr_object_from_hash(para, hash_objects)

    attributes_downcase =@attributes.map(&:downcase)
    elements_downcase =@sequence.map(&:downcase)

    if para.kind_of? Hash
      para.each { |key, value|
        keyDowncase = key.downcase
        if(attributes_downcase.include?( keyDowncase.to_s))
          set( keyDowncase, value)
        elsif (elements_downcase.include?(keyDowncase.to_s))
          if(value.kind_of?(Hash))
            object = Object.const_get(hash_objects[keyDowncase.to_sym]).new(value)
            set( keyDowncase, object)
          elsif (value.kind_of?(Array))
            kind_of_value_inside_array(value, keyDowncase, hash_objects)
          end
        end
      }
    elsif para.kind_of? Array
      array_objects = Array.new
      para.each { |l|
        l.each { |k, v|
          object = Object.const_get(k.to_s).new(v)
          array_objects << object
        }
      }
      if !@sequence.empty?
        set( @sequence[0].downcase.to_sym , array_objects)
      else
        @objects = array_objects
      end
    end
  end
=begin
#Revisa que el los valores del hash no haya valores que son arreglos sino busca sus
objectos, si estan en la secuencia los crea a partir de alli, sino esta en la secuencia
los asigna a un objeto llamado objectos.
@param [Array]  es el arreglo que se encontro en el from_hash
@param [Array]  es el Symbol que se encontro en el from_hash y estan en minusculas
@param [Hash] son las clases disponibles en la sequence
=end
  def kind_of_value_inside_array(array, key_downcase, hash_objects)

    sequence_downcase =@sequence.map(&:downcase)
    objects= Array.new

    if sequence_downcase.include? key_downcase.to_s
      array.each { |e|
        object = Object.const_get(hash_objects[key_downcase.to_sym]).new(e)
        objects << object
      }
      set( key_downcase, objects)
    end


  end

end
