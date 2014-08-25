require 'spec_helper'

describe DeepDirty do
  subject do
    TestSubject.new
  end

  context "Without changes" do
    it "does not show changes" do
      expect(subject).not_to be_changed
    end
  end

  context "With explicit changes" do
    it 'reports model to be changed' do
      subject.name = 'new name'
      expect(subject).to be_changed
    end

    it 'reports attribute as changed' do
      subject.name = 'new name'
      expect(subject).to be_name_changed
    end

    it 'returns new value for attribute' do
      subject.name = 'New Name'
      expect(subject.name).to eq('New Name')
    end

    it 'returns old value for attribute' do
      subject.name = 'New Name'
      expect(subject.name_was).to eq('Test User')
    end
  end

  context "With implicit changes" do
    it 'reports model to be deep_changed' do
      subject.name.upcase!
      expect(subject).to be_deep_changed
    end

    it 'reports model to be changed after validation' do
      subject.name.upcase!
      # DeepDirty hooks into before_validation
      subject.validation
      expect(subject).to be_changed
    end

    it 'reports attribute as changed after validation' do
      subject.name.upcase!
      subject.validation
      expect(subject).to be_name_changed
    end

    it 'returns new value for attribute after validation' do
      subject.name.upcase!
      subject.validation
      expect(subject.name).to eq('TEST USER')
    end

    it 'returns old value for attribute after validation' do
      subject.name.upcase!
      subject.validation
      expect(subject.name_was).to eq('Test User')
    end
  end
end