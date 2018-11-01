require 'rails_helper'

describe ItemsController do

  describe 'Get #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
      # item = build(:item)
      # post :create,item: item

    end
  end

  describe 'POST #create' do

    it 'item successfully saved' do
        item = build(:item)
        expect{item.save}.to change{Item.count}.by(1)
        expect(item.save).to be_truthy
    end

    it 'item not successfully saved' do
        item = Item.new
        expect(item.save).to be_falsey
    end

      # it 'saves the new message in the database' do
      #   expect{post :create, params}.to change(Message, :count).by(1)
      # end

      # it 'redirects to messages#index' do
      #   post :create, params
      #   expect(response).to redirect_to group_messages_path
      # end
  end

end
