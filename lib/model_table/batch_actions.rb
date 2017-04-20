module ModelTable

  class BatchActions

    def initialize
      @actions = {}
    end

    def action name, action
      @actions[name] = action
    end

    def to_h
      @actions
    end

  end

end
