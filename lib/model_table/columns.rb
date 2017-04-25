module ModelTable
  class Columns
    include Enumerable

    def initialize
      @columns = []
    end

    def column(*args, &block)
      add_column ColumnTypes::Column.new(*args, &block)
    end

    def batch_action_column(*args, &block)
      add_column ColumnTypes::BatchActionColumn.new(*args, &block)
    end

    def link_column(*args, &block)
      add_column ColumnTypes::LinkColumn.new(*args, &block)
    end

    def each(&block)
      @columns.each(&block)
    end

    def to_a
      @columns.map(&:heading)
    end

    private

    def add_column(column)
      @columns.push(column)
    end
  end
end
