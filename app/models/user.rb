class User < ActiveRecord::Base
  belongs_to :adventure
  has_many :stories, through: :adventures

end
