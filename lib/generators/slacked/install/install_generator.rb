module Slacked
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc 'Copy a Slacked file to your appplication'

      def create_configuration
        if !File.exist?('.env')
          copy_file('.env', '.env')
        elsif !File.readlines('.env').grep(/SLACK_/).any?
          template_dir = self.class.source_root
          lines = ''
          File.readlines("#{template_dir}/.env").each do |line|
            lines << line
          end
          append_file('.env', lines)
        end
      end
    end
  end
end
