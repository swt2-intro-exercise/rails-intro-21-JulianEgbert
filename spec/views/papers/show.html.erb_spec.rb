require 'rails_helper'

RSpec.describe "papers/show", type: :view do
  context "Automatically generated tests" do
    before(:each) do
      @paper = assign(:paper, Paper.create!(
        title: "Title",
        venue: "Venue",
        year: 2
      ))
    end

    it "renders attributes in <p>" do
      render
      expect(rendered).to match(/Title/)
      expect(rendered).to match(/Venue/)
      expect(rendered).to match(/2/)
    end
  end

  it "displays the full name of all authors" do
    @paper = create(:paper)
    render
    expect(rendered).to have_text("Alan Turing")
  end
end
