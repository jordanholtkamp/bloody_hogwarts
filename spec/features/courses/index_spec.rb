require 'rails_helper'

describe 'As a visitor', type: :feature do
  describe 'When I am on the course index page' do
    it 'shows each course and how many students are enrolled' do
      longbottom = Student.create!(name: "Neville Longbottom", age: "14", house: "Gryffindor")
      harry = Student.create!(name: 'Harry Potter', age: '15', house: 'Gryffindor')
      cedric = Student.create!(name: 'Cedric Diggory', age: '17', house: 'Ravenclaw')

      herbology = Course.create!(name: "Herbology")
      dark_arts = Course.create!(name: "Defense against the dark arts")

      herbology.students << longbottom
      dark_arts.students << longbottom
      dark_arts.students << harry
      dark_arts.students << cedric
      herbology.students << harry

      visit "/courses"

      expect(page).to have_content(herbology.name)
      expect(page).to have_content(dark_arts.name)

      expect(page).to have_content('Herbology: 2')
      expect(page).to have_content('Defense against the dark arts: 3')
    end
  end
end