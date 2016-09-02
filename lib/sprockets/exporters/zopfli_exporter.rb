require 'zopfli'

module Sprockets
  module Exporters
    class ZopfliExporter < Exporter
      def call
        if environment.config[:exporters]['*/*'].include? GzipExporter
          raise 'GzipExporter is still registered'
        end
        write '.gz' do |target|
          zopfli = Zopfli.deflate(source, format: :gzip, mtime: mtime)

          PathUtils.atomic_write(target) do |file|
            file.write(zopfli)
            file.close
          end
        end
      end
    end
  end
end
