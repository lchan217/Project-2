class GoalsController < ApplicationController
  get '/goals/new' do
    @user = current_user
    erb :'/goals/new'
  end
  post '/goals' do
    @goal = Goal.create(params)
    @user = current_user
    @user.goals << @goal #is this needed??
    redirect "/goals/#{@goal.id}"
  end
  get '/goals/:id' do
    @goal = Goal.find(params[:id])
    erb :'/goals/show'
  end
  get '/goals/:id/edit' do
    @goal = Goal.find(params[:id])
    erb :'/goals/edit'
  end
  patch '/goals/:id' do
    @goal = Goal.find(params[:id])
    @city = params[:city]
    @country = params[:country]
    @attraction = params[:tourist_attraction]
    unless @country.empty? || @city.empty? || @attraction.empty?
      params.delete("_method")
      @goal.update(params)
      redirect "/goals/#{@goal.id}"
    else
      redirect "/goals/#{@goal[:id]}/edit"
    end
  end
  get '/goals/:id/delete' do
    "Deleting page"
  end
end
