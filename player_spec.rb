require 'rspec'
require 'json'
require_relative 'player'

describe 'Player' do

  before(:all) do
    json = File.read('game.json')
    @game_state = JSON.parse(json)
    @player = Player.new

  end

  describe 'bet_request' do

    it 'should return integer' do
      expect(@player.bet_request(@game_state).is_a? Integer).to be true
    end

  end



end