require "spec_helper"

describe Trestle::TinyMCE::Configuration do
  subject(:config) { Trestle::TinyMCE::Configuration.new }

  describe "#to_javascript" do
    it "returns JS code for each set of defined options" do
      config.default.configure do |c|
        c.skin = "trestle/tinymce-6"
      end

      config.alternate.configure do |c|
        c.skin = "trestle/tinymce-6"
        c.menubar = false
      end

      expect(config.to_javascript).to eq <<~EOS.strip
      Trestle.TinyMCE.default = {
        skin: "trestle/tinymce-6"
      };
      Trestle.TinyMCE.alternate = {
        skin: "trestle/tinymce-6",
        menubar: false
      };
      EOS
    end
  end
end
