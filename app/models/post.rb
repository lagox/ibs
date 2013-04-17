# -*- encoding : utf-8 -*-
class Post < ActiveRecord::Base
  attr_accessible :title, :body, :author, :published_date

  validates :title, :body, :author, :published_date, presence: true
  
  
  default_scope order("created_at DESC")
  
  def button_label
    new_record? ? "Добавить" : "Редактировать"
  end
  
end
