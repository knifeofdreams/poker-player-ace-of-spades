require 'rspec'
require 'json'
require_relative 'player_spec'
# require_relative 'game.json'

game = JSON.parse(IO.read(game.json))

describe 'Test bet' do

  it 'should return integer' do
    player = Player.new
    p game
    # expect(player.bet_request(game.json)).to be(true)
  end
end