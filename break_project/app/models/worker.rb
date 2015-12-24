class Worker < ActiveRecord::Base
  has_and_belongs_to_many :clients
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
