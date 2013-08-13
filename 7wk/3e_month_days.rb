require 'date'

DAYS_IN_MONTHS = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
def month_days(month, year = Time.now.year)
  return 29 if month == 2 && Date.gregorian_leap?(year)
  DAYS_IN_MONTHS[month]
end

if __FILE__ == $PROGRAM_NAME
  puts month_days 5
  puts month_days(2, 2000)
end
