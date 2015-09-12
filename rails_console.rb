class Post
  @@current_id = 1
  @@posts = Hash.new
  def self.create(content)
    @@posts[@@current_id] = content
    @@current_id = @@current_id + 1
    puts "Post created"
  end
  
  def self.find(id)
    @@posts[id]
  end
  
  def self.last
    @@posts[@@current_id-1]
  end
end

while t = gets
  if t != "quit"
    eval t
  else
    exit
  end
end