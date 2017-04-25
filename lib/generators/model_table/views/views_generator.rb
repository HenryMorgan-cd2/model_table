require 'rails/generators'

module ModelTable
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../../", __FILE__)
      def create_initializer_file

        directory "app/views/model_tables", "app/views/model_tables"
      end
    end
  end
end
