module CoverallsMulti
  class Formatter
    # formats SimpleCov coverage results files
    # before merge + push to Coveralls
    class SimpleCov

      # helper to grab the non-absolute filename from simplecov results
      def self.format_short_filename(filename)
        filename = filename.gsub(::SimpleCov.root, '.').gsub(/^\.\//, '') if ::SimpleCov.root
        filename
      end

      # get relevant data from the Ruby coverage report & format it
      def self.run(simple_cov)
        source_files = []
        simple_cov['RSpec']['coverage'].each do |filename, coverage|
          properties = {}

          # Get Source
          properties['source'] = File.open(filename, 'rb:utf-8').read

          # Get the filename relative to the repo root
          properties['name'] = format_short_filename(filename)

          # Get the coverage
          properties['coverage'] = coverage

          source_files << properties
        end
        source_files
      end
    end
  end
end