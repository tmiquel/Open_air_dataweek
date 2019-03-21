require 'rails_helper'

RSpec.describe DatasetCollection, type: :model do
	before(:each) do
		@dataset_collection = FactoryBot.create(:dataset_collection)
	end
	
	context "validation" do
	
		it "is valid with valid attributes" do
			expect(@dataset_collection).to be_a(DatasetCollection)
			expect(@dataset_collection).to be_valid
		end

		describe "#user" do
			it "should not be valid without an user" do
				bad_dataset_collection = DatasetCollection.create(dataset: Dataset.all.sample)
				expect(bad_dataset_collection).not_to be_valid
				expect(bad_dataset_collection.errors.include?(:user)).to eq(true)
			end
		end

		describe "#dataset" do
			it "should not be valid without dataset" do
				bad_dataset_collection = DatasetCollection.create(user: User.all.sample)
				expect(bad_dataset_collection).not_to be_valid
				expect(bad_dataset_collection.errors.include?(:dataset)).to eq(true)
			end
		end

	end
	
	context "attachment" do
		
		describe "#dataset" do
			it "should belongs to a dataset" do
				expect(@dataset_collection.dataset).no_to be_nil
				expect(@dataset_collection.dataset).to be_a(Dataset)
			end
		end

		describe "#user" do
      it "should belongs to a topic" do  
        expect(@dataset_collection.user).no_to be_nil
        expect(@dataset_collection.user).to be_a(User)
      end
    end

	end

end

