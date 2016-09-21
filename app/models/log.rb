class Log < ApplicationRecord
  scope :current_log, -> { find_by("date(time_in) = ?", Date.current) }

  belongs_to :user

  def total_time
    return unless time_out
    diff = time_out - time_in
    Time.at(diff).utc.strftime("%H:%M")
  end
end
