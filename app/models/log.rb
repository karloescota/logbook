class Log < ApplicationRecord
  scope :current_log, -> { find_by("date(time_in) = ?", Date.current) }

  belongs_to :user
end
