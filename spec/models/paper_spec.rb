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
end
