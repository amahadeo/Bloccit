require 'faker'

#Create Posts
50.times do 
  Post.create!(
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
    )
  end

posts = Post.all

if !posts.any? {|post| post.title == "Special Post"}
  Post.create(title: "Special Post", body: "Special body for the special post!")
end
  

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
  end
  
comments = Comment.all

if !comments.any? {|comment| comment.body == "Special comment is written here!"}
  Comment.create(post: posts.sample, body: "Special comment is written here!")
end

  
puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
  