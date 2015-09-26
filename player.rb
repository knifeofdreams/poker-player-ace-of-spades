
class Player

  VERSION = "my chance to shine"

  def bet_request(game_state)
    if face_card_in_hand?(game_state)
      if minimum_call_bet(game_state) > my_stack(game_state) / 6
        bet = minimum_call_bet(game_state) + (100 * rand()).floor
      elsif minimum_call_bet(game_state) > my_stack(game_state) / 2
        bet = minimum_call_bet(game_state)
      end
    else
      bet = (100 * rand()).floor
    end

    if bet < minimum_call_bet(game_state)
      return minimum_call_bet(game_state)
    end

    bet = 0 if random_fold?

    bet
  end

  def face_card_in_hand?(game_state)
    first_high_card = is_face_card?(game_state, 0)
    second_high_card = is_face_card?(game_state, 1)

     return (first_high_card or second_high_card)
  end

  def random_fold?
    rand() > 0.8
  end

  def my_stack(game_state)
    game_state['players'][2]['stack']
  end

  def is_face_card?(game_state, card)
    game_state['players'][game_state['in_action']]['hole_cards'][card]['rank'] == 'A' or game_state['players'][game_state['in_action']]['hole_cards'][card]['rank'] == 'Q' or game_state['players'][game_state['in_action']]['hole_cards'][card]['rank'] == 'K' or game_state['players'][game_state['in_action']]['hole_cards'][card]['rank'] == 'J'
  end

  def minimum_call_bet(game_state)
    game_state['current_buy_in'] - game_state['players'][game_state['in_action']]['bet']
  end

  def showdown(game_state)

  end
end
