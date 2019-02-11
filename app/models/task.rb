class Task < ApplicationRecord
    # has_and_belongs_to_many :users
    belongs_to :user
    has_many :taskees
    has_many :chats
    has_many :reputations
    validates :task_name, presence: { message: "Please input a name for your task" }, length: { minimum: 8, message: "The given name is too short. At least 8 characters required."}
    validates :task_description, presence: { message: "Please describe the task" }, length: { minimum: 12, message: "Please elaborate more on how the task is meant to be done."}
    validates :start_time, presence: { message: "Please let potential helpers know when the task should start." }
    validates :price, presence: { message: "Please input a price. Lowest is $0" }, numericality: { only_float: true, message: "Please input a valid number."}
    # validates :negotiable, {presence: {message: "Please let us know whether you want to allow potential helpers to bid for prices."}}
    
end
