# encoding: utf-8

require 'csv'
require 'pp'



def build_codes

  in_path = './attic/countries(249)_iso.csv'

  codes = CSV.read( in_path, headers: true )

  ## test run
  codes.each do |row|
    pp row
  end


  recs = []
  codes.each do |row|
    recs << [row['Alpha-2'],row['Name']]
  end

  save( './countries(249)_alpha2.csv', ['Code','Name'], recs )

  recs = []
  codes.each do |row|
    recs << [row['Alpha-3'],row['Name']]
  end

  save( './countries(249)_alpha3.csv', ['Code','Name'], recs )

  recs = []
  codes.each do |row|
    recs << [row['Numeric-3'],row['Name']]
  end

  save( './countries(249)_num3.csv', ['Code','Name'], recs )

  puts 'bye'
end


def save( path, headers, recs )
  File.open( path, 'w') do |f|
     f.puts headers.join(',')
     recs.each do |rec|
       f.puts rec.join(',')
     end
  end
end


build_codes()
