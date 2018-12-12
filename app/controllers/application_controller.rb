class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  #index
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #new
  get '/recipes/new' do
    erb :new
  end

  #create

  post '/recipes' do
    recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{recipe.id}"
  end

  #show
  get '/recipes/:id' do
    @recipes = Recipe.find(params[:id])
    erb :show
  end

  #edit
  get '/recipes/:id/edit' do
    @recipes_all = Recipe.all
    @recipes = @recipes_all.find(params[:id])
    erb :edit
  end
  #update
  patch "/recipes/:id" do
    @recipes_all = Recipe.all
    @recipes = @recipes_all.find(params[:id])
    @recipes.update(name: params[:recipe][name], ingredients: params[:recipe][ingredients], cook_time: params[:recipe][cook_time])
    redirect "/recipes/#{recipe.id}"
  end

  #destroy
  delete '/recipes/:id' do
    @recipes = Recipe.find(params[:id])
    @recipes.delete
    redirect "/recipes"
  end

end
