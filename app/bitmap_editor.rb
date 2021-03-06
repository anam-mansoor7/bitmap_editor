require_relative 'image'
class BitmapEditor

  def run
    @running = true
    #TODO: fix range in regex
    @image = []
    puts 'type ? for help'
    while @running
      print '> '
      input = gets.chomp
      params = parse_input(input)
      message = ""
      case input
        when '?'
          show_help
        when 'X'
          exit_console
        when 'S'
          @image.print if image_exists?
        when 'C'
          message = @image.clear_bitmap if image_exists?
        when /I (\d{1,3}) (\d{1,3})\z/ 
          #I M N - Create a new M x N image
          create_image(params[2], params[1])
        when /L (\d{1,3}) (\d{1,3}) ([A-Z])\z/
          #L X Y C - Colours the pixel (X,Y) with colour C  
          message = @image.color_pixel(params[2], params[1], params[3]) if image_exists?
        when /V (\d{1,3}) (\d{1,3}) (\d{1,3}) ([A-Z])\z/ 
          #V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2
          message = @image.draw_vertical_segment(params[1], params[2], params[3], params[4]) if image_exists?
        when /H (\d{1,3}) (\d{1,3}) (\d{1,3}) ([A-Z])\z/
          # H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2
          message = @image.draw_horizental_segment(params[1], params[2], params[3], params[4]) if image_exists?          
        else
          puts 'unrecognised command :('
      end
      puts message unless message.empty?
    end
  end

  private
    def exit_console
      puts 'goodbye!'
      @running = false
    end

    def show_help
      puts "? - Help
I M N - Create a new M x N image with all pixels coloured white (O).
C - Clears the table, setting all pixels to white (O).
L X Y C - Colours the pixel (X,Y) with colour C.
V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
S - Show the contents of the current image
X - Terminate the session"
    end

    def create_image(row, col)
      row = row + 1
      col = col + 1
      if validate_range?(row, col)
        @image = Image.new(row, col)
      end 
    end

    def parse_input(input)
      input.chomp.split(' ').map do |x| 
        is_capital_letter(x) ? x : x.to_i - 1 
      end   
    end

    def image_exists?
      error_message = "Error: Image does not exist. Create it using I command"  
      @image.is_a?(Image) ? true : (puts error_message)
    end

    def validate_range?(row, col)
      error_message = "Error: The range must be between 1 and 250"  
      (row.between?(0, 249) && col.between?(0, 249)) ? true : (puts error_message)
    end
    
    def is_capital_letter(char)
      !((char =~ /^[A-Z]$/).nil?)
    end
end
