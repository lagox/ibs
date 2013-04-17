# -*- encoding : utf-8 -*-
class Post < ActiveRecord::Base
  attr_accessible :title, :body, :author, :published_date

  validates :title, :body, :author, :published_date, presence: true
  
  
  default_scope order("created_at DESC")
  
  after_create :create_permalink
  
  def button_label
    new_record? ? "Добавить" : "Редактировать"
  end
  
  def set_permalink
    tmp_permalink = "#{self.id}-" + "#{self.title}".gsub(/[^a-zA-Z\p{Cyrillic}\d-]+/, "-")
  end
  
  def create_permalink
    self.update_attribute(:permalink, set_permalink)
  end
  
  def to_param
    "#{permalink}"
  end
  
end
