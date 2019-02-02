class Task < ApplicationRecord
    has_and_belongs_to_many :users
    validates :task_name, presence: true, length: { minimum: 3}
    validates :location, presence: true, numericality: { only_integer: true }, length: { minimum: 6, maximum: 6}
    validates :task_description, presence: true, length: { minimum: 10}
    validates :price, presence: true, numericality: { only_integer: true }
    validates :negotiable, {presence: true}
    
end
