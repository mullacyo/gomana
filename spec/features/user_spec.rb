require 'rails_helper'
describe "the sign up process", type: :feature do
  it "signs me up" do
    visit '/users/new'
    within("form") do
      fill_in 'user[first_name]', with: 'John'
      fill_in 'user[last_name]', with: 'Doe'
      fill_in 'user[email]', with: 'john.smith@example.com'
      fill_in 'user[password]', with: '"this@is@a@stong@password"'
      fill_in 'user[password_confirmation]', with: '"this@is@a@stong@password"'
    end
    click_button 'Create User'
  end
  it "returns me back if not meet User model validations" do
    visit '/users/new'
    within("form") do
      fill_in 'user[first_name]', with: 'John'
      fill_in 'user[last_name]', with: 'Doe'
      fill_in 'user[password]', with: '"this@is@a@stong@password"'
      fill_in 'user[password_confirmation]', with: '"this@is@a@stong@password"'
    end
    click_button 'Create User'
  end
end