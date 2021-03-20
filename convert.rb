# frozen_string_literal: true

require 'pdf/reader'

filename = 'input'

PDF::Reader.open(filename + '.pdf') do |reader|
  puts "Converting : #{filename}"
  pageno = 0
  txt = reader.pages.map do |page|
    pageno += 1
    begin
      print "Converting Page #{pageno}/#{reader.page_count}\r"
      page.text
    rescue StandardError
      puts "Page #{pageno}/#{reader.page_count} Failed to convert"
      ''
    end
  end # pages map

  puts "\nWriting text to disk"
  File.write filename + '.txt', txt.join("\n")
end
