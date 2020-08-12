require 'rails_helper'

RSpec.describe 'teamモデルのテスト', type: :model do
	describe 'バリデーションのテスト' do
		let(:team) { build(:team) }
	    subject { test_team.valid? }
	    context 'nameカラム' do
				let(:test_team) { team }
			it '空欄でないこと' do
		    test_team.name = ''
		    is_expected.to eq false;
		  end
			it '20文字以下であること' do
				test_team.name = Faker::Lorem.characters(number:21)
				is_expected.to eq false;
			end
	  end

	  context 'categoryカラム' do
			let(:test_team) { team }
			it '空欄でないこと' do
				test_team.category = ''
				is_expected.to eq false
			end
		end
	end
end