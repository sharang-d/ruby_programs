def seconds_to_years_and_months(seconds, precision=true)
  years = seconds.to_f / 60 / 60 / 24 / 365
  months = (years % 1) * 12
  months = months.to_i unless precision
  return years.to_i, months
end

if __FILE__ == $PROGRAM_NAME
  puts "With precision:"
  [979000000, 2158493738, 246144023, 1270166272, 1025600095].each do |age_in_seconds|
    years, months = seconds_to_years_and_months(age_in_seconds)
    puts "#{age_in_seconds} seconds: #{years} years, #{months} months"
  end

  puts "\nWithout precision:"
  [979000000, 2158493738, 246144023, 1270166272, 1025600095].each do |age_in_seconds|
    years, months = seconds_to_years_and_months(age_in_seconds,false)
    puts "#{age_in_seconds} seconds: #{years} years, #{months} months"
  end
end

