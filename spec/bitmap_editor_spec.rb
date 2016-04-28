require 'spec_helper'
#incomplete test cases
describe BitmapEditor do
  let(:bitmap_editor) {BitmapEditor.new}

	describe "#create_image" do
    it "takes two parameters and returns a image object" do
    	bitmap_editor.send(:create_image, 2, 3)
    	image = bitmap_editor.instance_variable_get(:@image) 
      expect(image).to be_an_instance_of(Image)
    end
	end

  describe "#is_capital_letter" do
    it "should return true for valid input" do
      expect(bitmap_editor.send(:is_capital_letter, "A")).to be true
    end

    it "should return false for invalid input" do
      expect(bitmap_editor.send(:is_capital_letter, "f")).to be false
    end
  end

  describe "#image_exists?" do
    it "should return true if image exists" do
    	bitmap_editor.send(:create_image, 2, 3)

      image_check = bitmap_editor.send(:image_exists?)   
      expect(image_check).to be true 
    end

    it "should return false if image does not exist" do
      expect(bitmap_editor.send(:image_exists?)).to be_falsey 
    end
  end
end