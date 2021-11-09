require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end
  it "should have text inputs for an author's first name, last name and homepage" do
    visit new_author_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should create an error when creating an invalid author" do
    visit new_author_path
    fill_in "author[first_name]", with: "Alan"
    fill_in "author[homepage]", with: "AlanTouring.com"
    click_button "Save Author"
    expect(page).to have_selector("#error_explanation")
    expect(page).to have_text("error")
  end

  it "should highlight missing fields" do
    visit new_author_path
    fill_in "author[first_name]", with: "Alan"
    click_button "Save Author"
    expect(page).to have_selector(".field_with_errors")
  end
end
