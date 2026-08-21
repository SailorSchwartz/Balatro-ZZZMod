SMODS.Joker {
    key = 'billy',
    atlas = 'zzzchars',
    pos = {
        x = 1,
        y = 0
    },
    config = {
        extra = {
            mult = 11,
        }
    },
    rarity = 1,
    cost = 5,
    loc_vars = function (self, info_queue, card)
        return {
            vars = {card.ability.extra.mult, card.ability.extra.chips
           }
        }
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 14 then
                if not context.other_card.ace_chips_cancelled then
                    context.other_card.ace_chips_cancelled = true
                        local ace_chips = context.other_card:get_chip_bonus() or 0
                        if ace_chips ~= 0 then
                            return {
                                mult = ace_chips,
                                chips = -ace_chips
                            }
                        end
                    else
                        local ace_chips = context.other_card:get_chip_bonus() or 0
                        if ace_chips ~= 0 then
                            return {
                                mult = ace_chips,
                            }
                        end                        
                    end
                end
            end
            if context.end_of_round or context.game_over then
                for _, c in ipairs(G.playing_cards) do
                    c.ace_chips_cancelled = nil
                end
            end
        end
}

--played aces give mult instead of chips