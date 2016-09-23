class Log < ApplicationRecord
  belongs_to :user

  validates :user, presence: true

  def total_time
    return unless time_out
    diff = time_out - time_in
    Time.at(diff).utc.strftime("%H:%M")
  end
end
