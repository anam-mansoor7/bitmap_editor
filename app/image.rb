class Image
  attr_accessor :row, :col, :bitmap

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
end