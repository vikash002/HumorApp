class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :links
  has_many :gkeeys
  has_many :wtfs
  has_many :memes
  has_many :girls
  has_many :cutes

end
