class Article < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 5, too_short: "%{count}文字以上を入力してください", maximum: 100, too_long: "最大%{count}文字未満で入力してください" }
  validates :text, presence: true,
                    length: { maximum: 20000 }
  def self.search(search)
    if search
      where(['text LIKE ? or title LIKE ?', "%#{search}%", "%#{search}%"])
    else
      all
    end
  end
end