SMODS.Joker {
    key = 'nicole',
    atlas = 'placeholders',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            xmult = 1.4
        }
    },
    rarity = 2,
    cost = 8,
    loc_vars = function (self, info_queue, card)
        return {
            vars = {card.ability.extra.xmult
           }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card == context.scoring_hand[table_length(context.scoring_hand)] then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}