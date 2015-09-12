class User
  @@current_id = 1
  $users = Hash.new
  attr_accessor :name, :email, :posts
  def self.create(name, email)
    $users[@@current_id] = User.new(name, email) 
    @@current_id = @@current_id + 1
    puts "User created"
  end
  
  def initialize(name, email)
    @name = name
    @email = email
    @posts = Array.new
  end
  
  def self.find(id)
    $users[id]
  end
  
  def self.last
    index_to_examine = @@current_id-1
    while $users[index_to_examine] == nil
      index_to_examine = index_to_examine - 1
    end
    desired_user = $users[index_to_examine]
    desired_user.name + " " + desired_user.email
  end
  
  def self.destroy(id)
    $users.delete(id)
    puts "User destroyed"
  end
  
end
  
  class Post
    @@current_id = 1
    @@posts = Hash.new
    def self.create(content, user_id)
      @@posts[@@current_id] = content
      @@current_id = @@current_id + 1
      desired_user = User.find(user_id)
      desired_user.posts.push(content)
      puts "Post created"
    end
  
    def self.find(id)
      @@posts[id]
    end
  
    def self.last
      index_to_examine = @@current_id-1
      while @@posts[index_to_examine] == nil
        index_to_examine = index_to_examine - 1
      end
      @@posts[index_to_examine]
    end
  
    def self.destroy(id)
      post_to_be_deleted = find(id)
      @@posts.delete(id)
      $users.each do |id, user|
        user.posts.delete(post_to_be_deleted)
      end
      puts "Post destroyed"
    end
  end

while t = gets
  if t != "quit"
    eval t
  else
    exit
  end
end