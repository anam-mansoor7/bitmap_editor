class Image
  attr_accessor :row, :col, :bitmap
  SUCCESS_MESSAGE = "Bitmap succesfully updated"
  ERROR_MESSAGE = "Error: row or column is out of bound "

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
      puts SUCCESS_MESSAGE
    else
      puts ERROR_MESSAGE
    end
  end

  def draw_vertical_segment(col, row1, row2, color)
    row_start = [row1, row2].min
    row_end   = [row1, row2].max

    if check_bitmap_bounds(row_start, col) 
      (row_start..row_end).each do |row|
        @bitmap[row][col] = color
      end
      puts SUCCESS_MESSAGE
    else
      puts ERROR_MESSAGE
    end
  end

  def draw_horizental_segment(col1, col2, row, color)
    col_start = [col1, col2].min
    col_end   = [col1, col2].max

    if check_bitmap_bounds(row, col_end) 
      (col_start..col_end).each do |col|
        @bitmap[row][col] = color
      end
      puts SUCCESS_MESSAGE
    else
      puts ERROR_MESSAGE
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