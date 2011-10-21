class Meal < ActiveRecord::Base
  validates_uniqueness_of :name, :scope => :lunch_id
  belongs_to :lunch
end
