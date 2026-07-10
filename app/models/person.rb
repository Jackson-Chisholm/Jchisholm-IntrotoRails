class Person < ApplicationRecord
  belongs_to :quote
  validates :name, :said_at, presence: true
end
