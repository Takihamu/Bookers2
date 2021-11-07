class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true,length:{maximum:200}
  has_many :favorites, dependent: :destroy
  has_many :iines, dependent: :destroy
  def self.search_for(content, method)
    if method == 'perfect'
      Book.where(title: content)
    elsif method == 'forward'
      Book.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Book.where('title LIKE ?', '%'+content)
    else
      Book.where('title LIKE ?', '%'+content+'%')
    end
  end
end
