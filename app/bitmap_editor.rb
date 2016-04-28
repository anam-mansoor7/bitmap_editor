require_relative 'image'

class BitmapEditor

# TODO:
# 1. set coordinates = -1 of actual
# 2. error checks btw 1 to 250
# 3. error check the image exist before calling commands: S, L, V, H 
# Maybe put a color is invalid error
  def run
    @running = true
    image = []
    puts 'type ? for help'
    while @running
      print '> '
      input = gets.chomp
      params = parse_input(input)
      case input
        when '?'
          show_help
        when 'X'
          exit_console
        when 'S'
          image.print
        when 'C'
          image.clear_bitmap 
        when /I (\d) (\d)\z/ 
          #I M N - Create a new M x N image
          image = Image.new(params[3], params[2])
        when /L (\d) (\d) ([A-Z])\z/
          #L X Y C - Colours the pixel (X,Y) with colour C  
          image.color_pixel(params[3], params[2], params[4])
        when /V (\d) (\d) (\d) ([A-Z])\z/ 
          #V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2
          image.draw_vertical_segment(params[2], params[3], params[4], params[5])
        when /H (\d) (\d) (\d) ([A-Z])\z/
          # H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2
          image.draw_horizental_segment(params[2], params[3], params[4], params[5])          
        else
          puts 'unrecognised command :('
      end
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

    def parse_input(input)
      input.chomp.split(' ').map do |x| 
        is_capital_letter(x) ? x : x.to_i - 1 
      end   
    end

    def is_capital_letter(char)
      !((char =~ /^[A-Z]$/).nil?)
    end
end
