DEGREE = "\xC2\xB0" 
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60

def dms(degrees_float)
  dms_hash = {}
  
  dms_hash[:degrees] = degrees_float.floor
  degrees_float = (degrees_float - degrees_float.floor)
  
  dms_hash[:minutes] = (degrees_float * MINUTES_PER_DEGREE).floor
  degrees_float = (degrees_float * MINUTES_PER_DEGREE) - dms_hash[:minutes]

  dms_hash[:seconds] = degrees_float * SECONDS_PER_MINUTE.floor
  "#{dms_hash[:degrees]}#{DEGREE}%<minutes>.2d'%<seconds>.2d\"" % dms_hash
end


puts dms(30) #== %(30°00'00")
puts dms(76.73) #== %(76°43'48")
puts dms(254.6) #== %(254°36'00")
puts dms(93.034773) #== %(93°02'05")
puts dms(0) #== %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")