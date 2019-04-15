class Adventure < ActiveRecord::Base
  has_many :stories
  has_many :users
end
