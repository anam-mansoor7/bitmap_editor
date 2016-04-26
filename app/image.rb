class Image
  attr_accessor :row, :col, :bitmap
  SUCCESS_MESSAGE = "Bitmap succesfully updated"
  ERROR_MESSAGE = "Error updating bitmap "

	def initialize(row, col)
    @row = row
    @col = col
    color = 'O'
    @bitmap = Array.new(@row) {Array.new(@col,'O')}   
  end

  def print
    @bitmap.each do |r|
      puts r.each { |p| p }.join("")
    end
  end

  def color_pixel(row, col, color)
    if check_bitmap_bounds(row, col) and is_color_valid?(color)
      @bitmap[row][col] = color
      SUCCESS_MESSAGE
    else
      ERROR_MESSAGE
    end
  end

  def draw_vertical_segment(row, col, color)
  end

  private
    def check_bitmap_bounds(row, col)
      row < @row and col < @col
    end

    def is_color_valid?(color)
      !((color =~ /^[A-Z]$/).nil?)
    end
end