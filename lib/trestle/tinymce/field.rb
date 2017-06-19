module Trestle
  module TinyMCE
    class Field < Trestle::Form::Fields::TextArea
      def defaults
        super.merge(rows: 20, class: "tinymce")
      end

      def field
        super + template.tinymce
      end
    end
  end
end
