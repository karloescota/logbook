class Log < ApplicationRecord
  belongs_to :user

  validates :user, presence: true

  def total_time
    return unless time_out
    time_out - time_in
  end

  def total_time_view
    Time.at(total_time).utc.strftime('%H:%M') if total_time
  end
end
