class Log < ApplicationRecord
  belongs_to :user

  validates :user, presence: true

  def total_time
    return 0 unless time_out
    (time_out - time_in).to_i
  end

  def total_time_view
    total_time ? [total_time / 3600, total_time / 60 % 60].map { |t| t.to_s.rjust(2,'0') }.join(':') : '00:00'
  end
end
