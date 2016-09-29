class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :name, presence: true

  has_many :logs

  def current_log
    logs.find_by("date(time_in) = ?", Date.current)
  end

  def logs_this_week
    logs.where("date(time_in) >= ? AND date(time_in) <= ? ", Date.current.beginning_of_week, (Date.current.end_of_week - 2))
  end

  def current_week_logs
    logs_this_week.order(time_in: :desc)
  end

  def current_week_total_time
    logs_this_week.where.not(time_out: nil).sum(&:total_time)
  end

  def current_week_total_time_view
    [current_week_total_time / 3600, current_week_total_time / 60 % 60].map { |t| t.to_s.rjust(2,'0') }.join(':')
  end
end
