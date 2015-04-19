class Tools
  
#############################################################################
  # Converts an array into a hash 
  def self.to_hash(array)
    hash = {}
    array.each do |record|
      hash[record.id] = record
    end  # do
    return hash
  end  # to_hash
 
############################################################################
  # this method converts UTC Datetime to AM/PM Datetime.
  
  def self.to_ampm(time)
    min = time.min.to_s
    hour = time.hour.to_s
    year = time.year.to_s
    month = time.month.to_s
    day = time.day.to_s
    if (time.hour >= 12) && (time.hour <= 23) # chech if time is PM
      hour = case time.hour
        when 12 then 12
        when 13 then 1
        when 14 then 2
        when 15 then 3
        when 16 then 4
        when 17 then 5
        when 18 then 6
        when 19 then 7
        when 20 then 8
        when 21 then 9
        when 22 then 10
        when 23 then 11
      end
      hour = hour.to_s
      if min == "0"
        min = "00"
      end
      return month + "/" + day + "/" + year + " " + hour + ":" + min + "  PM"
    end # if
    if (time.hour >=1 ) && (time.hour <= 11 ) # check if time is AM
      if min == "0"
        min = "00"
      end
      return month + "/" + day + "/" + year + " " + hour + ":" + min + "  AM"
    end # if
    if (time.hour == 0) # check if midnight
      hour = "12"
      if min == "0"
        min = "00"
      end
      return month + "/" + day + "/" + year + " " + hour + ":" + min + "  AM"
    end # if
  end # to_ampm

#############################################################################
 
end  # class Tools

