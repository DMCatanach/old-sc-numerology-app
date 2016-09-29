require 'sinatra'

=begin
Remember to restart server after making changes, otherwise, it won't pick it up.  
Also, it is still showing a dangling "Your numology number is" because I haven't cleaned that up yet. 
=end

get '/:birthdate' do 
	setup_index_view
end

get '/message/:path_num' do  
	path_num = params[:path_num].to_i
	@message = Person.path_message(path_num) 
	erb :index 
end 

get '/' do 
	erb :form
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

def setup_index_view
	birthdate = params['birthdate']  
	path_num = Person.get_birth_path_num(birthdate)
	@message = Person.path_message(path_num)
	erb :index
end	


=begin 
These are some legacy routes from the first lessons on routes. 
post '/' do 
	"#{params}"
end

get '/' do 
	"Hello world!"
end

get '/newpage' do 
	erb :newpage
end  

=end





