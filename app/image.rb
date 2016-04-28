class Image
  #TODO: fix pixel cordinates bitmap starts from 1 not 0
  attr_accessor :row, :col, :bitmap
  SUCCESS_MESSAGE = "Bitmap succesfully updated"
  ERROR_MESSAGE = "Error updating bitmap "

	def initialize(row, col)
    @row = row 
    @col = col 
    color = 'O'
    set_bitmap   
  end

  def print
    @bitmap.each do |r|
      puts r.each { |p| p }.join("")
    end
  end

  def color_pixel(row, col, color)
    if check_bitmap_bounds(row, col) 
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

  def draw_horizental_segment(col_start, col_end, row, color)
    (col_start..col_end).each do |col|
      @bitmap[row][col] = color
    end
  end

  def clear_bitmap
    set_bitmap
  end

  private
    def set_bitmap
      @bitmap = Array.new(@row) {Array.new(@col,'O')}   
    end

    def check_bitmap_bounds(row, col)
      row.between?(0, @row - 1) && col.between?(0, @col - 1)
    end
end