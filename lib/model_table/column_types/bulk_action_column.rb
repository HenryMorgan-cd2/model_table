module ModelTable
  module ColumnTypes
    class BulkActionColumn < Column

      def initialize; end

      def heading
        "BULK"
        # select_tag(nil)
      end

    end
  end
end
