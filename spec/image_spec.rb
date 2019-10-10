require './image.rb'

# Image class tests
RSpec.describe Image do
  it "Creates a new Image object" do
    image = Image.new([
      [0, 0, 1, 0],
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 0]
    ])
    expect(image).to be_kind_of(Image)
  end

  it "Prints image representation to console" do
    image = Image.new([
      [0, 0, 1, 0],
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 0]
    ])
    expect(image).to respond_to(:output_image)
  end

  it "Prints a 1 up, down, left, and right of already existing 1 values" do
    image = Image.new([
      [0, 0, 1, 0],
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 0]
    ])
    expect(image).to respond_to(:blur)
  end

  it "Changes 0 values to 1's around an already existing 1 value" do
    image = Image.new([
      [0, 0, 1, 0],
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 0]
    ])
    expect(image.blur).to eq [
      [0, 1, 1, 1],
      [0, 1, 1, 0],
      [1, 1, 1, 0],
      [0, 1, 0, 0]
    ]
  end

  it "Changes 0 values to 1's around an already existing 1 value" do
    image = Image.new([
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [1, 0, 0, 0, 0],
      [0, 0, 0, 0, 1],
      [0, 1, 0, 0, 0]
    ])
    expect(image.blur).to eq [
      [0, 0, 0, 1, 1],
      [1, 0, 1, 1, 1],
      [1, 1, 0, 1, 1],
      [1, 1, 0, 1, 1],
      [1, 1, 1, 0, 1]
    ]
  end

  it "Changes 0 values to 1's around an already existing 1 value" do
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
    expect(image.blur).to eq [
      [1, 1, 0, 0, 0, 0, 0, 0, 1, 1],
      [1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
      [0, 0, 1, 1, 1, 0, 0, 0, 0, 0],
      [0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 1, 0, 0, 0],
      [0, 0, 0, 0, 0, 1, 1, 1, 0, 0],
      [1, 0, 0, 0, 0, 0, 1, 0, 0, 1],
      [1, 1, 0, 0, 0, 0, 0, 0, 1, 1]
    ]
  end

  it "Changes 0 values to 1's around an already existing 1 value" do
    image = Image.new([
      [1, 0, 0, 0, 0, 0, 0, 0, 0, 1]
    ])
    expect(image.blur).to eq [
      [1, 1, 0, 0, 0, 0, 0, 0, 1, 1]
    ]
  end

  it "Changes 0 values to 1's around an already existing 1 value" do
    image = Image.new([
      [1], 
      [0], 
      [0], 
      [0], 
      [0], 
      [0], 
      [0], 
      [0], 
      [0], 
      [1]
    ])
    expect(image.blur).to eq [
      [1],
      [1],
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
      [1],
      [1]
    ]
  end

end