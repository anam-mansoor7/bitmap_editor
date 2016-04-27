class Image
  #TODO: fix pixel cordinates bitmap starts from 1 not 0
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

  def draw_vertical_segment(col, row_start, row_end, color)
    (row_start..row_end).each do |row|
      @bitmap[row][col] = color
    end
  end

  private
    #TODO: this range will change to between 1 to row inclusive
    # after setting the coordinates
    def check_bitmap_bounds(row, col)
      check_row_bound(row) && check_col_bound(col)
    end

    def check_row_bound(row)
      (0 <= row) && (row < @row)
    end

    def check_col_bound(col)
      (0 <= col) && (col < @col)
    end

    def is_color_valid?(color)
      !((color =~ /^[A-Z]$/).nil?)
    end
end