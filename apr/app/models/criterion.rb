class Criterion < ActiveRecord::Base
  validates :criterion_number, presence: {message: "cannot be blank!"}, uniqueness: true
  validates :description, presence: {message: "cannot be blank!"}
end
