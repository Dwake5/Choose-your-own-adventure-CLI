class Story < ActiveRecord::Base
  belongs_to :adventure
  has_many :users, through: :adventures
end
