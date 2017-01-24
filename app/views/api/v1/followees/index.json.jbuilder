# json.array! @followees.each do |followee|
#   json.id followee.id
#   json.name followee.name
#   json.posts followee.posts.each do |post|
#     json.id post.id 
#     json.text post.text
#   end
# end

json.array! @posts.each do |post|
  json.id post.id 
  json.text post.text
  json.address post.address
  json.foodie_id post.foodie_id
  json.foodie post.foodie.name
end