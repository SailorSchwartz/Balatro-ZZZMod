--region atlases
--1x is 71 x 95
--2x is 142 x 190

SMODS.Atlas {
    key = 'zzzchars',
    path = 'zzzchars.png',
    px = 142,
    py = 190
}


--endregion

--region file loading

local jokers_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers")
for _, file in ipairs(jokers_src) do
    assert(SMODS.load_file("src/jokers/" .. file))()
end
-- looks through joker folder and loads every file

--endregion