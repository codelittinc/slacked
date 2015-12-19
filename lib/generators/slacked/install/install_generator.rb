module Slacked
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc 'Copy a Slacked file to your appplication'

      def create_configuration
        file_name = '.env'

        if !File.exist?(file_name)
          copy_file(file_name, file_name)
        elsif !File.readlines(file_name).grep(/SLACK_/).any?
          template_dir = self.class.source_root
          lines = ''
          File.readlines("#{template_dir}/#{file_name}").each do |line|
            lines << line
          end
          append_file(file_name, lines)
        end
      end
    end
  end
end
