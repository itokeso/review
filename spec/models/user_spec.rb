# require 'rails_helper'
# describe User do
#   describe '#create' do
#     it "名前がないと登録できないこと" do
#       user = User.new(name: nil, email: "itou@gmail.com", password:"00000000", password_confirmation: "00000000")
#       user.valid?
#       expect(user.errors[:name]).to include("を入力してください")
#     end
#     it "メールアドレスがないと登録できないこと" do
#       user = User.new(name: "伊藤", email: nil, password:"00000000", password_confirmation: "00000000")
#       user.valid?
#       expect(user.errors[:email]).to include("を入力してください")
#     end
#   end
# end
