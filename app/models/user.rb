class User < ApplicationRecord
  has_many :tests, class_name: 'Test', foreign_key: 'author_id'
end
