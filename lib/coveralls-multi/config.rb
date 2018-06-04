require 'yaml'

module CoverallsMulti
  # reads .coveralls.yml and sets module config options
  class Config
    class << self
      def files
        yml = yaml_config['multi']

        raise "Couldn't find coveralls-multi configuration in .coveralls.yml" unless yml

        yml
      end

      def yaml_config
        raise "Couldn't find config file" unless configuration_path && File.exist?(configuration_path)

        YAML.load_file(configuration_path)
      end

      def root
        File.expand_path(Dir.getwd)
      end

      def configuration_path
        File.expand_path(File.join(root, '.coveralls.yml')) if root
      end
    end
  end
end
