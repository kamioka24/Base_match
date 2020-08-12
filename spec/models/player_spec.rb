require 'rails_helper'

RSpec.describe Player, type: :model do
	describe 'バリデーションのテスト' do
		let(:player) { build(:player) }
	  subject { test_player.valid? }
	  context 'nameカラム' do
			let(:test_player) { player }
			it '空欄でないこと' do
		        test_player.name = ''
		        is_expected.to eq false;
		  end
			it '15文字以下であること' do
				test_player.name = Faker::Lorem.characters(number:16)
				is_expected.to eq false;
			end
	  end

	  context 'prefecture_codeカラム' do
			let(:test_player) { player }
			it '空欄でないこと' do
				test_player.prefecture_code = ''
				is_expected.to eq false
			end
		end
	end
end
