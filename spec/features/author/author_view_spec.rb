require 'rails_helper'

describe "Author view", :type => :feature do
    it "should display the authors page" do
        @alan = create(:author)
        visit author_path(@alan)
    end

    it "should contain the authors name" do
        @alan = create(:author)
        visit author_path(@alan)
        expect(page).to have_text("Alan Turing")
    end
end