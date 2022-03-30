class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'パスワードには英字と数字の両方を含めて設定してください' 
    validates :nickname, presence: true
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday, presence: true
  end
end
