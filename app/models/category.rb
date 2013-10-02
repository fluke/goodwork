class Category < ActiveRecord::Base
  validates_presence_of :name
  has_and_belongs_to_many :donations, :join_table => 'ngos_categories'
end
