# frozen_string_literal: true

RSpec.describe BurnerEmailDB do
  it "has a version number" do
    expect(BurnerEmailDB::VERSION).not_to be nil
  end

  describe ".domains" do
    subject { described_class.domains }
    let(:random_record) { subject.sample }

    it "returns an Array" do
      expect(subject).to be_an Array
    end

    it "contains multiple records" do
      expect(subject.size).to be > 1
    end

    it "records are strings" do
      subject.each do |record|
        expect(record).to be_a String
      end
    end

    it "records have no new line symbols at the end" do
      subject.each do |record|
        expect(record).not_to include "\n"
      end
    end

    it "records have white spaces" do
      subject.each do |record|
        expect(record).not_to include "\s"
      end
    end

  end
end
