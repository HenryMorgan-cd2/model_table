module ModelTable

  def self.av
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

  def self.render partial, locals={}
    partial = "model_table/#{partial}"
    av.render(partial: partial, locals: locals)
  end


end


require 'model_table/version'
require 'model_table/engine'

require 'model_table/base'
require 'model_table/batch_actions'
require 'model_table/columns'

require 'model_table/column_types/column'
