module ModelTable
  module ColumnTypes
    class AbstractColumn

      def heading
        raise NotImplementedError
      end

      def value object
        raise NotImplementedError
      end

      def method_missing(name, *args, &block)
        if view.respond_to?(name)
          view.send(name, *args, &block)
        else
          super
        end
      end

      def respond_to_missing?(name)
        view.respond_to? name
      end

      def view
        ModelTable.view_context
      end
    end
  end
end
