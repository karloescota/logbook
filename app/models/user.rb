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

  def current_week_total_time
    logs.where("date(time_in) >= ? AND date(time_in) <= ? ", Date.current.beginning_of_week, (Date.current.end_of_week - 2))
        .sum(&:total_time)
  end
end
