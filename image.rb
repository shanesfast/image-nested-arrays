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

  def blur(distance = 1)
    return @image if distance <= 0 
    blur_origin = []

    @image.each_index do |row_index|
      @image[row_index].each_index do |col_index|
        if @image[row_index][col_index] != 0
          blur_origin << [row_index, col_index]
        end
      end
    end

    blur_origin.each do |row, col|
      @image[row][col - 1] = 1 if col - 1 >= 0
      @image[row + 1][col] = 1 if row + 1 < @image.size 
      @image[row][col + 1] = 1 if col + 1 < @image[row].size
      @image[row - 1][col] = 1 if row - 1 >= 0
    end

    blur(distance - 1)
  end

end