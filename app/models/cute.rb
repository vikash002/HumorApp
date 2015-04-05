class Cute < ActiveRecord::Base
  acts_as_votable

  belongs_to :user
  has_many :commentgs

end
