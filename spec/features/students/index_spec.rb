require 'rails_helper'

describe 'As a visitor', type: :feature do
  describe 'When I visit a students index' do

    before :each do
      @draco = Student.create!(name: "Draco Malfoy", age: 15, house: "Slytherin")
      @longbottom = Student.create!(name: "Neville Longbottom", age: 14, house: "Gryffindor")
    end

    it 'shows all the info for each student' do
      visit '/students'

      expect(page).to have_content(@draco.name)
      expect(page).to have_content(@draco.age)
      expect(page).to have_content(@draco.house)

      expect(page).to have_content(@longbottom.name)
      expect(page).to have_content(@longbottom.age)
      expect(page).to have_content(@longbottom.house)
    end
  end
end