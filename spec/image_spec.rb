require 'spec_helper'
require 'pry'

describe Image do
	before :each do
    @row = 3
    @col = 3
    @image = Image.new(@row, @col)
	end 

	describe "#new" do
    it "takes two parameters and returns a image object" do
      expect(@image).to be_an_instance_of(Image)
    end

    it "should have 3 rows" do
      expect(@image.row).to eq(@row)
    end

    it "should have 3 cols" do
      expect(@image.col).to eq(@col)
    end

    it "should have row * col bitmap 2D array " do
      array = Array.new(@row) {Array.new(@col)} 
      expect(@image.bitmap[0].count).to eql(@row)
      expect(@image.bitmap[1].count).to eql(@col)
    end
	end

  describe "#print" do
    it "should print the bitmap" do
      new_line = "\n"
      output = 'OOO' + new_line + 'OOO' + new_line + 'OOO' + new_line
      expect { @image.print }.to output(output).to_stdout
    end
  end

  describe "#color_pixel" do
    it "should color the pixel with specified color" do
      success_message = @image.color_pixel(2,2,"A")
      expect(@image.bitmap[2][2]).to eql("A")
      expect(success_message).to eq(Image::SUCCESS_MESSAGE) 
    end

    it "should return an error message if row and col are out of bounds" do
      error_message = @image.color_pixel(3,3,"A")
      expect(error_message).to eq(Image::ERROR_MESSAGE) 
    end

    it "should return an error message if color is invalid" do
      error_message = @image.color_pixel(3,3,"invalid_color")
      expect(error_message).to eq(Image::ERROR_MESSAGE) 
    end
  end

  describe "#check_bitmap_bounds" do
    it "shoud return false if row and col is out of bounds" do
      bitmap_bound_check = @image.send(:check_bitmap_bounds, 3, 4)   
      expect(bitmap_bound_check).to be false 
    end

    it "shoud return true if row and col is valid" do
      bitmap_bound_check = @image.send(:check_bitmap_bounds, 2, 2)   
      expect(bitmap_bound_check).to be true 
    end
  end

  describe "#is_color_valid?" do
    it "should return true for valid input" do
      invalid_color = "foo"
      @image.send(:is_color_valid?,invalid_color)
    end

    it "should false for invalid input" do
      valid_color = "A"
      @image.send(:is_color_valid?, valid_color)
    end
  end

  describe "#draw_vertical_segment" do
    it "should draw a vertical segment of colour C in column X between rows Y1 and Y2 " do

      expect{@image.draw_vertical_segment(2, 1, 2, "A")}.to change{@image.bitmap[2][2]}.from('O').to('A')
      expect(@image.bitmap[1][2]).to eql('A')
    end
  end

  describe "#draw_horizental_segment" do
    it "horizontal segment of colour C in row Y between columns X1 and X2 " do

      expect{@image.draw_horizental_segment(2, 1, 2, "A")}.to change{@image.bitmap[2][1]}.from('O').to('A')
      expect(@image.bitmap[2][2]).to eql('A')
    end
  end
end