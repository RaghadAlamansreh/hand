require_relative 'double_linked_list.rb'
require_relative 'validate.rb'
require 'set'

############ Logic start ############
# Firstly i will check the early exit points:
# 1- if the cards array size less than 3
# 2- if the cards array size more than 13
# 3- if the cards array has doublicated cards
# 4- if the cards array has more than one joker
# Secondly i will determine if the nzool is same rank nzool or sequential group nzool
# and check the cards
############ Logic End ############

def valid_group(cards)
  puts validate(cards)
end

def validate(cards)
  if cards.length() > 13 || cards.length() < 3
    return false
  end

  return check_cards(cards)
end

def check_cards(cards)

  suites = Set.new
  ranks = Set.new

  joker_occ = false
  joker_index = -1

cards.each_with_index do |card, index|
  if is_joker card
    if joker_occ
      return false
    else
      joker_occ = true
      joker_index = index
      next
    end
  end
  suites << get_sute(card)
  ranks << get_rank(card)
end

if suites.size == 1
	if !have_doublicated_cards(ranks.size(), cards.length, joker_occ)
				return sequential_group(joker_index, cards)
  end
elsif (ranks.size == 1)
			if !have_doublicated_cards(suites.size, cards.length, joker_occ)
				return same_rank(cards)
      end
end
		return false;
end

def same_rank(cards)
suites = Set.new
suites << "h"
suites << "s"
suites << "c"
suites << "d"

cards.each do |card|
if is_joker card
  next
end

  suit = get_sute card
  if suites.include? suit
    suites.delete suit
 else
   return false
 end
end

		return true;
end

def sequential_group(joker_index, cards)
  double_linked_list = DoubleLinkedList.new
  init_cart(double_linked_list)

  asc = false

if joker_index > -1
  case joker_index
  when 0
    if get_value(get_rank(cards[1])).to_i < get_value(get_rank(cards[2])).to_i
      asc = true
    end
  when 1
    if get_value(get_rank(cards[0])).to_i < get_value(get_rank(cards[2])).to_i
      asc = true
    end
  when 2
    if get_value(get_rank(cards[0])).to_i < get_value(get_rank(cards[1])).to_i
      asc = true
    end
  end
else
  if get_value(get_rank(cards[0])).to_i < get_value(get_rank(cards[1])).to_i
     asc = true
   end
end

  if !is_joker cards[0]
    head = double_linked_list.find_element get_rank(cards[0])
  else
    head = double_linked_list.find_element get_rank(cards[1])
    if asc
      head = head.prev
    else
      head = head.next
    end
  end

cards.each do |card|
if is_joker card
  if asc
    head = head.next
  else
    head = head.prev
  end
  next
end

if head != nil && get_rank(card).to_s == head.element.to_s
  if asc
    head = head.next
  else
      head = head.prev
  end
else
  return false
end

end

return true
end

		valid_group(["3h", "3c", "3s"])
		valid_group(["Ah", "Ac", "As"])
		valid_group(["4h", "4c", "4s", "4d"])
		valid_group(["5h", "5d", "5d", "5s"])
		valid_group(["5h", "5c", "5d", "5s", "5c"])
		valid_group(["2h", "3h"])
		valid_group(["3h", "1j", "3c"])
		valid_group(["1j", "4h", "4s"])
		valid_group(["1j", "2j", "6h"])
		valid_group(["3h", "1j", "3c"])
		valid_group(["3h", "1j", "3h"])


    valid_group(["Qh", "Kh", "1j"])
		valid_group(["2j", "2h", "3h"])
		valid_group(["2j", "3h", "5h"])
		valid_group(["3h", "4h", "5h", "6h", "7h"])
		valid_group(["5h", "4h", "3h"])
		valid_group(["Qd", "Kd", "Ad"])
		valid_group(["Ac", "2c", "3c"])
		valid_group(["3c", "2c", "Ac"])
		valid_group(["5h", "7h", "6h"])
		valid_group(["5h", "7h", "8h"])
		valid_group(["Kh", "Ah", "2h"])

		valid_group(["10h", "Jh", "Qh", "Kh"])
		valid_group(["3h", "3c", "3s"])
