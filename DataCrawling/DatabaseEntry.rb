#!/usr/bin/ruby

require 'sqlite3'

begin

  db = SQLite3::Database.open "/home/achillies/RubymineProjects/raddit-master/db/development.sqlite3"

  ch = String.new("raddit-master/DataCrawling")
  #smt = db.prepare"INSERT INTO links values(?,?,?,?,?,?,?)"
  ary_topic = ['cutes', 'geekys', 'girls','memes', 'wtfs']
  ary_title = ['cutetitle2.txt', 'geektitle2.txt','girltitle2.txt','memetitle2.txt','wtftitle2.txt']
  ary_link = ['cutelink2.txt', 'geeklink2.txt', 'girllink2.txt','memelink2.txt', 'wtflink2.txt']
  for i in 0..ary_topic.length
    #link = @ch + ary_link[i]
    #title = @ch + ary_title[i]
    file1 = File.new(ary_title[i])
    file2 = File.new(ary_link[i])
    #db.execute "select  * from girls"
    tb = ary_topic[i]

    while line1 = file1.gets

      line2 = file2.gets
      if line2 == nil 
        break
      end

      puts "#{line1} #{line2}#{tb}"

      ch = "INSERT INTO #{tb} (title, url,created_at, updated_at, user_id) VALUES (?,?,?,?,?)"
      db.execute(ch ,line1,line2,Time.now.inspect,Time.now.inspect,1)
    end


  end
rescue SQLite3::Exception => e

  puts "Exception occurred"
  puts e

  db.close

  end
