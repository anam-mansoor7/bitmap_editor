require 'spec_helper'

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
      invalid_color = "f"
      bitmap_editor.send(:is_capital_letter, invalid_color)
    end

    it "should return false for invalid input" do
      valid_color = "A"
      bitmap_editor.send(:is_capital_letter, valid_color)
    end
  end

   describe "#image_exists?" do
    it "should return true if image exists" do
      invalid_color = "f"
      bitmap_editor.send(:is_capital_letter, invalid_color)
    end

    it "should return false if image does not exist" do
      valid_color = "A"
      bitmap_editor.send(:is_capital_letter, valid_color)
    end
  end
end