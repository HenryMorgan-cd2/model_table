module ModelTable
  module ColumnTypes
    class Column < AbstractColumn

      def initialize(heading, value, opts={})
        @heading = heading
        @value = value
        @options = opts
      end

      def heading
        @heading
      end

      def value(object)
        case @value
        when Symbol
          object.send @value
        when Proc
          instance_exec(object, &@value)
        end
      end
    end
  end
end
