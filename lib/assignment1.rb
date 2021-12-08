require 'csv'

contents = CSV.open(
  'event_attendees.csv',
   headers: true,
   header_converters: :symbol
   )

contents.each do |row|
  phone = row[:homephone]
  name = row[:first_name]

  cleanedphone = phone.gsub(/\D/, '')
  if cleanedphone.length > 11
    cleanedphone.gsub!(/[0-9]/, '0')
  elsif cleanedphone.length == 11
    if cleanedphone[0] == "1"
      cleanedphone.slice!(0)
    else
      cleanedphone.slice!(0)
      cleanedphone.gsub!(/[0-9]/, '0')
    end
  elsif cleanedphone.length < 10
    cleanedphone = cleanedphone.rjust(10, "0")
    cleanedphone.gsub!(/[0-9]/, '0')
  end

  puts "#{name} #{cleanedphone}"
end