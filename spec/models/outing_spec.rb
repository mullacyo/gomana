require 'rails_helper'

RSpec.describe Outing, type: :model do
  context "validation tests" do 
    user = User.first
    it 'creates a new outing without date' do
      expect{ Outing.create!(start_time: "2000-01-01 11:11:00", end_time: "2000-01-01 12:11:00" ) }.to raise_error('Validation failed: Date can\'t be blank')
    end

    it 'creates a new outing without start_time' do
      expect{ Outing.create!(date: "2000-01-01", end_time: "2000-01-01 12:11:00" ) }.to raise_error('Validation failed: Start time can\'t be blank')
    end

    it 'creates a new outing without end_time' do
      expect{ Outing.create!(start_time: "2000-01-01 11:11:00", date: "2000-01-01" ) }.to raise_error('Validation failed: End time can\'t be blank')
    end

    # it 'creates a new outing without date' do
    #   expect{ Outing.create!(user_id: user.id, start_time: "2000-01-01 11:11:00", end_time: "2000-01-01 12:11:00" ) }.to raise_error('Validation failed: Game name can\'t be blank')
    # end

    it 'should have_many actions_outings' do
      expect(Outing.reflect_on_association(:actions_outings).macro).to eq(:has_many)
    end

    it 'should have_many outings_users' do
      expect(Outing.reflect_on_association(:outings_users).macro).to eq(:has_many)
    end

    it 'should have_many actions' do
      expect(Outing.reflect_on_association(:actions).macro).to eq(:has_many)
    end

    it 'should have_many users' do
      expect(Outing.reflect_on_association(:users).macro).to eq(:has_many)
    end
  end
end