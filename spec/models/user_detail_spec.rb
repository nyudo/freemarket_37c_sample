require 'rails_helper'

  describe UserDetail do
    describe '#complete' do
      it "is valid with family_name, first_name, kana_family_name, kana_first_name, birthday, prefecture, city, address, residential_name, phone_number, postal_code, profile" do
        user_detail = build(:user_detail)
        expect(user_detail).to be_valid
      end

      it "is invalid without family_name" do
        user_detail = build(:user_detail, family_name: nil)
        user_detail.valid?
        expect(user_detail.errors[:family_name]).to include("can't be blank")
      end

      it "is valid with family_name" do
        user_detail = build(:user_detail, family_name: "hoge")
        user_detail.valid?
        expect(user_detail).to be_valid
      end

      it "is invalid without first_name " do
        user_detail = build(:user_detail, first_name: nil)
        user_detail.valid?
        expect(user_detail.errors[:first_name]).to include("can't be blank")
      end

      it "is valid with first_name " do
        user_detail = build(:user_detail, first_name: "fuga")
        user_detail.valid?
        expect(user_detail).to be_valid
      end

      it "is invalid without kana_family_name" do
        user_detail = build(:user_detail, kana_family_name: nil)
        user_detail.valid?
        expect(user_detail.errors[:kana_family_name]).to include("can't be blank")
      end

      it "is valid with kana_family_name" do
        user_detail = build(:user_detail, kana_family_name: "hoge")
        user_detail.valid?
        expect(user_detail).to be_valid
      end

      it "is invalid without kana_first_name" do
        user_detail = build(:user_detail, kana_first_name: nil)
        user_detail.valid?
        expect(user_detail.errors[:kana_first_name]).to include("can't be blank")
      end

      it "is valid with kana_first_name" do
        user_detail = build(:user_detail, kana_first_name: "fuga")
        user_detail.valid?
        expect(user_detail).to be_valid
      end

      it "is invalid without birthday" do
        user_detail = build(:user_detail, birthday: nil)
        user_detail.valid?
        expect(user_detail.errors[:birthday]).to include("can't be blank")
      end

      it "is invalid birthday_date include stringss" do
        user_detail = build(:user_detail, birthday: "a.a-a/")
        user_detail.valid?
        expect(user_detail.errors[:birthday]).to include("can't be blank")
      end

      it "is invalid without prefecture" do
        user_detail = build(:user_detail, prefecture: nil)
        user_detail.valid?
        expect(user_detail.errors[:prefecture]).to include("can't be blank")
      end

      it "is valid with prefecture" do
        user_detail = build(:user_detail, prefecture: 4)
        expect(user_detail).to be_valid
      end

      it "is invalid without address" do
        user_detail = build(:user_detail, address: nil)
        user_detail.valid?
        expect(user_detail.errors[:address]).to include("can't be blank")
        end

        it "is valid with address" do
          user_detail = build(:user_detail, address: "稚内1-13")
          user_detail.valid?
          expect(user_detail).to be_valid
        end

        it "is valid without residential_name" do
          user_detail = build(:user_detail, residential_name: nil)
          user_detail.valid?
          expect(user_detail).to be_valid
        end

        it "is valid with residential_name" do
          user_detail = build(:user_detail, residential_name: "東京スカイツリー ６３４m")
          user_detail.valid?
          expect(user_detail).to be_valid
        end

        it "is invalid without phone_number" do
          user_detail = build(:user_detail, phone_number: nil)
          user_detail.valid?
          expect(user_detail.errors[:phone_number]).to include("can't be blank")
        end

        it "is invalid when phone_number include strings" do
          user_detail = build(:user_detail, phone_number: "090-1234-5678")
          user_detail.valid?
          expect(user_detail.errors[:phone_number]).to include("is invalid")
        end

        it "is invalid when phone_number lengths are under 10" do
          user_detail = build(:user_detail, phone_number: "123456789")
          user_detail.valid?
          expect(user_detail.errors[:phone_number]).to include("is invalid")
        end

        it "is invalid when phone_number lengths are over 11" do
          user_detail =build(:user_detail, phone_number: "0120123456789")
          user_detail.valid?
          expect(user_detail.errors[:phone_number]).to include("is invalid")
        end

        it "is valid when phone_number lengths are 10" do
          user_detail = build(:user_detail, phone_number: "0479688295")
          user_detail.valid?
          expect(user_detail).to be_valid
        end

        it "is valid when phone_number lengths are 11 " do
          user_detail = build(:user_detail, phone_number: "08098765432")
          user_detail.valid?
          expect(user_detail).to be_valid
        end

        it "is invalid without postal_code" do
          user_detail = build(:user_detail, postal_code: nil)
          user_detail.valid?
          expect(user_detail.errors[:postal_code]).to include("can't be blank")
        end

        it "is invalid when postal_code include strings" do
          user_detail = build(:user_detail, postal_code: "123-4567")
          user_detail.valid?
          expect(user_detail.errors[:postal_code]).to include("is invalid")
        end

        it "is invalid when postal_code lengths are under 6" do
          user_detail = build(:user_detail, postal_code: "123456")
          user_detail.valid?
          expect(user_detail.errors[:postal_code]).to include("is invalid")
        end

        it "is invalid when postal_code lengths are over 8" do
          user_detail = build(:user_detail, postal_code: "12345678")
          user_detail.valid?
          expect(user_detail.errors[:postal_code]).to include("is invalid")
        end

        it "is valid when postal_code lengths are 7" do
          user_detail = build(:user_detail, postal_code: "1234567")
          user_detail.valid?
          expect(user_detail).to be_valid
        end

        it "is invalid when profile lengths are over 100" do
          user_detail = build(:user_detail, profile: "あいう123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345abc")
          user_detail.valid?
          expect(user_detail.errors[:profile][0]).to include("is too long")
        end

        it "is valid without profile" do
          user_detail = build(:user_detail, profile: nil)
          user_detail.valid?
          expect(user_detail).to be_valid
        end

        it "is valid with profile" do
          user_detail = build(:user_detail, profile: "hoge")
          user_detail.valid?
          expect(user_detail).to be_valid
        end

        it "is valid without user_image" do
          user_detail = build(:user_detail, user_image: nil)
          user_detail.valid?
          expect(user_detail).to be_valid
        end

        it "is valid with user_image" do
          user_detail = build(:user_detail, user_image: "fugafuga.jpeg")
          user_detail.valid?
          expect(user_detail).to be_valid
        end
    end
  end
