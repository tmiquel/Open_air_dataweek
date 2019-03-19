require 'rails_helper'

RSpec.describe Dataset, type: :model do
	before(:each) do
    @dataset = FactoryBot.create(:dataset)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@dataset).to be_a(Dataset)
      expect(@dataset).to be_valid
    end

    describe "#title" do
      it "should not be valid without title" do
        bad_dataset = Dataset.create(topic: Topic.all.sample, db_link: "https://some_url.open_air", description: "Some description here", dpsir_category: "driver")
        expect(bad_dataset).not_to be_valid
        expect(bad_dataset.errors.include?(:title)).to eq(true)
      end
    end
		
		describe "#topic" do
      it "should not be valid without topic" do
        bad_dataset = Dataset.create(title: "Activité maritime Marseille/Fos", db_link: "https://some_url.open_air", description: "Some description here", dpsir_category: "driver")
        expect(bad_dataset).not_to be_valid
        expect(bad_dataset.errors.include?(:topic)).to eq(true)
      end
    end

		describe "#description" do
      it "should not be valid without description" do
        bad_dataset = Dataset.create(title: "Activité maritime Marseille/Fos", topic: Topic.all.sample, db_link: "https://some_url.open_air", dpsir_category: "driver")
        expect(bad_dataset).not_to be_valid
        expect(bad_dataset.errors.include?(:description)).to eq(true)
      end
    end

		describe "#dpsir_category" do
      it "should not be valid without dpsir_category" do
        bad_dataset = Dataset.create(title: "Activité maritime Marseille/Fos", topic: Topic.all.sample, db_link: "https://some_url.open_air", description: "Some description here")
        expect(bad_dataset).not_to be_valid
        expect(bad_dataset.errors.include?(:dpsir_category)).to eq(true)
      end
    end

		describe "#db_link" do
      it "should not be valid without db_link" do
        bad_dataset = Dataset.create(title: "Activité maritime Marseille/Fos", topic: Topic.all.sample, description: "Some description here", dpsir_category: "driver")
        expect(bad_dataset).not_to be_valid
        expect(bad_dataset.errors.include?(:db_link)).to eq(true)
      end
    end

	end

	context "attachment" do
		
		describe "#topic" do
			it "should belongs to a topic" do
				expect(@dataset.topic).no_to be_nil
				expect(@dataset.topic).to be_a(Topic)
			end
		end

	end

end


