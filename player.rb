
class Player

  VERSION = "be more passive"

  def bet_request(game_state)
    first_high_card = is_high_card?(game_state, 0)
    second_high_card = is_high_card?(game_state, 1)

    if first_high_card or second_high_card
      game_state['players'][game_state['in_action']]['stack']/100.floor
    else
      100
    end
  end

  def is_high_card?(game_state, card)
    game_state['players'][game_state['in_action']]['hole_cards'][card]['rank'] == 'A' or game_state['players'][game_state['in_action']]['hole_cards'][card]['rank'] == 'Q' or game_state['players'][game_state['in_action']]['hole_cards'][card]['rank'] == 'K' or game_state['players'][game_state['in_action']]['hole_cards'][card]['rank'] == 'J'
  end

  def showdown(game_state)

  end
end
