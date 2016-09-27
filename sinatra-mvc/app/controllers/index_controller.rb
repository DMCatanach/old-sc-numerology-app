require 'sinatra'


def setup_index_view
	birthdate = params['birthdate']  
	path_num = Person.get_birth_path_num(birthdate)
	@message = Person.path_message(path_num)
	erb :index
end	

get '/' do 
	erb :form
end


=begin
The following and everything that isn't pulling something from the database, is now broken, because it's trying to call "determine_path_number", 
which I had to change to pass the spec tests. I don't know where the hell it's calling it from, though. I've run find on that string, 
and it's only showing up in comments. Changing it back in my Person class did not help, still throwing an error. Let's fix this later. 
At least the part I'm working with right now isn't broken. NEVER MIND. IT IS FIXED. BUT I FORGOT TO RESTART THE SERVER AFTER MAKING 
THOSE CHANGES. THAT IS AN IMPORTANT STEP! 
However, it is still showing a dangling "Your numology number is" because I haven't cleaned that up yet. 
=end

get '/:birthdate' do 
	setup_index_view
end

get '/message/:path_num' do  
	path_num = params[:path_num].to_i
	@message = Person.path_message(path_num) 
	erb :index 
end 

post '/' do 
	birthdate = params[:birthdate].gsub("-","")
	if Person.valid_birthdate(birthdate)
		path_num = Person.get_birth_path_num(birthdate) 
		redirect "/message/#{path_num}" 
	else
		@error = "You should enter a valid birthdate in the form of mmddyyyy."
		#@error = "Sorry, your birthdate was not exactly 8 digits. Remember to type your birthdate in MMDDYYY format, including a leading 0 for single-digit days and months."
		erb :form
	end
end

post '/' do 
	"#{params}"
end

get '/' do 
	"Hello world!"
end

get '/newpage' do 
	erb :newpage
end  






