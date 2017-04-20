module ModelTable
  class Columns
    include Enumerable

    def initialize
      @columns = []
    end

    # def method_missing(name, *args, &block)
    #   raise "unknown column with name #{name}" unless respond_to_missing?(name)
    #   cls = fully_qualified_column_name(name).constantize
    #   self.class.send(:define_method, name) do |*args, &block|
    #     @columns.push(cls.new(*args, &block))
    #   end
    #   send(name, *args, &block)
    # end

    def column *args
      @columns.push(ColumnTypes::Column.new(*args))
    end


    # def respond_to_missing?(name, include_private=false)
    #   Object.const_defined?(fully_qualified_column_name(name))
    # end

    # def column *args, &block
    #   @columns.push ColumnTypes::Column.new(*args, &block)
    # end

    def each(&block)
      @columns.each(&block)
    end

    private

    def fully_qualified_column_name(name)
      "ModelTable::ColumnTypes::#{name.to_s.camelize}"
    end

  end
end
