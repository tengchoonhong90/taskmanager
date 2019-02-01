class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_and_belongs_to_many :tasks
         has_many :reputations

    validates :phone, numericality: { only_integer: true }
    validates :username, presence: true, length: { minimum: 5, maximum: 20 }
    validates :name, presence: true, length: { minimum: 3, maximum: 20 }

end