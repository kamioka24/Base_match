require 'rails_helper'

RSpec.describe Player, type: :model do
  context '正しく保存される' do
  	before do
  		@player = Player.new
  		@player.name = "野球太郎"
  		@player.prefecture_code = 11
  		@player.email = "player@example.com"
  		@player.password = 111111
  		@player.save
  	end
		it "全て入力してあるので保存される" do
      expect(@player).to be_valid
	  end
  end
end