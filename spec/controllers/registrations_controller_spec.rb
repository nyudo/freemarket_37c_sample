require 'rails_helper'

describe Users::RegistrationsController do
       let(:user) { FactoryGirl.create(:user) }
       let(:user_detail) { FactoryGirl.create(:user_detail) }
  before do
     @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe 'POST #confirm' do
      before do
        @user = attributes_for(:user)
      end
      it"response success 200" do
        post :confirm, params: {user: @user}
        expect(response.status).to eq 200
      end

      it "save to DB" do
         expect{
          post :confirm, params: {user: @user}}.to change(User, :count).by(1)
      end

      it "move page confirm.html.haml" do
        post :confirm, params: {user: @user}
        expect(response).to render_template :confirm
      end
  end

  describe 'POST #complete' do
      before do
        @user_detail = attributes_for(:user_detail)
      end

      it"response success 200" do
        post :complete, params: {user_detail: @user_detail}
        expect(response.status).to eq 200
      end

      it "save to DB" do
         expect{
          post :complete, params: {user_detail: @user_detail}}.to change(UserDetail, :count).by(1)
      end

      it 'render complete' do
        post :complete, params: {user_detail: @user_detail}
        expect(response).to render_template :complete
      end
  end
end
