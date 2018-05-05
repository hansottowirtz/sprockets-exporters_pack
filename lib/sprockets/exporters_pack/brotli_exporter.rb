require 'sprockets/exporters/base'
require 'brotli'

module Sprockets
  module ExportersPack
    class BrotliExporter < ::Sprockets::Exporters::Base
      def setup
        @brotli_target = "#{ target }.br"
      end

      def skip?(logger)
        if ::File.exist?(@brotli_target)
          logger.debug "Skipping #{ @brotli_target }, already exists"
          true
        else
          logger.info "Writing #{ @brotli_target }"
          false
        end
      end

      def call
        data = File.binread(target)
        mode = if asset.content_type.match self.class.font_regex
          :font
        elsif asset.content_type.match self.class.text_regex
          :text
        else
          :generic
        end
        brotli = Brotli.deflate(data, mode: mode, quality: self.class.quality)

        write(@brotli_target) do |file|
          file.write(brotli)
          file.close
        end
      end

      class << self
        attr_writer :quality
        attr_writer :font_regex
        attr_writer :text_regex

        def quality
          @quality || 9
        end

        def font_regex
          @font_regex || /font|otf/
        end

        def text_regex
          @text_regex || /text|(application\/(javascript|json|xml))/
        end
      end
    end
  end
end
