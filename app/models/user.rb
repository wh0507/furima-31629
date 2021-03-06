class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: false }
    validates :birthday
    validates :email,    uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'を文字と数字の両方を含めて入力してください' }

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/i, message: '(全角)を入力してくだい' } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ン一]+\z/i, message: '(全角)を入力してくだい' } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end

  has_many :items,   dependent: :destroy
  has_many :orders,  dependent: :destroy
end
