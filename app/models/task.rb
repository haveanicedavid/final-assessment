class Task < ActiveRecord::Base

  validates :title, presence: true
  belongs_to :list

  enum status: %w(Incomplete Complete)
end
