require 'spec_helper'

describe "Addresses Controller" do

  before(:each) do
    @joe = Contact.create! name: "Joe Blow", email: "joeblow@example.com"
    @address = @joe.addresses.create! street: "334 golden street", state: "California"
  end

  it "creates addresses" do
    visit "/contacts/#{@joe.id}"
    click_link "New Address"
    fill_in "Street", with: "123 happy trail"
    fill_in "City", with: "Cincinnati"
    fill_in "State", with: "Ohio"
    fill_in "Zip", with: "45240"
    click_button "Save"
    expect(page).to have_content("123 happy trail")
    expect(page).to have_content(@joe.name)
  end

  it "edits addresses" do
    visit "/contacts/#{@joe.id}/addresses/#{@address.id}/edit"
    fill_in "Street", with: "334 Other Way"
    click_button "Save"
    expect(page).to have_content("Other Way")
    expect(page).to have_content(@joe.name)
  end
end
