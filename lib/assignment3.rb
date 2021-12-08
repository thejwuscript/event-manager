require 'time'
require 'csv'

datafile = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

registrants_per_day = Hash.new(0)

datafile.each do |row|
  formatted_datetime = Time.strptime(row[:regdate], '%m/%d/%y %k:%M')
  registrants_per_day[formatted_datetime.wday] += 1
end

puts registrants_per_day.max_by{|k,v| v}[0] # => 3