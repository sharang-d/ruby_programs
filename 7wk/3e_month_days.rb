require 'date'

DAYS_IN_MONTHS = [29, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
# doctest: handles leap years
# >> month_days(2, 2000)
# => 29
# >> month_days(2, 2013)
# => 28
def month_days(month, year = Time.now.year)
  DAYS_IN_MONTHS[month == 2 && Date.gregorian_leap?(year) ? 0 : month]
end

if __FILE__ == $PROGRAM_NAME
  puts month_days 5
  puts month_days(2, 2000)
  puts month_days 10
end
