class FiguresController < ApplicationController

  #index action
  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  #new action
  get '/figures/new' do
    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/new"
  end

  post '/figures' do
    @figure = Figure.create(name: params[:name])
    redirect to "/figures/#{@figure.id}"
    binding.pry
  end

  #show action
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  #edit action
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end

  patch '/figures' do
    @figure = Figure.find(params[:id])
    @figure.name = params[:name]
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end



end
