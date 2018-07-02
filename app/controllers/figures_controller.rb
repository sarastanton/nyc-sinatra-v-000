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
    binding.pry
    @figure = Figure.create(name: params[:figure][:name])

    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    else
      @figure.titles << Title.find_by(name: params[:figure][:title_ids])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    else
      @figure.landmarks << Landmark.find_by(name: params[:figure][:landmark_ids][])
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  #show action
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  #edit action
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/edit"
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

end
