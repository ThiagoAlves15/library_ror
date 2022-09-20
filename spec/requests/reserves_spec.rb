require 'rails_helper'

RSpec.describe "/reserves", type: :request do
  let(:book) { create(:book) }
  let(:user) { create(:user) }

  let(:valid_attributes) {
    {
      book_id: book.id,
      user_id: user.id,
      reserve_date: Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
      devolution_date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 3),
    }
  }

  let(:invalid_attributes) {
    {
      book: nil,
      user: nil,
      reserve_date: nil,
      devolution_date: nil,
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Reserve.create! valid_attributes
      get reserves_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      reserve = Reserve.create! valid_attributes
      get reserve_url(reserve)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_reserve_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      reserve = Reserve.create! valid_attributes
      get edit_reserve_url(reserve)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Reserve" do
        expect {
          post reserves_url, params: { reserve: valid_attributes }
        }.to change(Reserve, :count).by(1)
      end

      it "redirects to the created reserve" do
        post reserves_url, params: { reserve: valid_attributes }
        expect(response).to redirect_to(reserve_url(Reserve.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Reserve" do
        expect {
          post reserves_url, params: { reserve: invalid_attributes }
        }.to change(Reserve, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post reserves_url, params: { reserve: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested reserve" do
        reserve = Reserve.create! valid_attributes
        patch reserve_url(reserve), params: { reserve: new_attributes }
        reserve.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the reserve" do
        reserve = Reserve.create! valid_attributes
        patch reserve_url(reserve), params: { reserve: new_attributes }
        reserve.reload
        expect(response).to redirect_to(reserve_url(reserve))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        reserve = Reserve.create! valid_attributes
        patch reserve_url(reserve), params: { reserve: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested reserve" do
      reserve = Reserve.create! valid_attributes
      expect {
        delete reserve_url(reserve)
      }.to change(Reserve, :count).by(-1)
    end

    it "redirects to the reserves list" do
      reserve = Reserve.create! valid_attributes
      delete reserve_url(reserve)
      expect(response).to redirect_to(reserves_url)
    end
  end
end
