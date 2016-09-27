class Person < ActiveRecord::Base
	def self.get_birth_path_num(birthdate) #changed from determine_path_number
		path_num = birthdate[0].to_i + birthdate[1].to_i + birthdate[2].to_i + birthdate[3].to_i + birthdate[4].to_i  + birthdate[5].to_i + birthdate[6].to_i + birthdate[7].to_i
			if (path_num > 9)
				path_num = path_num.to_s 
				path_num = path_num[0].to_i + path_num[1].to_i  
			if (path_num > 9) 
				path_num = path_num.to_s
				path_num = path_num[0].to_i + path_num[1].to_i
			end
		end
		return path_num
	end

	def self.path_message(path_num)
		case (path_num)
			when 1
				message = "One is the leader. The number one indicates the ability to stand alone, and is a strong vibration. Ruled by the Sun."
			when 2
				message = "This is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon."
			when 3
				message = "Number Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic, Three's enjoy life and have a good sense of humor. Ruled by Jupiter."
			when 4
				message = "This is the worker. Practical, with a love of detail, Fours are trustworthy, hard-working, and helpful. Ruled by Uranus." 
			when 5 
				message = "This is the freedom lover. The number five is an intellectual vibration. These are 'idea' people with a love of variety and the ability to adapt to most situations. Ruled by Mercury."
			when 6 
				message = "This is the peace lover. The number six is a loving, stable, and harmonious vibration. Ruled by Venus."
			when 7 
				message = "This is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet. Ruled by Neptune."
			when 8 
				message = "This is the manager. Number Eight is a strong, successful, and material vibration. Ruled by Saturn."
			when 9
				message = "This is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration. Ruled by Mars."
			else 
				message = "You must be exceptional!"
		end
		message = message
	end

	def self.get_your_path_number
		your_number = get_birth_path_num(get_birthdate)
		your_message = path_message(your_number)
		puts "Your number is #{your_number}. #{your_message}"
	end

	

	def self.valid_birthdate(input)
		if input.length == 8 && input.match(/^[0-9]+[0-9]$/)
			return true
		else
			return false
		end
	end

end

