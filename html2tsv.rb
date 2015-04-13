require 'kconv'
require 'nokogiri'
require 'csv'

all_data = []
all_keys = []
html_files = Dir.glob('./data/*.html')
#html_files = Dir.glob('./data/bonus/*.html')
html_files.each do |path|
  html = open(path) do |f| f.read end

  month_data = {}
  doc = Nokogiri::HTML.parse(html.toutf8, nil, 'utf-8')
  doc.css('tr').each do |tr|
    tds = tr.css('td')
    if (tds.length == 2)
      month_data[tds[0].inner_text] = tds[1].inner_text
      all_keys.push(tds[0].inner_text)
    elsif (tds.length == 4)
      month_data[tds[0].inner_text] = tds[1].inner_text
      month_data[tds[2].inner_text] = tds[3].inner_text
      all_keys.push(tds[0].inner_text, tds[2].inner_text)
    end
  end
  all_data.push(month_data)
end

all_keys.uniq!
formatted_all_data = all_data.map do |month_data|
  all_keys.map { |key| month_data[key] || "" }
end

CSV.open("salary.tsv", "w", :col_sep => "\t") do |io|
#CSV.open("bonus.tsv", "w", :col_sep => "\t") do |io|
  io.puts(all_keys)
  formatted_all_data.each { |row| io.puts(row) }
end
