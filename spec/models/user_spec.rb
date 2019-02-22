require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation tests" do 
    it 'creates a new user with valid data' do
        expect(User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: '123qwe')).to be_valid
    end

    it 'creates a new user without first name' do
        expect{ User.create!(last_name: 'Doe', email: 'john@example.com', password: '123qwe') }.to raise_error('Validation failed: First name can\'t be blank')
    end

    it 'creates a new user without last name' do
        expect{ User.create!(first_name: 'John', email: 'john@example.com', password: '123qwe') }.to raise_error('Validation failed: Last name can\'t be blank')
    end

    it 'creates a new user without password' do
        expect{ User.create!(first_name: 'John', last_name: 'Doe', email: 'john@example.com') }.to raise_error('Validation failed: Password can\'t be blank, Password is too short (minimum is 6 characters)')
    end

    it 'should have password length more than 5 characters' do
        expect{ User.create!(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: '123qw') }.to raise_error('Validation failed: Password is too short (minimum is 6 characters)')
    end

    it 'should have a unique email' do
      user1 = User.create!(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: '123qwe')
      expect{ User.create!(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: '123qwe') }.to raise_error('Validation failed: Email has already been taken')
    end

    it 'should have a proper email format' do
      expect{ User.create!(first_name: 'John', last_name: 'Doe', email: 'dasd', password: '123qwe') }.to raise_error('Validation failed: Email is invalid')
    end

    it 'should have many outings_users' do
      expect(User.reflect_on_association(:outings_users).macro).to eq(:has_many)
    end

    it 'should have many outings' do
      expect(User.reflect_on_association(:outings).macro).to eq(:has_many)
    end
  end
end