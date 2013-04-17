# encoding:utf-8
class AddPermalink < ActiveRecord::Migration
  
  def up
    add_column :posts, :permalink, :string    
    Post.reset_column_information
    posts = Post.all
     
    posts.each do |post|
      permalink_for_post = "#{post.id}-" + post.title.gsub(/[^a-zA-Z\p{Cyrillic}\d-]+/, "-")
      post.permalink = permalink_for_post
      post.save
    end
  end
  
  def down
    remove_column(:posts, :permalink)
    puts "Ok!"
  end


end
