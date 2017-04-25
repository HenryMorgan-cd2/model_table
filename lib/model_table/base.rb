module ModelTable

  class Base

    def initialize(rows)
      @rows = rows
    end

    def self.inherited(subclass)
      subclass.instance_variable_set('@columns', Columns.new)
      subclass.instance_variable_set('@batch_actions', BatchActions.new)
      subclass.instance_variable_set('@row_class', nil)
    end

    def self.batch_actions &block
      @batch_actions.instance_exec(&block)
    end

    def self.columns &block
      @columns ||= Columns.new
      @columns.instance_exec(&block) if block.present?
      @columns
    end

    def self.row_class &block
      @row_class = block || @row_class
    end

    def render
      ModelTable.render_partial('table', table: self)
    end

    def to_json
      {
        columns: @columns,
        rows: rows
      }.to_json
    end

    def columns
      self.class.columns || []
    end

    def rows
      @rows
    end

    def row_class_for(object, i)
      if defined? self.class.row_class
        instance_exec(object, i, &(self.class.row_class))
      else
        nil
      end
    end


  end
end
