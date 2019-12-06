class Student < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :house

  has_many :student_courses
  has_many :courses, through: :student_courses

  def self.average_age
    students = Student.all
    tote = students.sum do |student|
      student.age
    end
    (tote.to_f / students.count).round(2)
  end
end

