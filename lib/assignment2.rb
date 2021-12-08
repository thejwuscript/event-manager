require 'time'
require 'csv'

datafile = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

peak_hours = Hash.new(0)

datafile.each do |row|
  formatted_datetime = Time.strptime(row[:regdate], '%m/%d/%y %k:%M')
  peak_hours[formatted_datetime.hour] += 1
end

puts peak_hours.max_by{|k,v| v}[0] # => 13