
# Show me all posts with a given tag
get '/tags/:tag_id' do
  @tagged = Tag.find_by_id(params[:tag_id]).posts
  erb :taglisted
end

