require 'rails_helper'

describe ItemsController do
  describe 'Get #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
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
  end

  describe 'Get #show' do
    it 'assigns the requested contact to @item' do
      item = create(:item)
      get :show, params: { id: item }
      expect(assigns(:item)).to eq item
    end
    it "renders the :show template" do
      item = create(:item)
      get :show, params: { id: item }
      expect(response).to render_template :show
    end
  end

  describe 'Get #area' do
    it "render the :area template" do
      item = create(:item)
      get :area, params: { prefecture: item}
      expect(response).to render_template :area
    end
  end

  describe 'delete #delete'do
    it "item successfully deleted" do
      item = create(:item)
      expect{item.delete}.to change{Item.count}.by(-1)
      expect(item.delete).to be_truthy
    end
  end

  describe 'post #payjp'do

    it "pay.jp successfully worked" do

      allow(Payjp::Charge).to receive(:create).and_return(PayjpMock.prepare_valid_charge)
      Payjp::Charge.create
      item = create(:item)
      expect(item.buyer_id).to eq nil
      post :payjp,params: { id: item.user_id }
      expect(assigns(:item)).to eq item
      expect(assigns(:item).buyer_id).to eq 1
    end

  end

  describe 'GET #edit' do
    it "it successfully gets item info" do
      item = create(:item)
      get :show, params: {id: 1}
      expect(assigns :item).to eq item
    end

    it 'edit template is shown' do
      item = create(:item)
      get :edit, params: { id: 1 }
      expect(response).to render_template :edit
    end

    it 'item name is shown' do
      item = create(:item)
      get :edit, params: { id: 1 }
      expect(item[:item_name]).to include ('良い服')
    end

    it 'item description is shown' do
      item = create(:item)
      get :edit, params: { id: 1 }
      expect(item[:description]).to include ('良い服です。')
    end
  end

  describe 'PATCH #update' do
    it "is successfully updated" do
      item = create(:item)
      patch :update, params: {id: item, item: attributes_for(:item)}
      expect(assigns (:item)).to eq item
    end

    it "changes item's attributes" do
      item = create(:item)
      patch :update, params: {id: item, item: attributes_for(:item, item_name: "服", description: "服です。")}
      item.reload
      expect(item.item_name).to eq("服")
      expect(item.description).to eq("服です。")
    end

    it "redirects to users_listing_path" do
      item = create(:item)
      patch :update, params: {id: item, item: attributes_for(:item)}
      expect(response).to redirect_to users_listing_path
    end
  end

end

