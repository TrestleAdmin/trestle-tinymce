module Trestle
  module TinyMCE
    class Configuration
      include Configurable
      include Configurable::Open

      def to_javascript
        options.map { |name, configuration|
          config = ::TinyMCE::Rails::Configuration.new(configuration.as_json.with_indifferent_access)
          "Trestle.TinyMCE.#{name} = #{config.to_javascript};"
        }.join("\n")
      end
    end
  end
end
