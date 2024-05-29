require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:user) { User.create!(email: "test@example.com", password: "password") }
  let(:valid_attributes) { { user: user, name: "Anything", description: "Lorem ipsum", price: 100 } }

  context "Validations" do
    it 'product is valid' do
      product = Product.new(valid_attributes)
      expect(product).to be_valid
    end

    it 'is not valid without a name' do
      product = Product.new(valid_attributes.except(:name))
      expect(product).to_not be_valid
    end

    it 'is not valid without a description' do
      product = Product.new(valid_attributes.except(:description))
      expect(product).to_not be_valid
    end

    it 'is not valid without a price' do
      product = Product.new(valid_attributes.except(:price))
      expect(product).to_not be_valid
    end

    it 'is not valid with a non-positive price' do
      product = Product.new(valid_attributes.merge(price: -1))
      expect(product).to_not be_valid

      product = Product.new(valid_attributes.merge(price: 0))
      expect(product).to_not be_valid
    end

    it 'is not valid without a user' do
      product = Product.new(valid_attributes.except(:user))
      expect(product).to_not be_valid
    end
  end

  context "Associations" do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end
end
