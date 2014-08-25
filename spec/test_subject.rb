class TestSubject
  # These must be run before we can use callbacks
  extend ActiveModel::Callbacks
  define_model_callbacks :validation, :only => :before

  include ActiveModel::Dirty
  include DeepDirty

  attr_accessor :name
  define_attribute_methods :name
  
  def initialize
    @name = "Test User"
    @name_before_type_cast = "Test User"
  end

  def attributes
    {'name' => @name}
  end

  def name=(val)
    name_will_change! unless val == @name
    @name = val
  end

  def validation
    run_callbacks :validation
  end

  def read_attribute_before_type_cast(attr)
    case attr
    when :name, "name"
      @name_before_type_cast
    end
  end

  def read_attribute(attr)
    case attr
    when :name, "name"
      @name
    end
  end

  def column_for_attribute(attr)
    fake_column = Object.new
    type_cast_value = read_attribute_before_type_cast(attr)
    fake_column.define_singleton_method(:type_cast) do |value|
      type_cast_value
    end
    fake_column
  end
end