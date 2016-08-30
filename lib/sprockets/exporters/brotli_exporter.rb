require 'brotli'

module Sprockets
  module Exporters
    class BrotliExporter < Exporter
      def call
        write '.br' do |target|
          data = File.binread source
          mode = if asset.content_type.match /font|otf/
            :font
          elsif asset.content_type.match /text|(application\/(javascript|json|xml))/
            :text
          else
            :generic
          end
          brotli = Brotli.deflate(data, mode: mode, quality: self.class.quality)
          File.open(target, 'wb') { |file| file.write(brotli) }
        end
      end

      class << self
        attr_writer :quality

        def quality
          @quality || 9
        end
      end
    end
  end
end
