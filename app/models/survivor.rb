class Survivor < ApplicationRecord
  enum gender: %i[other male female]
  enum status: %i[refugee infected recovered]
  
  # validations 
  validates :name, :age, presence: true
  validates :gender, numericality: { only_integer: true, greater_than_or_equal: 0, less_than_or_equal: 2 }
end
