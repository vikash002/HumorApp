require 'csv'
a = gets.chomp
csv = CSV.read(a, :headers=>true)
#p csv['title']
row = csv['link']
char = String.new()
	row.each do |var|
		#p var
		var = var.to_s
		#p var
	 	for i in 0..var.length
			if (var[i, 2].eql?("u'") || var[i, 2].eql?("u\""))  then
				j = i+2
				while (true) do 
					char += var[j].to_s
					j += 1
					#puts var[j,2] 
					if (var[j, 2].eql?("u'") || var[j, 2].eql?("u\"")|| var[j,1].eql?("]")) then
						break
					end
				end
				p char
				char = ""
			 end 			
		end
	
			
	end



