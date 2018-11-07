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

end
