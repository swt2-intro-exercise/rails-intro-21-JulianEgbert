require 'rails_helper'

describe "Authors index view", :type => :feature do
    it "should render the page" do
        visit authors_path()
    end

    it "should present names and homepages" do
        visit authors_path()
        expect(page).to have_text("Name")
        expect(page).to have_text("Homepage")
    end

    it "should give the option to add a new author" do
        visit authors_path()
        expect(page).to have_link "New", href: new_author_path
    end
end