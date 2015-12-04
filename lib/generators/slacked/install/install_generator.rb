module Slacked
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def create_configuration
        copy_file(".env", ".env")
      end
    end
  end
end
