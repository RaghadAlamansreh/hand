
def get_rank(card)
  return card[0, card.length - 1]
end

def get_sute(card)
  return card[-1]
end

def have_doublicated_cards(setSize, cardsSize, joker_occ)
  plus = 0
  if joker_occ
    plus = 1
  end

if setSize + plus == cardsSize
  return false
else
  return true
end
end

def is_joker(card)
  if card == "1j" || card == "2j"
    return true
  else
    return false
  end
end



def get_value rank
  case rank
  when "A"
    return 1
  when "J"
    return 11
  when "Q"
    return 12
  when "K"
    return 13
  else
    return rank
  end
end
