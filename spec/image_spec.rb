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
      @image.should be_an_instance_of Image
    end

    it "should have 3 rows" do
      @image.row.should eq(@row)
    end

    it "should have 3 cols" do
      @image.col.should eq(@col)
    end

    it "should have row * col bitmap 2D array " do
      array = Array.new(@row) {Array.new(@col)} 
      @image.bitmap[0].count.should eql(@row)
      @image.bitmap[1].count.should eql(@col)
    end
	end

  describe "#print" do
    it "should print the bitmap" do
      new_line = "\n"
      output = 'OOO' + new_line + 'OOO' + new_line + 'OOO' + new_line
      STDOUT.should_receive(:puts).with(output)
    end
  end
end