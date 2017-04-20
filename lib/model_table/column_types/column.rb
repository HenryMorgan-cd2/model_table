module ModelTable
  module ColumnTypes
    class Column

      def initialize(header, value, opts={})
        @header = header
        @value = value
        @options = opts
      end

      def heading
        @header
      end

      def value context, object
        case @value
        when Symbol
          object.send @value
        when Proc
          context.instance_exec(object, &@value)
        end
      end

    end
  end
end
