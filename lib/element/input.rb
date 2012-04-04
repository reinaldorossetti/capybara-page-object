module CapybaraPageObject
  class Input < CapybaraPageObject::Node
    
    BUTTON_TYPES = ['submit', 'reset', 'button']
    CHECKABLE_TYPES = ['radio', 'checkbox']

    def element_names
      ['input']
    end
    
    def key
      root_node[:name]
    end
    
    def value
      root_node.value
    end

    def clear!
      source.fill_in key, :with => ''
    end

    def value=(value)
      source.fill_in key, :with => value
    end

    def untyped?
      root_node[:type].nil?
    end
    
    def button?
      BUTTON_TYPES.include?(root_node[:type])
    end

    def checkable?
      type = root_node[:type]
      type && CHECKABLE_TYPES.include?(type)
    end
  end
end