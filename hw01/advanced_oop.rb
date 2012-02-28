class Class
    def attr_accessor_with_history(attr_name)
        attr_name = attr_name.to_s
        # make sure it's a string
        attr_reader attr_name
        # create the attribute's getter
        attr_accessor attr_name+"_history" # create bar_history getter
        #class_eval "your code here, use %Q for multiline strings"
        
        # add attr_name custom setter
        class_eval %Q{ 
            def %s=(obj)
                @%s_history = [@%s_history, obj].flatten
            end
        } % [ attr_name, attr_name, attr_name ]

    end
end


class Foo
    attr_accessor_with_history :bar
end

