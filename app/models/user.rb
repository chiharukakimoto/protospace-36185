class User < ApplicationRecord
  has_many :prototypes
  has_many :comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, presence: true
  validates :user_profile, presence: true
  validates :user_occupation, presence: true
  validates :user_position, presence: true
end
