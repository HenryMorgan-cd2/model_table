module ModelTable

  class Base

    def initialize(collection)
      @collection = collection
    end

    def self.batch_actions &block
      @@batch_actions = BatchActions.new
      @@batch_actions.instance_exec(&block)
    end

    def self.columns &block
      @@columns = Columns.new
      @@columns.instance_exec(&block)
    end

    def render
      ModelTable.render('table', columns: @@columns, objects: @collection)
    end

  end
end
