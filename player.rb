
class Player

  VERSION = "randombot"

  def bet_request(game_state)
    first_high_card = is_high_card?(game_state, 0)
    second_high_card = is_high_card?(game_state, 1)

    bet = 0
    if first_high_card or second_high_card
      bet = game_state['players'][game_state['in_action']]['stack']/6.floor
    else
      bet = 100
    end

    if bet < minimum_call_bet(game_state)
      return minimum_call_bet(game_state)
    end

    if rand() > 0.8
      bet = 0
    end

    bet
  end

  def is_high_card?(game_state, card)
    game_state['players'][game_state['in_action']]['hole_cards'][card]['rank'] == 'A' or game_state['players'][game_state['in_action']]['hole_cards'][card]['rank'] == 'Q' or game_state['players'][game_state['in_action']]['hole_cards'][card]['rank'] == 'K' or game_state['players'][game_state['in_action']]['hole_cards'][card]['rank'] == 'J'
  end

  def minimum_call_bet(game_state)
    game_state['current_buy_in'] - game_state['players'][game_state['in_action']]['bet']
  end

  def showdown(game_state)

  end
end
