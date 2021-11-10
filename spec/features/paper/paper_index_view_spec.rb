require 'rails_helper'

describe "Paper view", :type => :feature do
    it "should display only papers of the requested year" do
        Paper.create(title: "Paper 1", venue: "Venue 1", year: 1950)
        Paper.create(title: "The Paper", venue: "Testvenue", year: 1950)
        Paper.create(title: "Paper 2", venue: "Venue 2", year: 1968)

        visit papers_path(year: 1950)

        expect(page).to have_text("Paper 1")
        expect(page).to have_text("Venue 1")
        expect(page).to have_text("The Paper")
        expect(page).to have_text("Testvenue")
        expect(page).not_to have_text("Paper 2")
        expect(page).not_to have_text("Venue 2")
    end
end