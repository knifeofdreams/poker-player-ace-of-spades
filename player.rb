
class Player

  VERSION = "ShyAggressiveBot"

  def bet_request(game_state)
    @bet = 0

    if game_state['community_cards'].length == 0
      if game_state['players'][game_state['in_action']]['hole_cards'][0]['rank'] == game_state['players'][game_state['in_action']]['hole_cards'][1]['rank']
        # @bet = game_state['players'][game_state['in_action']]['stack']/5.floor
        @bet = game_state['players'][game_state['in_action']]['stack']/3.floor
      elsif face_card_in_hand?(game_state)
        if game_state['players'][game_state['in_action']]['stack']/8.floor > 80
          @bet = 80
        else
          @bet = game_state['players'][game_state['in_action']]['stack']/8.floor
        end
      else
        if game_state['players'][game_state['in_action']]['stack'] < 1000
          return 0
        end
      end
    else
      if if_two_pairs?(game_state)
        @bet = game_state['players'][game_state['in_action']]['stack']
      elsif is_pair?(game_state)
        @bet = game_state['players'][game_state['in_action']]['stack']/6.floor
      elsif face_card_in_hand?(game_state)
        @bet = game_state['players'][game_state['in_action']]['stack']/8.floor
      else
        if game_state['players'][game_state['in_action']]['stack'] < 1000
          return 0
        else
          @bet = (80 * rand()).floor
        end

        if game_state['players'][game_state['in_action']]['bet'] > 199 and @bet < minimum_call_bet(game_state)
          return minimum_call_bet(game_state)
        end

        @bet = 0 if random_fold?
      end
    end

    @bet
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
    ranks = get_ranks(game_state)
    occurrences = get_occurrences_of(ranks)
    no_of_pairs = 0

    occurrences.each do |key, value |
      if value == 2
        no_of_pairs += 1
      end
    end

    no_of_pairs == 2

  end

  def get_occurrences_of(ranks)
    occurrences = {}
    ranks.each { |rank|
      if occurrences.has_key?(rank)
        occurrences[rank] += 1
      else
        occurrences[rank] = 1
      end
    }
    occurrences
  end

  def get_ranks(game_state)
    ranks = []

    ranks << game_state['players'][game_state['in_action']]['hole_cards'][0]['rank']
    ranks << game_state['players'][game_state['in_action']]['hole_cards'][1]['rank']

    game_state['community_cards'].each { |community_card|
      ranks << community_card['rank']
    }
    ranks
  end

  def is_pair?(game_state)
    ranks = get_ranks(game_state)
    occurrences = get_occurrences_of(ranks)

    occurrences[game_state['players'][game_state['in_action']]['hole_cards'][0]['rank']] == 2 or occurrences[game_state['players'][game_state['in_action']]['hole_cards'][1]['rank']] == 2
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
