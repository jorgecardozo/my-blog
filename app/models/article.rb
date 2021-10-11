class Article < ApplicationRecord
  belongs_to :author
  has_many :comment, dependent: :destroy
  validates :title, presence: { :message => "No puede ser vacio"}
  validates :content, presence: { :message => "No puede ser vacio"} , length: { minimum: 50, :message => "Demasiado corto" }
end
