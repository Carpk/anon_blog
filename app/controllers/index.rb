get '/' do
  @tags = Tag.all.each
  @posts = Post.all.each
  erb :index
end


get '/delete/:id' do
  Post.destroy(params[:id])
  redirect '/'
end

get '/edit/:id' do
  @post = Post.find_by_id(params[:id])
  erb :editpost
end