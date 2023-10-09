class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: {
    publisher_admin: 0,
    organization_admin: 1
  }
  has_many :publishers
  has_many :organizations

  validates :role, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates_uniqueness_of :email
end
