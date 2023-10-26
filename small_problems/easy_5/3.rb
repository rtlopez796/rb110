HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_string)
  return 0 if time_string == '00:00' || time_string == '24:00'
  hours = time_string[0..1].to_i
  minutes = time_string[3..4].to_i
  minutes += hours * MINUTES_PER_HOUR
end

def before_midnight(time_string)
  return 0 if after_midnight(time_string) == 0
  MINUTES_PER_DAY - after_midnight(time_string)
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0