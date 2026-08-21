SMODS.Joker {
    key = 'anby',
    atlas = 'zzzchars',
    pos = {
        x = 2,
        y = 0
    },
    config = {
        extra = {
            mult = 0
        }
    },
    rarity = 1,
    cost = 4,
    loc_vars = function (self, info_queue, card)
        return {
            vars = {card.ability.extra.mult
           }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card == context.scoring_hand[table_length(context.scoring_hand)] then
            local newmult = G.GAME.current_round.hands_left + G.GAME.current_round.discards_left
            return {
                mult = newmult
            }
        end
    end
}