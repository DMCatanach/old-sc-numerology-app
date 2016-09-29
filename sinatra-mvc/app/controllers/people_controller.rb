get '/people' do 
	@people = Person.all
	erb :"/people/index"
end

get '/people/new' do 
	@person = Person.new  #the addition of this makes the route work, but submit button doesn't work, duplicates 'people' in the route, like the edit page was
	erb :"/people/new"  	#fixed
end 


post '/people' do 
	if params[:birthdate].include?("-") 
		birthdate = params[:birthdate] 
	else 
		birthdate = Date.strptime(params[:birthdate], "%m%d%Y")
	end 

	person = Person.create(first_name: params[:first_name], last_name: params[:last_name], birthdate: birthdate) 
	redirect "/people/#{person.id}"  #fixed this, but delete redirect is now broken - deletes from database, but doesn't go back to a page
end 

get '/people/:id/edit' do 
	@person = Person.find(params[:id]) 
	erb :"/people/edit"
end 

put 'people/:id' do 
	person = Person.find(params[:id])
	person.first_name = params[:first_name] 
	person.last_name = params[:last_name] 
	person.birthdate = params[:birthdate] 
	person.save 
	redirect "/people/#{person.id}" #this redirect is not working. it's going to the correct url, but Sinatra doesn't know the ditty
end 

get '/people/:id' do 
	@person = Person.find(params[:id])
	birth_path_num = Person.get_birth_path_num(@person.birthdate.strftime("%m%d%Y"))
	@message = Person.path_message(birth_path_num)
	erb :"/people/show"
end

delete '/people/:id' do 
	person = Person.find(params[:id]) 
	person.delete 
	redirect "/people/"
end

#9/28/16 post and put routes not working, therefore cannot currently create or edit people. But delete works! Edit a person spec still failing. 
#9/29/16 @ 13:41 - post works, can create new people. Can delete them too. But cannot edit, and redirect from deleting and editing broken 

