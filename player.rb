
class Player

  VERSION = "carefulobot"

  def bet_request(game_state)

    if is_pair?(game_state)
      bet = game_state['players'][game_state['in_action']]['stack']/6.floor
    elsif face_card_in_hand?(game_state)
      bet = game_state['players'][game_state['in_action']]['stack']/8.floor
    else
      bet = (40 * rand()).floor
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
    rand() > 0.65
  end

  def if_two_pairs?(game_state)
    ranks = []

    ranks << game_state['players'][game_state['in_action']]['hole_cards'][0]['rank']
    ranks << game_state['players'][game_state['in_action']]['hole_cards'][1]['rank']

    game_state['community_cards'].each do | community_card |
      ranks << community_card['rank']
    end


  end

  def is_pair?(game_state)
    game_state['players'][game_state['in_action']]['hole_cards'][0]['rank'] == game_state['players'][game_state['in_action']]['hole_cards'][1]['rank']
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
