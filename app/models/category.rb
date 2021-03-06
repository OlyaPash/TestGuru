class Category < ApplicationRecord
  default_scope { order(:title) }
  
  has_many :tests, dependent: :destroy

  validates :title, presence: true

  def title_translated
    I18n.t(title, scope: 'categories')
  end
end
