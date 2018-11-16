require 'rails_helper'

  describe User do
      it "is valid with nickname, email, password, and password_confirmation" do
        user = build(:user)
        expect(user).to be_valid
      end

      it "is that can be created account when nickname length under 10" do
        user = build(:user, nickname: "hoge")
        user.valid?
        expect(user).to be_valid
      end

      it "invalid without nickname" do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end

      it "invalid cannot be created account when nickname length is over 10" do
        user = build(:user, nickname:"あいうえおかきくけこさしすせそ")
        user.valid?
        expect(user.errors[:nickname][0]).to include("文字以内で入力してください")
      end

      it "invalid without email" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it "is that cannot be created account when email has not '@' " do
        user = build(:user, email: "hogehoge.gmail.com")
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end

      it "invalid without password" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end

      it "is that cannot be created account when password length is nder 6" do
        user = build(:user, password: "aaa")
        user.valid?
        expect(user.errors[:password][0]).to include("文字以上で入力してください")
      end

      it "invalid password and password_confirmation unmatch" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
  end
