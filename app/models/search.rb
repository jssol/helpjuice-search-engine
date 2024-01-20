class Search < ApplicationRecord
  validates :query, presence: true

  self.record_timestamps = true
end
