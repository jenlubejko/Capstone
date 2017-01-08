json.array! @posts.each do |post|
  json.id post.id
  json.title post.title
  json.text post.text
  json.tags post.tags
end