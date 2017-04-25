module ModelTable
  module ColumnTypes
    class BatchActionColumn < AbstractColumn

      def heading
        view.check_box_tag('batch_action_all', nil, nil)
      end

      def value object
        view.select_tag('select_all')
        view.check_box 'batch_actions', :ids, {multiple: true}, object.id, nil
      end

    end
  end
end
