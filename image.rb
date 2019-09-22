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
end 

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image