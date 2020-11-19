# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :nickname, null: false                             #ニックネーム必須
      t.string :email, null: false, default: ""                   #メールアドレスは一意である、PC・ケータイどちらも可
      t.string :encrypted_password, null: false, default: ""                 #パスワードが必須、6文字以上、半角英数字、パスワードは確認用を含めて2回入力する
      t.string :first_name, null: false                             #ユーザー本名が、名字と名前でそれぞれ必須
      t.string :first_name_kana, null: false                        #ユーザー本名は全角で入力させる
      t.string :last_name, null: false                              #ユーザー本名のフリガナが、名字と名前でそれぞれ必須
      t.string :last_name_kana, null: false                         #ユーザー本名のフリガナは全角で入力させる
      t.date :birthday, null: false                                 #生年月日が必須

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
