require 'rails_helper'

describe 'As a visitor', type: :feature do
  describe 'when I am on a student show page' do
    it 'shows a list of their courses' do
      longbottom = Student.create!(name: "Neville Longbottom", age: 14, house: "Gryffindor")

      herbology = Course.create!(name: "Herbology")
      dark_arts = Course.create!(name: "Defense against the dark arts")

      herbology.students << longbottom
      dark_arts.students << longbottom

      visit "/students/#{longbottom.id}"

      expect(page).to have_content('Herbology')
      expect(page).to have_content('Defense against the dark arts')
    end
  end
end