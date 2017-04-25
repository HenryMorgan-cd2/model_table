module ModelTable
  module ColumnTypes
    class LinkColumn < AbstractColumn

      def initialize heading, value, path, options={}
        @heading = heading
        @value = value
        @path = path
        @options = options
      end

      def heading
        @heading
      end

      def value object
        link_text = case @value
                    when Symbol
                      object.send @value
                    when Proc
                      instance_exec(object, &@value)
                    end
        link_to link_text, instance_exec(object, &@path), @options
      end

    end
  end
end
