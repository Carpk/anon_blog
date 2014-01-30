get '/' do
  @tags = Tag.all.each
  @posts = Post.all.each
  erb :index
end

get '/create_post' do
  erb :createpost
end

get '/post/:id' do
  @post = Post.find_by_id(params[:id])
  erb :post
end

get '/tags/:tag_id' do
  @tagged = Tag.find_by_id(params[:tag_id]).posts
  erb :taglisted
end

post '/submit_post' do

  post = Post.new(title: params[:title],
                  body: params[:about])
  puts params

  if post.valid?

    post.save

    if params[:tags]

      tag_id = Tag.check_tag(params[:tags])

      tag_id.each do |each_id|
      PostTag.create(post_id: post.id,
                     tag_id: each_id)
      end
    end
  end
  redirect '/'
end
