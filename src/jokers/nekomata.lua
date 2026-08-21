SMODS.Joker {
    key = 'nekomata',
    atlas = 'zzzchars',
    blueprint_compat = false,
    pos = {
        x = 3,
        y = 0
    },
    config = {
        extra = {
            dollars = 0
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function (self, info_queue, card)
        return {
            vars = {card.ability.extra.dollars
           }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if G.GAME.current_round.hands_left == 0 then
                if context.other_card == context.scoring_hand[table_length(context.scoring_hand)] then
                    local newdollars = context.other_card:get_chip_bonus()
                    return {
                        dollars = math.floor((newdollars) / 2),
                        delay = 0.5,
                        SMODS.destroy_cards(context.other_card)
                     
                }
            end
        end
    end
end
}