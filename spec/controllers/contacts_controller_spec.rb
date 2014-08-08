require 'spec_helper'

describe "Contacts controller" do

  before(:each) do
    @joe = Contact.create! name: "Joe Blow", email: "joeblow@example.com"
  end

  it "retrieves contacts" do
    visit "/contacts"
    expect(page).to have_content(@joe.name)
  end

  it "creates contacts" do
    visit "/contacts/new"
    fill_in "Name", with: "Fred Person"
    fill_in "Email", with: "fred@example.com"
    click_button "Save"
    expect(page).to have_content("Fred Person")
  end

  it "edits contacts" do
    visit "/contacts/#{@joe.id}/edit"
    fill_in "Name", with: "Not Joe"
    click_button "Save"
    expect(page).to have_content("Not Joe")
  end

  it "delete contacts" do
    visit "/contacts/#{@joe.id}/edit"
    click_button "DELETE"
    expect(page).to have_content("Contacts")
    expect(page).not_to have_content("Joe Blow")
  end

  after(:each) do
    Contact.delete_all
  end
end
