
class Player

  VERSION = "less stupid bet"

  def bet_request(game_state)
    first_high_card = high_card(game_state, 0)
    second_high_card = high_card(game_state, 1)

    if first_high_card or second_high_card
      game_state['players'][game_state['in_action']]['stack']/6
    else
      100
    end
  end

  def high_card(game_state, card)
    game_state['players'][game_state['in_action']]['hole_cards'][card]['rank'] if game_state['players'][game_state['in_action']]['hole_cards'][card]['rank'] == 'A' or game_state['players'][game_state['in_action']]['hole_cards'][card]['rank'] == 'Q' or game_state['players'][game_state['in_action']]['hole_cards'][card]['rank'] == 'K' or game_state['players'][game_state['in_action']]['hole_cards'][card]['rank'] == 'J'
  end

  def showdown(game_state)

  end
end
