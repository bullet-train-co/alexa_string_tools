module AlexaStringTools
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "Creates AlexaStringTools initializer for your application"

      def copy_initializer
        template "alexa_string_tools_initializer.rb", "config/initializers/alexa_string_tools_initializer.rb"

        puts "Install complete! You can configure gem in config/initializers/alexa_string_tools_initializer.rb"
      end
    end
  end
end
