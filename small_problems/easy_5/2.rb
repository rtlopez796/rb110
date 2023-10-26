def time_of_day(total_minutes)
  hours, minutes = convert_minutes(total_minutes)
  if total_minutes < 0
    hours = 23 - hours
    minutes = 60 - minutes
  end
  time_string = sprintf('%02d:%02d', hours, minutes)
end

def convert_minutes(minutes)
  minutes *= -1 if minutes < 0
  hours, minutes = minutes.divmod(60)
  if hours >= 24
    until hours < 24
      hours -= 24
    end
  end
  return hours, minutes
end

p time_of_day(0)  == "00:00"
p time_of_day(-3)  == "23:57"
p time_of_day(35)  == "00:35"
p time_of_day(-1437)  == "00:03"
p time_of_day(3000)  == "02:00"
p time_of_day(800)  == "13:20"
p time_of_day(-4231)  == "01:29"
