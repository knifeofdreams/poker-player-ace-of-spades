
class Player

  VERSION = "High card"

  (ONE_HIGH_CARD = game_state['players'][game_state['in_action']]['hole_cards'][0]['rank'] == 'A') or game_state['players'][game_state['in_action']]['hole_cards'][0]['rank'] == 'Q' or game_state['players'][game_state['in_action']]['hole_cards'][0]['rank'] == 'K' or game_state['players'][game_state['in_action']]['hole_cards'][0]['rank'] == 'J'
  (OTHER_HIGH_CARD = game_state['players'][game_state['in_action']]['hole_cards'][1]['rank'] == 'A') or game_state['players'][game_state['in_action']]['hole_cards'][1]['rank'] == 'Q' or game_state['players'][game_state['in_action']]['hole_cards'][1]['rank'] == 'K' or game_state['players'][game_state['in_action']]['hole_cards'][1]['rank'] == 'J'

  def bet_request(game_state)
    if ONE_HIGH_CARD or OTHER_HIGH_CARD
      return 200
    end
    100
  end

  def showdown(game_state)

  end
end
