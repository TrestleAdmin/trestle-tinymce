module Trestle
  module TinyMCE
    class Field < Trestle::Form::Fields::TextArea
      def defaults
        super.merge(rows: 20, class: "tinymce")
      end
    end
  end
end
