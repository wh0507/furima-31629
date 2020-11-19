class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        with_options presence: true do

          validates :nickname, uniqueness: {case_sensitive: false}
          validates :birthday  
          validates :email,    uniqueness: {case_sensitive: false},
                               format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]/i}
          validates :password, length: {minimum: 6}, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])/, message: "Include both letters and numbers"} 

          with_options format: {with: /\A[ぁ-んァ-ン一-龥]+\z/ } do 
            validates :last_name
            validates :first_name
          end

          with_options format: {with: /\A[ァ-ン一]+\z/, message: "Full-width katakana characters" } do
            validates :last_name_kana
            validates :first_name_kana
          end

        end
        
        has_many :items,   dependent: :destroy
        has_many :orders,  dependent: :destroy
      
end
