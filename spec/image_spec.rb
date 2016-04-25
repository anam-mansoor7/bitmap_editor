require 'spec_helper'
require 'pry'

describe Image do
	before :each do
    @row = 6
    @col = 6
    @image = Image.new(@row, @col)
	end 

	describe "#new" do
    it "takes two parameters and returns a image object" do
      @image.should be_an_instance_of Image
    end

    it "should have 6 rows" do
      @image.row.should eq(@row)
    end

    it "should have 6 cols" do
      @image.col.should eq(@col)
    end

    it "should have row * col bitmap 2D array " do
      array = Array.new(@row) {Array.new(@col)} 
      @image.bitmap[0].count.should eql(@row)
      @image.bitmap[1].count.should eql(@col)
    end

	end
end