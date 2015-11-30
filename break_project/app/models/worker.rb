class Worker < ActiveRecord::Base
  belongs_to :client
  has_many :shifts

  def month_shifts
    shifts.where("start >= ?", Time.now.beginning_of_month)
  end

  def month_totals
    total = 0
    month_shifts.each do |shift|
      total += (shift.stop.strftime('%H:%M:%S').to_i - shift.start.strftime('%H:%M:%S').to_i)
    end
    return total
  end
end
