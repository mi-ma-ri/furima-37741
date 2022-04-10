class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
         has_many :orders

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
    validates :last_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
end
