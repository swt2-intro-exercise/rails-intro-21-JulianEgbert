require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "shouldn't accept papers without a title" do
    @paper = Paper.new(venue: "Testvenue", year: 4711)
    expect(@paper).to_not be_valid
  end

  it "shouldn't accept papers without any information" do
    @paper = Paper.new()
    expect(@paper).to_not be_valid
  end
end
