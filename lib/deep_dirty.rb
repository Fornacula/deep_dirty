require "deep_dirty/version"

module DeepDirty
  def self.included(base)
    base.class_eval do
      before_validation :deep_dirty_check
    end
  end

  # apply deep dirty check and then return `changed?`
  def deep_changed?
    deep_dirty_check
    changed?
  end

  # Compare each attribute to it's value before type cast and mark changes where detected
  def deep_dirty_check
    self.attributes.keys.each do |attr|
      next if attribute_changed?(attr)
      col = column_for_attribute(attr)
      uncast_value = read_attribute_before_type_cast(attr)
      recast_value = col.type_cast(uncast_value)
      unless recast_value == read_attribute(attr)
        changed_attributes[attr] = recast_value
      end
    end
    # This should never break validation
    true
  end
end