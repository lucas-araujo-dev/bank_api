# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  subject { build(:account) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_uniqueness_of(:number) }
    it { is_expected.to validate_presence_of(:balance) }
    it { is_expected.to validate_numericality_of(:balance).is_greater_than_or_equal_to(0) }
  end

  describe 'account create' do
    before { subject.save }

    it { is_expected.to be_persisted }
  end
end
