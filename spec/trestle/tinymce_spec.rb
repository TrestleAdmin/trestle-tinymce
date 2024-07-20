require "spec_helper"

describe Trestle::TinyMCE do
  describe ".tinymce_major_version" do
    it "returns the major version of the currently installed tinymce-rails" do
      stub_const("TinyMCE::Rails::VERSION", "6.8.4")
      expect(described_class.tinymce_major_version).to eq(6)

      stub_const("TinyMCE::Rails::VERSION", "5.10.9")
      expect(described_class.tinymce_major_version).to eq(5)
    end
  end
end
