
class Player

  VERSION = "High card for real"

  def bet_request(game_state)
    if game_state['players'][game_state['in_action']]['hole_cards'][0]['rank'] == 'A' or game_state['players'][game_state['in_action']]['hole_cards'][0]['rank'] == 'Q' or game_state['players'][game_state['in_action']]['hole_cards'][0]['rank'] == 'K' or game_state['players'][game_state['in_action']]['hole_cards'][0]['rank'] == 'J'
      @one_high_card = game_state['players'][game_state['in_action']]['hole_cards'][0]['rank']
    end

    if game_state['players'][game_state['in_action']]['hole_cards'][1]['rank'] == 'A' or game_state['players'][game_state['in_action']]['hole_cards'][1]['rank'] == 'Q' or game_state['players'][game_state['in_action']]['hole_cards'][1]['rank'] == 'K' or game_state['players'][game_state['in_action']]['hole_cards'][1]['rank'] == 'J'
      @other_high_card = game_state['players'][game_state['in_action']]['hole_cards'][1]['rank']
    end
    if @one_high_card or @other_high_card
      return 200
    end
    100
  end

  def showdown(game_state)

  end
end
