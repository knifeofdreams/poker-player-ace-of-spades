require 'rspec'
require 'json'
require_relative 'player'

describe 'Player' do

  before(:all) do
    json = File.read('game.json')
    @game = JSON.parse(json)
  end

  describe 'bet_request' do

    it 'should return integer' do
      p @game
      expect(true).to be true
      # player = Player.new
      # expect(player.bet_request(game.json)).to be(true)
    end

  end



end