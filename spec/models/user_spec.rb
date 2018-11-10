require 'rails_helper'

  describe User do
    describe '#confirm' do
      it "is valid with nickname, email, password, and password_confirmation" do
        user = build(:user)
        expect(user).to be_valid
      end

      it "is that can be created account when nickname length under 10" do
        user = build(:user, nickname: "hoge")
        user.valid?
        expect(user).to be_valid
      end

      it "is invalid without nickname" do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end

      it "is invalid cannot be created account when nickname length is over 10" do
        user = build(:user, nickname:"あいうえおかきくけこさしすせそ")
        user.valid?
        expect(user.errors[:nickname][0]).to include("is too long")
      end

      it "is invalid without email" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "is that cannot be created account when email has not '@' " do
        user = build(:user, email: "hogehoge.gmail.com")
        user.valid?
        expect(user.errors[:email]).to include("is invalid")
      end

      it "is invalid without password" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "is that cannot be created account when password length is nder 6" do
        user = build(:user, password: "aaa")
        user.valid?
        expect(user.errors[:password][0]).to include("is too short")
      end

      it "is invalid password and password_confirmation unmatch" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
  end
end
