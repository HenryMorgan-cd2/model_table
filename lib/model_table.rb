module ModelTable

  def self.view_context
    @view_context ||= begin
      av = ActionView::Base.new(ActionController::Base.view_paths, {})
      av.config = Rails.application.config.action_controller
      av.class_eval do
        include Rails.application.routes.url_helpers
        include ::ApplicationHelper
        def protect_against_forgery?
          false
        end
      end
      av
    end
  end

  def self.render_partial partial, locals={}
    partial = "model_tables/#{partial}"
    view_context.render(partial: partial, locals: locals)
  end


end


require 'model_table/version'
require 'model_table/engine'

require 'model_table/columns'
require 'model_table/batch_actions'
require 'model_table/base'

require 'model_table/column_types/abstract_column'
require 'model_table/column_types/batch_action_column'
require 'model_table/column_types/column'
require 'model_table/column_types/link_column'

# require 'generators/model_table/views_generator'
