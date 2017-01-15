json.array! @posts.each do |post|
  json.id post.id
  json.text post.text
  json.address post.address
  json.image post.image
  json.tags post.tags
  json.comments post.comments
end