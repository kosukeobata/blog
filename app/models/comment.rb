class Comment < ApplicationRecord
  belongs_to :article
  validates :commenter, presence: true,
                     length: { maximum: 24 }

  validates :body, presence: true,
                     length: { maximum: 1000 }
end
