class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :enrollments
  has_many :courses, through: :enrollments
  enum role: { student: 0, instructor: 1, admin: 2 }
end
