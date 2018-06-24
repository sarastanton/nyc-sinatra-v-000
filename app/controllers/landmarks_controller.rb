class LandmarksController < ApplicationController


    #index action
    get '/landmarks' do
      @landmarks = Landmark.all
      erb :"/landmarks/index"
    end

    #new action
    get '/landmarks/new' do
      @landmarks = Landmark.all
      erb :"/landmarks/new"
    end

    post '/landmarks' do
      @landmark = Landmark.create(name: params[:name])
      redirect to "/landmarks/#{@landmark.id}"
    end

    #show action
    get '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])
      erb :"landmarks/show"
    end

    #edit action
    get '/landmarks/:id/edit' do
      @landmark = Landmarks.find(params[:id])
      erb :edit
    end

    patch '/landmarks' do
      @landmark = Landmark.find(params[:id])
      @landmark.name = params[:name]
      @landmark.save
      redirect to "/landmarks/#{@landmark.id}"
    end

end
