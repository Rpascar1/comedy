class Joke < ApplicationRecord
    validates :topic, presence: true
    validates :body, presence: true


  belongs_to :user
end
