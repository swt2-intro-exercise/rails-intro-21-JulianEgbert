require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "should accept papers" do
    @paper = Paper.new(title: "Test", venue: "Testvenue", year: 4711)
    expect(@paper).to be_valid
  end
  
  it "shouldn't accept papers without a title" do
    @paper = Paper.new(venue: "Testvenue", year: 4711)
    expect(@paper).to_not be_valid
  end

  it "shouldn't accept papers without any information" do
    @paper = Paper.new()
    expect(@paper).to_not be_valid
  end

  it "shouldn't accept papers without a year" do
    @paper = Paper.new(title: "Test", venue: "Testvenue")
    expect(@paper).to_not be_valid
  end

  it "shouldn't accept papers without a venue" do
    @paper = Paper.new(title: "Test", year: 4711)
    expect(@paper).to_not be_valid
  end

  it "should have a numeric year" do
    @paper = Paper.new(title: "Test", venue: "Testvenue", year: "HelloWorld")
    expect(@paper).to_not be_valid
  end

  it "should have an empty list of authors" do
    @paper = Paper.new(title: "Test", venue: "Testvenue", year: "HelloWorld")
    expect(@paper.authors).to be_empty
  end

  it "should have a related author" do
    @paper = create(:paper)
    expect(@paper.authors).to_not be_empty
  end

  it "should delete a paper" do
    @paper = create(:paper)
    @count = Paper.count
    @paper.destroy
    expect(Paper.count).to eq(@count - 1)
  end
end
