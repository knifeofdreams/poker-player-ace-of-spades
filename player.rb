
class Player

  VERSION = "Ace!!!!"

  def bet_request(game_state)
    if game_state['players'][game_state['in_action']]['hole_cards'][0]['rank'] == 'A' or game_state['players'][game_state['in_action']]['hole_cards'][0]['rank'] == 'Q' or game_state['players'][game_state['in_action']]['hole_cards'][0]['rank'] == 'K' or game_state['players'][game_state['in_action']]['hole_cards'][0]['rank'] == 'J'
      return 150
    end


    100
  end

  def showdown(game_state)

  end
end
