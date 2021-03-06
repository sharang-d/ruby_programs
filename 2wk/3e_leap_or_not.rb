def leap_year?(year)
  year % 400 == 0 or year % 4 == 0 && year % 100 != 0
end

def minutes_in_year(year, is_leap)
  60 * 24 * (is_leap ? 366 : 365)
end

[ 2000, 2004, 1900, 2005 ].each do |year|
  leap = leap_year?(year)
  puts "Number of minutes in the #{'(leap)' if leap}year #{year}: #{minutes_in_year(year, leap)}"
end
