def leap_year?(year)
  year % 400 == 0 or year % 4 == 0 && year % 100 != 0
end

def minutes_in_year(year)
  60 * 24 * (leap_year?(year) ? 366 : 365)
end

[ 2000, 2004, 1900, 2005 ].each do |year|
  leap = leap_year?(year)
  puts "Number of minutes in the #{'(leap)' if leap}year #{year}: #{minutes_in_year(year)}"
end
