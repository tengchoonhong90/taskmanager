class Taskee < ApplicationRecord
    belongs_to :user
    belongs_to :task
    # validates :bid, presence: { message: "Please input a price. Lowest is $0" }
end