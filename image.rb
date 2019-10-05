class Image
  def initialize(pixels)
    @image = pixels
  end

  def output_image
    @image.each do |row|
      line = row.join(" ")
      puts line
    end 
  end

  def blur # This should work for any size SQUARE image representation
    blur_origin = []

    @image.each_index do |row_index|
      @image[row_index].each_index do |col_index|
        if @image[row_index][col_index] != 0
          blur_origin << [row_index, col_index]
        end
      end
    end

    blur_origin.each do |origin| # Covers each case for blurring on edges and middle of the "image"
      puts "Blur around these coordinates: [#{origin[0]}, #{origin[1]}]"
      if origin == [0, 0]                    # Top Left
        @image[origin[0]][origin[1] + 1] = 1
        @image[origin[0] + 1][origin[1]] = 1
      elsif origin == [0, @image[origin[0]].length - 1] # Top Right
        @image[origin[0]][origin[1] - 1] = 1
        @image[origin[0] + 1][origin[1]] = 1
      elsif (origin[0] != 0 and origin[0] != @image.length - 1) and origin[1] == 0 # Starting Column
        @image[origin[0]][origin[1] + 1] = 1
        @image[origin[0] - 1][origin[1]] = 1
        @image[origin[0] + 1][origin[1]] = 1
      elsif (origin[0] != 0 and origin[0] != @image.length - 1) and origin[1] == @image[origin[0]].length - 1 # Ending Column
        @image[origin[0]][origin[1] - 1] = 1
        @image[origin[0] - 1][origin[1]] = 1
        @image[origin[0] + 1][origin[1]] = 1
      elsif origin == [@image.length - 1, 0] # Bottom Left
        @image[origin[0]][origin[1] + 1] = 1
        @image[origin[0] - 1][origin[1]] = 1
      elsif origin == [@image.length - 1, @image[origin[0]].length - 1] # Bottom Right 
        @image[origin[0]][origin[1] - 1] = 1
        @image[origin[0] - 1][origin[1]] = 1
      elsif (origin[1] != 0 and origin[1] != @image.length - 1) and origin[0] == 0 # Top Row
        @image[origin[0]][origin[1] + 1] = 1
        @image[origin[0]][origin[1] - 1] = 1
        @image[origin[0] + 1][origin[1]] = 1
      elsif (origin[1] != 0 and origin[1] != @image.length - 1) and origin[0] == @image.length - 1 # Bottom Row
        @image[origin[0]][origin[1] + 1] = 1
        @image[origin[0]][origin[1] - 1] = 1
        @image[origin[0] - 1][origin[1]] = 1
      else                                    # The Middle
        @image[origin[0]][origin[1] - 1] = 1
        @image[origin[0] + 1][origin[1]] = 1
        @image[origin[0]][origin[1] + 1] = 1
        @image[origin[0] - 1][origin[1]] = 1
      end
    end

  end

end

image = Image.new([
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0]
])

puts "Before:"
image.output_image
puts ""
image.blur
puts ""
puts "After:"
image.output_image
puts "----------"

image = Image.new([
  [0, 0, 0, 0, 1],
  [0, 0, 0, 1, 0],
  [1, 0, 0, 0, 0],
  [0, 0, 0, 0, 1],
  [0, 1, 0, 0, 0]
])

puts "Before:"
image.output_image
puts ""
image.blur
puts ""
puts "After:"
image.output_image
puts "----------"

image = Image.new([
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 1]
])

puts "Before:"
image.output_image
puts ""
image.blur
puts ""
puts "After:"
image.output_image
puts "----------"