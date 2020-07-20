require 'rails_helper'
describe User do
  describe '#create' do
    it "名前とメールアドレスとパスワードとパスワード確認があれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "名前がないと登録できないこと" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
    it "名前が13文字以上だと登録できないこと" do
      user = build(:user, name: "あああああああああああああ") 
      user.valid?
      expect(user.errors[:name]).to include("は12文字以内で入力してください")
    end
    it "名前が12文字以下なら登録できること" do
      user = build(:user, name: "ああああああああああああ")
      expect(user).to be_valid
    end
    it "メールアドレスがないと登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "メールアドレスが重複した場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
    it "パスワードがないと登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "パスワードが8文字未満だと登録できないこと" do
      user = build(:user, password: "asdedc")
      user.valid?
      expect(user.errors[:password]).to include("は8文字以上で入力してください")
    end
    it "パスワードが8文字以上で登録できること"do
      user = build(:user, password: "asdede34", password_confirmation: "asdede34")
      expect(user).to be_valid
    end
    it "パスワードがあってもパスワード確認がなければ登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end


  end
end
