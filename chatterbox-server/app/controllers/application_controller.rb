class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/messages' do 
    messages = Message.all
    messages.order(:created_at).to_json
  end

  post '/messages' do 
    new_message = Message.create(
      "body": params[:body],
      "username": params[:username]
    )
    new_message.to_json
  end

  delete '/messages/:id' do
    target = Message.find(params[:id])
    target.destroy
    target.to_json
  end

  patch '/messages/:id' do 
    message = Message.find(params[:id])
    message.update(body: params[:body])
    message.to_json
  end
  
end
