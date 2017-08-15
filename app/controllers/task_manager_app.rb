require_relative "../models/task.rb"

class TaskManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :dashboard
  end

  get '/tasks' do
    @tasks = Task.all
    @location = params[:location]
    erb :index
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    task = Task.new(params[:task])
    task.save
    redirect '/tasks'
  end

  get '/tasks/:id' do
    @task = Task.find(params[:id])
    erb :show
  end

  get '/easteregg' do
    erb :easteregg
  end

  get '/showmethetask' do
    redirect '/tasks'
  end

  get '/tasks/:id/edit' do
    @task = Task.find(params[:id])
    erb :edit
  end

end
