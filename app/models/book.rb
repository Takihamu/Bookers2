class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true,length:{maximum:200}
  has_many :favorites, dependent: :destroy
  has_many :iines, dependent: :destroy
  def self.search(keyword)
    where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
  end
  def iined_by?(user)
    iines.where(usre_id: user.id).exists?
  end
end
