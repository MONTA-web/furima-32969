class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable,:validatable

    has_many :items
    has_many :orders

    validates :password,format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "Include both letters and numbers"}
  with_options presence: true do
    validates :nickname
    validates :first_name,format: { with: /\A[ぁ-んァ-ン一-龥]/,message: "Full-width characters"}
    validates :last_name,format: { with: /\A[ぁ-んァ-ン一-龥]/,message: "Full-width characters"}
    validates :first_name_kana,format: { with: /\A[ァ-ヶー－]+\z/,message: "Full-width katakana characters"}
    validates :last_name_kana,format: { with: /\A[ァ-ヶー－]+\z/,message: "Full-width katakana characters"}
    validates :birth_date
  end
end
