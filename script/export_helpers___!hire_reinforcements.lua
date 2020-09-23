-- luacheck: globals core cm effect out
-- luacheck: globals find_uicomponent UIComponent Util Button TextButton FlowLayout Container ListView Frame
-- luacheck: globals hire

local function table_contains(t, val)
    for _, v in ipairs(t) do
        if v == val then
            return true
        end
    end
    return false
end

_G.hire = _G.hire or {}
local hire = _G.hire
hire.spawn_funcs = hire.spawn_funcs or {}
hire.localizations = hire.localizations or {}
-------------------armylists

--empgroup
dwarf_army_list =   {"wh_main_dwf_inf_dwarf_warrior_0", "wh_main_dwf_inf_dwarf_warrior_0", "wh_main_dwf_inf_dwarf_warrior_1", "wh_main_dwf_inf_dwarf_warrior_1", "wh_main_dwf_inf_miners_0", "wh_main_dwf_inf_miners_0", "wh_main_dwf_inf_slayers", "wh_main_dwf_inf_hammerers", "wh_main_dwf_inf_miners_1", "wh_main_dwf_inf_longbeards", "wh_main_dwf_inf_dwarf_warrior_0", "wh_main_dwf_inf_thunderers_0"} --:vector<string>
dwarf_army_sizes = {6, 7, 8, 9} --:vector<number>
dwarf_friendly_army_sizes = {8, 9, 10, 11} --:vector<number>
dwarf_very_friendly_army_sizes = {11, 12, 13, 14} --:vector<number>
dwarf_exalted_army_sizes = {14, 15, 16} --:vector<number>

empire_army_list =   {"wh_main_emp_inf_spearmen_0", "wh_main_emp_inf_spearmen_1", "wh_main_emp_inf_spearmen_1", "wh_main_emp_inf_handgunners", "wh_main_emp_inf_halberdiers", "wh_main_emp_inf_crossbowmen", "wh_main_emp_inf_greatswords", "wh_main_emp_inf_swordsmen", "wh_main_emp_inf_swordsmen", "wh_main_emp_inf_greatswords", "wh_main_emp_art_helstorm_rocket_battery", "wh_main_emp_cav_empire_knights"} --:vector<string>
empire_army_sizes = {6, 7, 8, 9} --:vector<number>
empire_friendly_army_sizes = {8, 9, 10, 11} --:vector<number>
empire_very_friendly_army_sizes = {11, 12, 13, 14} --:vector<number>
empire_exalted_army_sizes = {14, 15, 16} --:vector<number>

bretonnia_army_list =   {"wh_dlc07_brt_inf_men_at_arms_1", "wh_dlc07_brt_inf_men_at_arms_1", "wh_dlc07_brt_inf_battle_pilgrims_0", "wh_dlc07_brt_inf_peasant_bowmen_1", "wh_dlc07_brt_inf_peasant_bowmen_1", "wh_dlc07_brt_cav_knights_errant_0", "wh_dlc07_brt_cav_grail_guardians_0", "wh_dlc07_brt_inf_peasant_mob_0", "wh_dlc07_brt_inf_peasant_mob_0", "wh_main_brt_art_field_trebuchet", "wh_main_brt_inf_spearmen_at_arms", "wh_dlc07_brt_inf_men_at_arms_2"} --:vector<string>
bretonnia_army_sizes = {6, 7, 8, 9} --:vector<number>
bretonnia_friendly_army_sizes = {8, 9, 10, 11} --:vector<number>
bretonnia_very_friendly_army_sizes = {11, 12, 13, 14} --:vector<number>
bretonnia_exalted_army_sizes = {14, 15, 16} --:vector<number>

--delfgroup
darkelf_army_list =   {"wh2_main_def_inf_darkshards_0", "wh2_main_def_inf_darkshards_0", "wh2_main_def_inf_darkshards_1", "wh2_main_def_inf_darkshards_1", "wh2_main_def_inf_shades_0", "wh2_main_def_inf_shades_1", "wh2_main_def_cav_cold_one_knights_0", "wh2_main_def_art_reaper_bolt_thrower", "wh2_main_def_inf_dreadspears_0", "wh2_main_def_inf_dreadspears_0", "wh2_main_def_inf_black_guard_0", "wh2_main_def_inf_darkshards_1"} --:vector<string>
darkelf_army_sizes = {6, 7, 8, 9} --:vector<number>
darkelf_friendly_army_sizes = {8, 9, 10, 11} --:vector<number>
darkelf_very_friendly_army_sizes = {11, 12, 13, 14} --:vector<number>
darkelf_exalted_army_sizes = {14, 15, 16} --:vector<number>

skaven_army_list =   {"wh2_main_skv_inf_skavenslaves_0", "wh2_main_skv_inf_skavenslaves_0", "wh2_main_skv_inf_stormvermin_0", "wh2_main_skv_inf_stormvermin_1", "wh2_main_skv_inf_plague_monks", "wh2_main_skv_inf_clanrat_spearmen_0", "wh2_main_skv_inf_clanrat_spearmen_1", "wh2_main_skv_inf_clanrat_spearmen_1", "wh2_main_skv_inf_clanrats_1", "wh2_dlc12_skv_inf_warplock_jezzails_0", "wh2_dlc12_skv_inf_warplock_jezzails_0", "wh2_main_skv_inf_death_globe_bombardiers"} --:vector<string>
skaven_army_sizes = {6, 7, 8, 9} --:vector<number>
skaven_friendly_army_sizes = {8, 9, 10, 11} --:vector<number>
skaven_very_friendly_army_sizes = {11, 12, 13, 14} --:vector<number>
skaven_exalted_army_sizes = {14, 15, 16} --:vector<number>

--helfgroup
highelf_army_list =   {"wh2_main_hef_inf_spearmen_0", "wh2_main_hef_inf_spearmen_0", "wh2_main_hef_inf_phoenix_guard", "wh2_main_hef_inf_lothern_sea_guard_0", "wh2_main_hef_inf_lothern_sea_guard_0", "wh2_main_hef_inf_archers_0", "wh2_main_hef_inf_archers_0", "wh2_main_hef_mon_great_eagle", "wh2_main_hef_cav_silver_helms_0", "wh2_main_hef_cav_ellyrian_reavers_0", "wh2_main_hef_art_eagle_claw_bolt_thrower", "wh2_main_hef_inf_spearmen_0"} --:vector<string>
highelf_army_sizes = {6, 7, 8, 9} --:vector<number>
highelf_friendly_army_sizes = {8, 9, 10, 11} --:vector<number>
highelf_very_friendly_army_sizes = {11, 12, 13, 14} --:vector<number>
highelf_exalted_army_sizes = {14, 15, 16} --:vector<number>

lizard_army_list =   {"wh2_main_lzd_inf_saurus_spearmen_0", "wh2_main_lzd_inf_saurus_spearmen_0", "wh2_main_lzd_inf_saurus_spearmen_1", "wh2_main_lzd_inf_saurus_spearmen_1", "wh2_main_lzd_inf_skink_cohort_0", "wh2_main_lzd_inf_saurus_warriors_0", "wh2_main_lzd_inf_saurus_warriors_0", "wh2_main_lzd_inf_skink_skirmishers_0", "wh2_main_lzd_mon_kroxigors", "wh2_main_lzd_cav_terradon_riders_0", "wh2_main_lzd_inf_chameleon_skinks_0", "wh2_main_lzd_mon_bastiladon_0"} --:vector<string>
lizard_army_sizes = {6, 7, 8, 9} --:vector<number>
lizard_friendly_army_sizes = {8, 9, 10, 11} --:vector<number>
lizard_very_friendly_army_sizes = {11, 12, 13, 14} --:vector<number>
lizard_exalted_army_sizes = {14, 15, 16} --:vector<number>

welf_army_list =   {"wh_dlc05_wef_inf_glade_guard_0", "wh_dlc05_wef_inf_glade_guard_0", "wh_dlc05_wef_inf_wardancers_0", "wh_dlc05_wef_inf_wardancers_0", "wh_dlc05_wef_inf_waywatchers_0", "wh_dlc05_wef_mon_great_eagle_0", "wh_dlc05_wef_inf_deepwood_scouts_0", "wh_dlc05_wef_inf_deepwood_scouts_0", "wh_dlc05_wef_cav_glade_riders_0", "wh_dlc05_wef_cav_glade_riders_1", "wh_dlc05_wef_inf_dryads_0", "wh_dlc05_wef_inf_wardancers_1"} --:vector<string>
welf_army_sizes = {6, 7, 8, 9} --:vector<number>
welf_friendly_army_sizes = {8, 9, 10, 11} --:vector<number>
welf_very_friendly_army_sizes = {11, 12, 13, 14} --:vector<number>
welf_exalted_army_sizes = {14, 15, 16} --:vector<number>

--vampgroup
vcount_army_list =   {"wh_main_vmp_inf_zombie", "wh_main_vmp_inf_skeleton_warriors_0", "wh_main_vmp_inf_skeleton_warriors_0", "wh_main_vmp_inf_skeleton_warriors_1", "wh_main_vmp_mon_crypt_horrors", "wh_main_vmp_mon_vargheists", "wh_main_vmp_mon_dire_wolves", "wh2_dlc11_cst_inf_depth_guard_1", "wh2_dlc11_cst_inf_depth_guard_0", "wh_main_vmp_inf_grave_guard_1", "wh_dlc02_vmp_cav_blood_knights_0", "wh_main_vmp_cav_hexwraiths"} --:vector<string>
vcount_army_sizes = {6, 7, 8, 9} --:vector<number>
vcount_friendly_army_sizes = {8, 9, 10, 11} --:vector<number>
vcount_very_friendly_army_sizes = {11, 12, 13, 14} --:vector<number>
vcount_exalted_army_sizes = {14, 15, 16} --:vector<number>

vcoast_army_list =   {"wh2_dlc11_cst_inf_zombie_deckhands_mob_0", "wh2_dlc11_cst_inf_zombie_deckhands_mob_0", "wh2_dlc11_cst_inf_zombie_deckhands_mob_1", "wh2_dlc11_cst_inf_zombie_gunnery_mob_1", "wh2_dlc11_cst_inf_zombie_gunnery_mob_2", "wh2_dlc11_cst_mon_mournguls_0", "wh2_dlc11_cst_cav_deck_droppers_0", "wh2_dlc11_cst_art_mortar", "wh2_dlc11_cst_mon_rotting_prometheans_0", "wh2_dlc11_cst_cav_deck_droppers_1", "wh2_dlc11_cst_mon_fell_bats", "wh2_dlc11_cst_inf_zombie_gunnery_mob_0"} --:vector<string>
vcoast_army_sizes = {6, 7, 8, 9} --:vector<number>
vcoast_friendly_army_sizes = {8, 9, 10, 11} --:vector<number>
vcoast_very_friendly_army_sizes = {11, 12, 13, 14} --:vector<number>
vcoast_exalted_army_sizes = {14, 15, 16} --:vector<number>

--chaosgroup
norsca_army_list =   {"wh_dlc08_nor_inf_marauder_spearman_0", "wh_main_nor_mon_chaos_warhounds_0", "wh_main_nor_inf_chaos_marauders_0", "wh_main_nor_inf_chaos_marauders_0", "wh_main_nor_cav_marauder_horsemen_1", "wh_dlc08_nor_mon_skinwolves_0", "wh_dlc08_nor_mon_norscan_ice_trolls_0", "wh_dlc08_nor_inf_marauder_champions_0", "wh_dlc08_nor_mon_skinwolves_1", "wh_main_nor_inf_chaos_marauders_0", "wh_main_nor_inf_chaos_marauders_0", "wh_dlc08_nor_mon_war_mammoth_0"} --:vector<string>
norsca_army_sizes = {6, 7, 8, 9} --:vector<number>
norsca_friendly_army_sizes = {8, 9, 10, 11} --:vector<number>
norsca_very_friendly_army_sizes = {11, 12, 13, 14} --:vector<number>
norsca_exalted_army_sizes = {14, 15, 16} --:vector<number>

chaos_army_list =   {"wh_main_chs_inf_chaos_warriors_0", "wh_main_chs_inf_chaos_warriors_0", "wh_main_chs_inf_chaos_warriors_1", "wh_main_chs_inf_chaos_marauders_0", "wh_main_chs_inf_chosen_0", "wh_main_chs_mon_chaos_warhounds_0", "wh_main_chs_cav_chaos_knights_0", "wh_main_chs_mon_chaos_spawn", "wh_main_chs_mon_trolls", "wh_main_chs_inf_chaos_warriors_0", "wh_main_chs_cav_marauder_horsemen_0", "wh_main_chs_cav_marauder_horsemen_1"} --:vector<string>
chaos_army_sizes = {6, 7, 8, 9} --:vector<number>
chaos_friendly_army_sizes = {8, 9, 10, 11} --:vector<number>
chaos_very_friendly_army_sizes = {11, 12, 13, 14} --:vector<number>
chaos_exalted_army_sizes = {14, 15, 16} --:vector<number>

beast_army_list =   {"wh_dlc03_bst_inf_gor_herd_0", "wh_dlc03_bst_inf_gor_herd_0", "wh_dlc03_bst_inf_gor_herd_1", "wh_dlc03_bst_inf_centigors_0", "wh_dlc03_bst_inf_centigors_0", "wh_dlc03_bst_inf_ungor_spearmen_0", "wh_dlc03_bst_inf_ungor_spearmen_0", "wh_dlc03_bst_inf_ungor_spearmen_1", "wh_dlc03_bst_inf_ungor_raiders_0", "wh_dlc03_bst_inf_ungor_raiders_0", "wh_dlc03_bst_inf_minotaurs_0", "wh_dlc03_bst_mon_giant_0"} --:vector<string>
beast_army_sizes = {6, 7, 8, 9} --:vector<number>
beast_friendly_army_sizes = {8, 9, 10, 11} --:vector<number>
beast_very_friendly_army_sizes = {10, 11, 12, 13} --:vector<number>
beast_exalted_army_sizes = {11, 12, 13, 14} --:vector<number>

greenskin_army_list =   {"wh_main_grn_inf_goblin_spearmen", "wh_main_grn_inf_goblin_spearmen", "wh_main_grn_inf_night_goblin_archers", "wh_main_grn_inf_night_goblin_archers", "wh_main_grn_inf_orc_big_uns", "wh_main_grn_inf_savage_orcs", "wh_main_grn_mon_trolls", "wh_main_grn_mon_giant", "wh_main_grn_cav_orc_boar_boyz", "wh_main_grn_inf_black_orcs", "wh_main_grn_inf_orc_big_uns", "wh_main_grn_inf_night_goblins"} --:vector<string>
greenskin_army_sizes = {6, 7, 8, 9} --:vector<number>
greenskin_friendly_army_sizes = {8, 9, 10, 11} --:vector<number>
greenskin_very_friendly_army_sizes = {10, 11, 12, 13} --:vector<number>
greenskin_exalted_army_sizes = {11, 12, 13, 14} --:vector<number>

tombking_army_list =   {"wh2_dlc09_tmb_inf_skeleton_warriors_0", "wh2_dlc09_tmb_inf_skeleton_warriors_0", "wh2_dlc09_tmb_inf_tomb_guard_0", "wh2_dlc09_tmb_inf_tomb_guard_0", "wh2_dlc09_tmb_inf_tomb_guard_1", "wh2_dlc09_tmb_inf_skeleton_archers_0", "wh2_dlc09_tmb_inf_skeleton_archers_0", "wh2_dlc09_tmb_mon_tomb_scorpion_0", "wh2_dlc09_tmb_veh_skeleton_chariot_0", "wh2_dlc09_tmb_cav_necropolis_knights_0", "wh2_dlc09_tmb_inf_nehekhara_warriors_0", "wh2_dlc09_tmb_mon_sepulchral_stalkers_0"} --:vector<string>
tombking_army_sizes = {6, 7, 8, 9} --:vector<number>
tombking_friendly_army_sizes = {8, 9, 10, 11} --:vector<number>
tombking_very_friendly_army_sizes = {10, 11, 12, 13} --:vector<number>
tombking_exalted_army_sizes = {11, 12, 13, 14} --:vector<number>

--roguearmies
rogue_army_list =   {"wh_main_chs_inf_chaos_warriors_0", "wh_main_chs_inf_chaos_warriors_0", "wh_main_chs_inf_chaos_warriors_1", "wh_main_chs_inf_chaos_marauders_0", "wh_main_chs_inf_chosen_0", "wh_main_chs_mon_chaos_warhounds_0", "wh_main_chs_cav_chaos_knights_0", "wh_main_chs_mon_chaos_spawn", "wh_main_chs_mon_trolls", "wh_main_chs_inf_chaos_warriors_0", "wh_main_chs_cav_marauder_horsemen_0", "wh_main_chs_cav_marauder_horsemen_1"} --:vector<string>
rogue_army_sizes = {6, 7, 8, 9} --:vector<number>
-------------------initialize values
if not cm:get_saved_value("hired_army") then cm:set_saved_value("hired_army", 0); end;
-------------------Armies
function SpawnTombkingArmy()
	local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
	local character_cqi = cm:get_saved_value("temp_character")
	local x = character:logical_position_x();
	local y = character:logical_position_y();
	local viable_x = x + 1;
	local viable_y = y + 1;
	local unit_string = tombking_army_list[cm:random_number(#tombking_army_list)]
	for i = 1, tombking_army_sizes[cm:random_number(#tombking_army_sizes)] do
	local new_string = unit_string..","..tombking_army_list[cm:random_number(#tombking_army_list)]
	unit_string = new_string
	end;
	cm:create_force_with_general(
	"wh2_dlc09_tmb_tombking_qb1",
	unit_string,
	"wh_main_reikland_grunburg",
	viable_x,
	viable_y,
	"general",
	"wh2_dlc09_tmb_tomb_king",
	"names_name_684097886",
	"",
	"",
	"",
	false,
	function(cqi)
	-- add recruitment buildings to the spawned horde
	local character = cm:get_character_by_cqi(cqi);
	local mf_cqi = character:military_force():command_queue_index();
	cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, 0, true);
	cm:force_make_vassal(cm:model():world():whose_turn_is_it():name(), "wh2_dlc09_tmb_tombking_qb1");
	cm:force_diplomacy("faction:wh2_dlc09_tmb_tombking_qb1", "all", "all", false, false, false);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh2_dlc09_tmb_tombking_qb1", "war", false, false, true);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh2_dlc09_tmb_tombking_qb1", "break vassal", false, false, true);
	cm:apply_effect_bundle_to_character("reinforcement_range_bonus_hire", character, 0)
	cm:set_saved_value("temp_reinforcement", cqi)
	end
	);
end

function SpawnGreenskinArmy()
	local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
	local character_cqi = cm:get_saved_value("temp_character")
	local x = character:logical_position_x();
	local y = character:logical_position_y();
	local viable_x = x + 1;
	local viable_y = y + 1;
	local unit_string = greenskin_army_list[cm:random_number(#greenskin_army_list)]
	for i = 1, greenskin_army_sizes[cm:random_number(#greenskin_army_sizes)] do
	local new_string = unit_string..","..greenskin_army_list[cm:random_number(#greenskin_army_list)]
	unit_string = new_string
	end;
	cm:create_force_with_general(
	"wh_main_grn_greenskins_qb1",
	unit_string,
	"wh_main_reikland_grunburg",
	viable_x,
	viable_y,
	"general",
	"grn_orc_warboss",
	"names_name_2147344615",
	"",
	"",
	"",
	false,
	function(cqi)
	-- add recruitment buildings to the spawned horde
	local character = cm:get_character_by_cqi(cqi);
	local mf_cqi = character:military_force():command_queue_index();
	cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, 0, true);
	cm:force_make_vassal(cm:model():world():whose_turn_is_it():name(), "wh_main_grn_greenskins_qb1");
	cm:force_diplomacy("faction:wh_main_grn_greenskins_qb1", "all", "all", false, false, false);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh_main_grn_greenskins_qb1", "war", false, false, true);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh_main_grn_greenskins_qb1", "break vassal", false, false, true);
	cm:apply_effect_bundle_to_character("reinforcement_range_bonus_hire", character, 0)
	cm:set_saved_value("temp_reinforcement", cqi)
	end
	);
end

function SpawnBeastArmy()
	local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
	local character_cqi = cm:get_saved_value("temp_character")
	local x = character:logical_position_x();
	local y = character:logical_position_y();
	local viable_x = x + 1;
	local viable_y = y + 1;
	local unit_string = beast_army_list[cm:random_number(#beast_army_list)]
	for i = 1, beast_army_sizes[cm:random_number(#beast_army_sizes)] do
	local new_string = unit_string..","..beast_army_list[cm:random_number(#beast_army_list)]
	unit_string = new_string
	end;
	cm:create_force_with_general(
	"wh_dlc03_bst_beastmen_ally",
	unit_string,
	"wh_main_reikland_grunburg",
	viable_x,
	viable_y,
	"general",
	"dlc03_bst_beastlord",
	"names_name_2147358442",
	"",
	"",
	"",
	false,
	function(cqi)
	-- add recruitment buildings to the spawned horde
	local character = cm:get_character_by_cqi(cqi);
	local mf_cqi = character:military_force():command_queue_index();
	cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, 0, true);
	cm:force_make_vassal(cm:model():world():whose_turn_is_it():name(), "wh_dlc03_bst_beastmen_ally");
	cm:force_diplomacy("faction:wh_dlc03_bst_beastmen_ally", "all", "all", false, false, false);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh_dlc03_bst_beastmen_ally", "war", false, false, true);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh_dlc03_bst_beastmen_ally", "break vassal", false, false, true);
	cm:apply_effect_bundle_to_character("reinforcement_range_bonus_hire", character, 0)
	cm:set_saved_value("temp_reinforcement", cqi)
	end
	);
end

function SpawnRogueArmy()
	local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
	local character_cqi = cm:get_saved_value("temp_character")
	local x = character:logical_position_x();
	local y = character:logical_position_y();
	local viable_x = x + 1;
	local viable_y = y + 1;
	local unit_string = rogue_army_list[cm:random_number(#rogue_army_list)]
	for i = 1, rogue_army_sizes[cm:random_number(#rogue_army_sizes)] do
	local new_string = unit_string..","..rogue_army_list[cm:random_number(#rogue_army_list)]
	unit_string = new_string
	end;
	cm:create_force_with_general(
	"wh2_main_rogue_gerhardts_mercenaries_qb1",
	unit_string,
	"wh_main_reikland_grunburg",
	viable_x,
	viable_y,
	"general",
	"emp_lord",
	"names_name_2147354538",
	"",
	"",
	"",
	false,
	function(cqi)
	-- add recruitment buildings to the spawned horde
	local character = cm:get_character_by_cqi(cqi);
	local mf_cqi = character:military_force():command_queue_index();
	cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, 0, true);
	cm:force_make_vassal(cm:model():world():whose_turn_is_it():name(), "wh2_main_rogue_gerhardts_mercenaries_qb1");
	cm:force_diplomacy("faction:wh2_main_rogue_gerhardts_mercenaries_qb1", "all", "all", false, false, false);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh2_main_rogue_gerhardts_mercenaries_qb1", "war", false, false, true);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh2_main_rogue_gerhardts_mercenaries_qb1", "break vassal", false, false, true);
	cm:apply_effect_bundle_to_character("reinforcement_range_bonus_hire", character, 0)
	cm:set_saved_value("temp_reinforcement", cqi)
	end
	);
end

function SpawnChaosArmy()
	local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
	local character_cqi = cm:get_saved_value("temp_character")
	local x = character:logical_position_x();
	local y = character:logical_position_y();
	local viable_x = x + 1;
	local viable_y = y + 1;
	local unit_string = chaos_army_list[cm:random_number(#chaos_army_list)]
	for i = 1, chaos_army_sizes[cm:random_number(#chaos_army_sizes)] do
	local new_string = unit_string..","..chaos_army_list[cm:random_number(#chaos_army_list)]
	unit_string = new_string
	end;
	cm:create_force_with_general(
	"wh_main_chs_chaos_qb1",
	unit_string,
	"wh_main_reikland_grunburg",
	viable_x,
	viable_y,
	"general",
	"chs_lord",
	"names_name_2147346126",
	"",
	"",
	"",
	false,
	function(cqi)
	-- add recruitment buildings to the spawned horde
	local character = cm:get_character_by_cqi(cqi);
	local mf_cqi = character:military_force():command_queue_index();
	cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, 0, true);
	cm:force_make_vassal(cm:model():world():whose_turn_is_it():name(), "wh_main_chs_chaos_qb1");
	cm:force_diplomacy("faction:wh_main_chs_chaos_qb1", "all", "all", false, false, false);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh_main_chs_chaos_qb1", "war", false, false, true);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh_main_chs_chaos_qb1", "break vassal", false, false, true);
	cm:apply_effect_bundle_to_character("reinforcement_range_bonus_hire", character, 0)
	cm:set_saved_value("temp_reinforcement", cqi)
	end
	);
end

function SpawnNorscaArmy()
	local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
	local character_cqi = cm:get_saved_value("temp_character")
	local x = character:logical_position_x();
	local y = character:logical_position_y();
	local viable_x = x + 1;
	local viable_y = y + 1;
	local unit_string = norsca_army_list[cm:random_number(#norsca_army_list)]
	for i = 1, norsca_army_sizes[cm:random_number(#norsca_army_sizes)] do
	local new_string = unit_string..","..norsca_army_list[cm:random_number(#norsca_army_list)]
	unit_string = new_string
	end;
	cm:create_force_with_general(
	"wh_main_nor_norsca_qb3",
	unit_string,
	"wh_main_reikland_grunburg",
	viable_x,
	viable_y,
	"general",
	"nor_marauder_chieftain",
	"names_name_313852817",
	"",
	"",
	"",
	false,
	function(cqi)
	-- add recruitment buildings to the spawned horde
	local character = cm:get_character_by_cqi(cqi);
	local mf_cqi = character:military_force():command_queue_index();
	cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, 0, true);
	cm:force_make_vassal(cm:model():world():whose_turn_is_it():name(), "wh_main_nor_norsca_qb3");
	cm:force_diplomacy("faction:wh_main_nor_norsca_qb3", "all", "all", false, false, false);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh_main_nor_norsca_qb3", "war", false, false, true);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh_main_nor_norsca_qb3", "break vassal", false, false, true);
	cm:apply_effect_bundle_to_character("reinforcement_range_bonus_hire", character, 0)
	cm:set_saved_value("temp_reinforcement", cqi)
	end
	);
end

function SpawnVcoastArmy()
	local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
	local character_cqi = cm:get_saved_value("temp_character")
	local x = character:logical_position_x();
	local y = character:logical_position_y();
	local viable_x = x + 1;
	local viable_y = y + 1;
	local unit_string = vcoast_army_list[cm:random_number(#vcoast_army_list)]
	for i = 1, vcoast_army_sizes[cm:random_number(#vcoast_army_sizes)] do
	local new_string = unit_string..","..vcoast_army_list[cm:random_number(#vcoast_army_list)]
	unit_string = new_string
	end;
	cm:create_force_with_general(
	"wh2_dlc11_cst_vampire_coast_qb3",
	unit_string,
	"wh_main_reikland_grunburg",
	viable_x,
	viable_y,
	"general",
	"vmp_lord",
	"names_name_2147345209",
	"",
	"",
	"",
	false,
	function(cqi)
	-- add recruitment buildings to the spawned horde
	local character = cm:get_character_by_cqi(cqi);
	local mf_cqi = character:military_force():command_queue_index();
	cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, 0, true);
	cm:force_make_vassal(cm:model():world():whose_turn_is_it():name(), "wh2_dlc11_cst_vampire_coast_qb3");
	cm:force_diplomacy("faction:wh2_dlc11_cst_vampire_coast_qb3", "all", "all", false, false, false);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh2_dlc11_cst_vampire_coast_qb3", "war", false, false, true);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh2_dlc11_cst_vampire_coast_qb3", "break vassal", false, false, true);
	cm:apply_effect_bundle_to_character("reinforcement_range_bonus_hire", character, 0)
	cm:set_saved_value("temp_reinforcement", cqi)
	end
	);
end

function SpawnVcountArmy()
	local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
	local character_cqi = cm:get_saved_value("temp_character")
	local x = character:logical_position_x();
	local y = character:logical_position_y();
	local viable_x = x + 1;
	local viable_y = y + 1;
	local unit_string = vcount_army_list[cm:random_number(#vcount_army_list)]
	for i = 1, vcount_army_sizes[cm:random_number(#vcount_army_sizes)] do
	local new_string = unit_string..","..vcount_army_list[cm:random_number(#vcount_army_list)]
	unit_string = new_string
	end;
	cm:create_force_with_general(
	"wh_main_vmp_vampire_counts_qb3",
	unit_string,
	"wh_main_reikland_grunburg",
	viable_x,
	viable_y,
	"general",
	"vmp_lord",
	"names_name_2147345209",
	"",
	"",
	"",
	false,
	function(cqi)
	-- add recruitment buildings to the spawned horde
	local character = cm:get_character_by_cqi(cqi);
	local mf_cqi = character:military_force():command_queue_index();
	cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, 0, true);
	cm:force_make_vassal(cm:model():world():whose_turn_is_it():name(), "wh_main_vmp_vampire_counts_qb3");
	cm:force_diplomacy("faction:wh_main_vmp_vampire_counts_qb3", "all", "all", false, false, false);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh_main_vmp_vampire_counts_qb3", "war", false, false, true);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh_main_vmp_vampire_counts_qb3", "break vassal", false, false, true);
	cm:apply_effect_bundle_to_character("reinforcement_range_bonus_hire", character, 0)
	cm:set_saved_value("temp_reinforcement", cqi)
	end
	);
end

function SpawnWelfArmy()
	local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
	local character_cqi = cm:get_saved_value("temp_character")
	local x = character:logical_position_x();
	local y = character:logical_position_y();
	local viable_x = x + 1;
	local viable_y = y + 1;
	local unit_string = welf_army_list[cm:random_number(#welf_army_list)]
	for i = 1, welf_army_sizes[cm:random_number(#welf_army_sizes)] do
	local new_string = unit_string..","..welf_army_list[cm:random_number(#welf_army_list)]
	unit_string = new_string
	end;
	cm:create_force_with_general(
	"wh_dlc05_wef_wood_elves_qb2",
	unit_string,
	"wh_main_reikland_grunburg",
	viable_x,
	viable_y,
	"general",
	"dlc05_wef_glade_lord",
	"names_name_2147359209",
	"",
	"",
	"",
	false,
	function(cqi)
	-- add recruitment buildings to the spawned horde
	local character = cm:get_character_by_cqi(cqi);
	local mf_cqi = character:military_force():command_queue_index();
	cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, 0, true);
	cm:force_make_vassal(cm:model():world():whose_turn_is_it():name(), "wh_dlc05_wef_wood_elves_qb2");
	cm:force_diplomacy("faction:wh_dlc05_wef_wood_elves_qb2", "all", "all", false, false, false);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh_dlc05_wef_wood_elves_qb2", "war", false, false, true);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh_dlc05_wef_wood_elves_qb2", "break vassal", false, false, true);
	cm:apply_effect_bundle_to_character("reinforcement_range_bonus_hire", character, 0)
	cm:set_saved_value("temp_reinforcement", cqi)
	end
	);
end

function SpawnLizardArmy()
	local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
	local character_cqi = cm:get_saved_value("temp_character")
	local x = character:logical_position_x();
	local y = character:logical_position_y();
	local viable_x = x + 1;
	local viable_y = y + 1;
	local unit_string = lizard_army_list[cm:random_number(#lizard_army_list)]
	for i = 1, lizard_army_sizes[cm:random_number(#lizard_army_sizes)] do
	local new_string = unit_string..","..lizard_army_list[cm:random_number(#lizard_army_list)]
	unit_string = new_string
	end;
	cm:create_force_with_general(
	"wh2_main_lzd_lizardmen_qb3",
	unit_string,
	"wh_main_reikland_grunburg",
	viable_x,
	viable_y,
	"general",
	"wh2_main_lzd_saurus_old_blood",
	"names_name_2126368843",
	"",
	"",
	"",
	false,
	function(cqi)
	-- add recruitment buildings to the spawned horde
	local character = cm:get_character_by_cqi(cqi);
	local mf_cqi = character:military_force():command_queue_index();
	cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, 0, true);
	cm:force_make_vassal(cm:model():world():whose_turn_is_it():name(), "wh2_main_lzd_lizardmen_qb3");
	cm:force_diplomacy("faction:wh2_main_lzd_lizardmen_qb3", "all", "all", false, false, false);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh2_main_lzd_lizardmen_qb3", "war", false, false, true);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh2_main_lzd_lizardmen_qb3", "break vassal", false, false, true);
	cm:apply_effect_bundle_to_character("reinforcement_range_bonus_hire", character, 0)
	cm:set_saved_value("temp_reinforcement", cqi)
	end
	);
end

function SpawnHelfArmy()
	local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
	local character_cqi = cm:get_saved_value("temp_character")
	local x = character:logical_position_x();
	local y = character:logical_position_y();
	local viable_x = x + 1;
	local viable_y = y + 1;
	local unit_string = highelf_army_list[cm:random_number(#highelf_army_list)]
	for i = 1, highelf_army_sizes[cm:random_number(#highelf_army_sizes)] do
	local new_string = unit_string..","..highelf_army_list[cm:random_number(#highelf_army_list)]
	unit_string = new_string
	end;
	cm:create_force_with_general(
	"wh2_main_hef_high_elves_qb3",
	unit_string,
	"wh_main_reikland_grunburg",
	viable_x,
	viable_y,
	"general",
	"wh2_main_hef_prince",
	"names_name_2147360185",
	"",
	"",
	"",
	false,
	function(cqi)
	-- add recruitment buildings to the spawned horde
	local character = cm:get_character_by_cqi(cqi);
	local mf_cqi = character:military_force():command_queue_index();
	cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, 0, true);
	cm:force_make_vassal(cm:model():world():whose_turn_is_it():name(), "wh2_main_hef_high_elves_qb3");
	cm:force_diplomacy("faction:wh2_main_hef_high_elves_qb3", "all", "all", false, false, false);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh2_main_hef_high_elves_qb3", "war", false, false, true);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh2_main_hef_high_elves_qb3", "break vassal", false, false, true);
	cm:apply_effect_bundle_to_character("reinforcement_range_bonus_hire", character, 0)
	cm:set_saved_value("temp_reinforcement", cqi)
	end
	);
end

function SpawnSkavenArmy()
	local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
	local character_cqi = cm:get_saved_value("temp_character")
	local x = character:logical_position_x();
	local y = character:logical_position_y();
	local viable_x = x + 1;
	local viable_y = y + 1;
	local unit_string = skaven_army_list[cm:random_number(#skaven_army_list)]
	for i = 1, skaven_army_sizes[cm:random_number(#skaven_army_sizes)] do
	local new_string = unit_string..","..skaven_army_list[cm:random_number(#skaven_army_list)]
	unit_string = new_string
	end;
	cm:create_force_with_general(
	"wh2_main_skv_skaven_qb4",
	unit_string,
	"wh_main_reikland_grunburg",
	viable_x,
	viable_y,
	"general",
	"wh2_main_skv_warlord",
	"names_name_144630481",
	"",
	"",
	"",
	false,
	function(cqi)
	-- add recruitment buildings to the spawned horde
	local character = cm:get_character_by_cqi(cqi);
	local mf_cqi = character:military_force():command_queue_index();
	cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, 0, true);
	cm:force_make_vassal(cm:model():world():whose_turn_is_it():name(), "wh2_main_skv_skaven_qb4");
	cm:force_diplomacy("faction:wh2_main_skv_skaven_qb4", "all", "all", false, false, false);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh2_main_skv_skaven_qb4", "war", false, false, true);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh2_main_skv_skaven_qb4", "break vassal", false, false, true);
	cm:apply_effect_bundle_to_character("reinforcement_range_bonus_hire", character, 0)
	cm:set_saved_value("temp_reinforcement", cqi)
	end
	);
end

function SpawnDarkelfArmy()
	local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
	local character_cqi = cm:get_saved_value("temp_character")
	local x = character:logical_position_x();
	local y = character:logical_position_y();
	local viable_x = x + 1;
	local viable_y = y + 1;
	local unit_string = darkelf_army_list[cm:random_number(#darkelf_army_list)]
	for i = 1, darkelf_army_sizes[cm:random_number(#darkelf_army_sizes)] do
	local new_string = unit_string..","..darkelf_army_list[cm:random_number(#darkelf_army_list)]
	unit_string = new_string
	end;
	cm:create_force_with_general(
	"wh2_main_def_dark_elves_qb4",
	unit_string,
	"wh_main_reikland_grunburg",
	viable_x,
	viable_y,
	"general",
	"wh2_main_def_dreadlord",
	"names_name_686261355",
	"",
	"",
	"",
	false,
	function(cqi)
	-- add recruitment buildings to the spawned horde
	local character = cm:get_character_by_cqi(cqi);
	local mf_cqi = character:military_force():command_queue_index();
	cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, 0, true);
	cm:force_make_vassal(cm:model():world():whose_turn_is_it():name(), "wh2_main_def_dark_elves_qb4");
	cm:force_diplomacy("faction:wh2_main_def_dark_elves_qb4", "all", "all", false, false, false);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh2_main_def_dark_elves_qb4", "war", false, false, true);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh2_main_def_dark_elves_qb4", "break vassal", false, false, true);
	cm:apply_effect_bundle_to_character("reinforcement_range_bonus_hire", character, 0)
	cm:set_saved_value("temp_reinforcement", cqi)
	end
	);
end

function SpawnDwarfArmy()
	local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
	local character_cqi = cm:get_saved_value("temp_character")
	local x = character:logical_position_x();
	local y = character:logical_position_y();
	local viable_x = x + 1;
	local viable_y = y + 1;
	local unit_string = dwarf_army_list[cm:random_number(#dwarf_army_list)]
	for i = 1, dwarf_army_sizes[cm:random_number(#dwarf_army_sizes)] do
	local new_string = unit_string..","..dwarf_army_list[cm:random_number(#dwarf_army_list)]
	unit_string = new_string
	end;
	cm:create_force_with_general(
	"wh_main_dwf_dwarfs_qb2",
	unit_string,
	"wh_main_reikland_grunburg",
	viable_x,
	viable_y,
	"general",
	"dwf_lord",
	"names_name_2147345825",
	"",
	"",
	"",
	false,
	function(cqi)
	-- add recruitment buildings to the spawned horde
	local character = cm:get_character_by_cqi(cqi);
	local mf_cqi = character:military_force():command_queue_index();
	cm:add_building_to_force(mf_cqi, "wh_main_horde_chaos_marauders_1");
	cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, 0, true);
	cm:force_make_vassal(cm:model():world():whose_turn_is_it():name(), "wh_main_dwf_dwarfs_qb2");
	cm:force_diplomacy("faction:wh_main_dwf_dwarfs_qb2", "all", "all", false, false, false);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh_main_dwf_dwarfs_qb2", "war", false, false, true);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh_main_dwf_dwarfs_qb2", "break vassal", false, false, true);
	cm:apply_effect_bundle_to_character("reinforcement_range_bonus_hire", character, 0)
	cm:set_saved_value("temp_reinforcement", cqi)
	end
	);
end

function SpawnEmpireArmy()
	local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
	local character_cqi = cm:get_saved_value("temp_character")
	local x = character:logical_position_x();
	local y = character:logical_position_y();
	local viable_x = x + 1;
	local viable_y = y + 1;
	local unit_string = empire_army_list[cm:random_number(#empire_army_list)]
	for i = 1, empire_army_sizes[cm:random_number(#empire_army_sizes)] do
	local new_string = unit_string..","..empire_army_list[cm:random_number(#empire_army_list)]
	unit_string = new_string
	end;
	cm:create_force_with_general(
	"wh_main_emp_empire_qb3",
	unit_string,
	"wh_main_reikland_grunburg",
	viable_x,
	viable_y,
	"general",
	"emp_lord",
	"names_name_2147355353",
	"",
	"",
	"",
	false,
	function(cqi)
	-- add recruitment buildings to the spawned horde
	local character = cm:get_character_by_cqi(cqi);
	local mf_cqi = character:military_force():command_queue_index();
	cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, 0, true);
	cm:force_make_vassal(cm:model():world():whose_turn_is_it():name(), "wh_main_emp_empire_qb3");
	cm:force_diplomacy("faction:wh_main_emp_empire_qb3", "all", "all", false, false, false);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh_main_emp_empire_qb3", "war", false, false, true);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh_main_emp_empire_qb3", "break vassal", false, false, true);
	cm:apply_effect_bundle_to_character("reinforcement_range_bonus_hire", character, 0)
	cm:set_saved_value("temp_reinforcement", cqi)
	end
	);
end

function SpawnBretonniaArmy()
	local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
	local character_cqi = cm:get_saved_value("temp_character")
	local x = character:logical_position_x();
	local y = character:logical_position_y();
	local viable_x = x + 1;
	local viable_y = y + 1;
	local unit_string = bretonnia_army_list[cm:random_number(#bretonnia_army_list)]
	for i = 1, bretonnia_army_sizes[cm:random_number(#bretonnia_army_sizes)] do
	local new_string = unit_string..","..bretonnia_army_list[cm:random_number(#bretonnia_army_list)]
	unit_string = new_string
	end;
	cm:create_force_with_general(
	"wh_main_brt_bretonnia_qb2",
	unit_string,
	"wh_main_reikland_grunburg",
	viable_x,
	viable_y,
	"general",
	"brt_lord",
	"names_name_2040526366",
	"",
	"",
	"",
	false,
	function(cqi)
	-- add recruitment buildings to the spawned horde
	local character = cm:get_character_by_cqi(cqi);
	local mf_cqi = character:military_force():command_queue_index();
	cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, 0, true);
	cm:force_make_vassal(cm:model():world():whose_turn_is_it():name(), "wh_main_brt_bretonnia_qb2");
	cm:force_diplomacy("faction:wh_main_brt_bretonnia_qb2", "all", "all", false, false, false);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh_main_brt_bretonnia_qb2", "war", false, false, true);
	cm:force_diplomacy("faction:cm:model():world():whose_turn_is_it()", "faction:wh_main_brt_bretonnia_qb2", "break vassal", false, false, true);
	cm:apply_effect_bundle_to_character("reinforcement_range_bonus_hire", character, 0)
	cm:set_saved_value("temp_reinforcement", cqi)
	end
	);
end
-------------------BUTTON Dilemma function
function HireReinforcements()
local faction = cm:model():world():whose_turn_is_it()
local faction_key = cm:model():world():whose_turn_is_it():name()
local faction_culture = faction:culture()
local faction_subculture = faction:subculture()
local hired_army_status = cm:get_saved_value("hired_army");
	if hired_army_status == 0 then
--emp
		if faction_culture == "wh_main_emp_empire" then
		cm:trigger_dilemma(faction_key, "hire_dilemma_emp");
		end;
--dwf
		if faction_culture == "wh_main_dwf_dwarfs" then
		cm:trigger_dilemma(faction_key, "hire_dilemma_dwf");
		end;
--brt
		if faction_culture == "wh_main_brt_bretonnia" then
		cm:trigger_dilemma(faction_key, "hire_dilemma_brt");
		end;
--hef
		if faction_culture == "wh2_main_hef_high_elves" then
		cm:trigger_dilemma(faction_key, "hire_dilemma_hef");
		end;
--wef
		if faction_culture == "wh_dlc05_wef_wood_elves" then
		cm:trigger_dilemma(faction_key, "hire_dilemma_wef");
		end;
--nor
		if faction_subculture == "wh_main_sc_nor_norsca" then
		cm:trigger_dilemma(faction_key, "hire_dilemma_nor");
		end;
--chs
		if faction_subculture == "wh_main_sc_chs_chaos" then
		cm:trigger_dilemma(faction_key, "hire_dilemma_chs");
		end;
--skv
		if faction_culture == "wh2_main_skv_skaven" then
		cm:trigger_dilemma(faction_key, "hire_dilemma_skv")
		end;
--def
		if faction_culture == "wh2_main_def_dark_elves" then
		cm:trigger_dilemma(faction_key, "hire_dilemma_def");
		end;
--cst
		if faction_culture == "wh2_dlc11_cst_vampire_coast" then
		cm:trigger_dilemma(faction_key, "hire_dilemma_cst");
		end;
--vmp
		if faction_culture == "wh_main_vmp_vampire_counts" then
		cm:trigger_dilemma(faction_key, "hire_dilemma_vmp");
		end;
--grn
		if faction_culture == "wh_main_grn_greenskins" then
		cm:trigger_dilemma(faction_key, "hire_dilemma_grn");
		end;
--tk
		if faction_culture == "wh2_dlc09_tmb_tomb_kings" then
		cm:trigger_dilemma(faction_key, "hire_dilemma_tk");
		end;
--lzd 
		if faction_culture == "wh2_main_lzd_lizardmen" then
		cm:trigger_dilemma(faction_key, "hire_dilemma_lzd");
		end;
--bst
		if faction_culture == "wh_dlc03_bst_beastmen" then
		cm:trigger_dilemma(faction_key, "hire_dilemma_bst");
		end;

	end;
end;
-------------------Button
hire.create_main_button = function()
    local buttonParent =
        find_uicomponent(
        core:get_ui_root(),
        "units_panel",
        "main_units_panel",
        "recruitment_docker",
        "recruitment_options"
    )

    local hire_main_ui_button = Util.digForComponent(core:get_ui_root(), "hire_main_ui_button")
    if not hire_main_ui_button then
        hire_main_ui_button =
            Button.new("hire_main_ui_button", buttonParent, "SQUARE", "ui/skins/default/icon_filter_income.png")
    end
    hire_main_ui_button.uic:PropagatePriority(100)
    -- hire_main_ui_button:SetImagePath("ui/skins/default/icon_build.png")

    local army_abilities_panel =
        find_uicomponent(
        core:get_ui_root(),
        "units_panel",
        "main_units_panel",
        "recruitment_docker",
        "recruitment_options",
        "title_docker"
    )
    hire_main_ui_button:Resize(28, 28)
    hire_main_ui_button:PositionRelativeTo(army_abilities_panel, 540, 12)
    hire_main_ui_button:SetState("hover")
    hire_main_ui_button.uic:SetTooltipText("Call for Reinforcements")
    hire_main_ui_button.uic:PropagatePriority(100)
    hire_main_ui_button:SetState("active")
    hire_main_ui_button.uic:PropagatePriority(100)
    hire_main_ui_button:RegisterForClick(
        function()
            local minimise_unit_panel_button =
                find_uicomponent(
                core:get_ui_root(),
                "units_panel",
                "main_units_panel",
                "recruitment_docker",
                "recruitment_options",
                "title_docker",
                "button_minimise"
            )
            if minimise_unit_panel_button then
                minimise_unit_panel_button:SimulateLClick()
            end
out("you clicked ze button!")
HireReinforcements()
        end
    )
    hire.hire_main_ui_button = hire_main_ui_button
end

core:remove_listener("hire_reinforcements_UnitsPanelOpenedListener")
core:add_listener(
    "hire_reinforcements_UnitsPanelOpenedListener",
    "PanelOpenedCampaign",
    function(context)
        return context.string == "units_recruitment"
    end,
    function()
        local hire_main_ui_button = Util.digForComponent(core:get_ui_root(), "hire_main_ui_button")
        if not hire_main_ui_button then
            hire.create_main_button()
        end
    end,
    true
)

core:remove_listener("hire_reinforcements_UnitsPanelClosedListener")
core:add_listener(
    "hire_reinforcements_UnitsPanelClosedListener",
    "PanelClosedCampaign",
    function(context)
        return context.string == "units_recruitment"
    end,
    function()
        cm:remove_callback("hire_reinforcements_remove_main_button_cb")
        cm:callback(
            function()
                local hire_main_ui_button = Util.digForComponent(core:get_ui_root(), "hire_main_ui_button")
                if hire_main_ui_button then
                    Util.delete(hire_main_ui_button)
                    hire.hire_main_ui_button = nil
                end
                core:remove_listener("hire_main_button_click_listener")
            end,
            0.2,
            "hire_reinforcements_remove_main_button_cb"
        )
    end,
    true
)

core:add_listener(
    "hire_character_listener",
    "CharacterSelected",
    function(context)
        local faction_name = context:character():faction():name()
cm:set_saved_value("temp_hiring_faction", faction_name)
        return cm:model():faction_is_local(faction_name) and
            cm:model():world():whose_turn_is_it():name() == faction_name and
            context:character():character_type_key() == "general"
    end,
    function(context)
        local cqi = context:character():cqi()
	local selected_character = context:character()
	local cqi = context:character():cqi()
	cm:set_saved_value("temp_character", cqi);
    end,
    true
)

core:add_listener(
	"dilemma_choice_hire_recruitments",
	"DilemmaChoiceMadeEvent",
	true,
	function(context)
	local choice = context:choice();
out("choice is")
out(choice)
	local dilemma = context:dilemma();
--emp dilemma
		if dilemma == "hire_dilemma_emp" and choice == 0 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnDwarfArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_emp" and choice == 1 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnBretonniaArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_emp" and choice == 2 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnHelfArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
--dwf dilemma
		if dilemma == "hire_dilemma_dwf" and choice == 0 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnEmpireArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_dwf" and choice == 1 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnBretonniaArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_dwf" and choice == 2 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnLizardArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
--brt dilemma
		if dilemma == "hire_dilemma_brt" and choice == 0 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnHelfArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_brt" and choice == 1 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnEmpireArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_brt" and choice == 2 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnDwarfArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
--hef dilemma
		if dilemma == "hire_dilemma_hef" and choice == 0 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnWelfArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_hef" and choice == 1 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnLizardArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_hef" and choice == 2 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnEmpireArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
--wef dilemma
		if dilemma == "hire_dilemma_wef" and choice == 0 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnHelfArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_wef" and choice == 1 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnBretonniaArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_wef" and choice == 2 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnLizardArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
--norsca dilemma
		if dilemma == "hire_dilemma_nor" and choice == 0 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnChaosArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_nor" and choice == 1 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnBeastArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_nor" and choice == 2 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnSkavenArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
--chs dilemma
		if dilemma == "hire_dilemma_chs" and choice == 0 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnBeastArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_chs" and choice == 1 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnNorscaArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_chs" and choice == 2 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnSkavenArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
--skv Dilemma
		if dilemma == "hire_dilemma_skv" and choice == 0 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnBeastArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_skv" and choice == 1 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnDarkelfArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_skv" and choice == 2 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnVcoastArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
--def dilemma
		if dilemma == "hire_dilemma_def" and choice == 0 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnSkavenArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_def" and choice == 1 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnVcoastArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_def" and choice == 2 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnBeastArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
--vcoast dilemma
		if dilemma == "hire_dilemma_cst" and choice == 0 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnVcountArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_cst" and choice == 1 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnSkavenArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_cst" and choice == 2 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnDarkelfArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
--vcount dilemma
		if dilemma == "hire_dilemma_vmp" and choice == 0 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnSkavenArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_vmp" and choice == 1 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnVcoastArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_vmp" and choice == 2 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnEmpireArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
--greenskin dilemma
		if dilemma == "hire_dilemma_grn" and choice == 0 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnBeastArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_grn" and choice == 1 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnTombkingArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_grn" and choice == 2 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnVcountArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
--tombking dilemma
		if dilemma == "hire_dilemma_tk" and choice == 0 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnGreenskinArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_tk" and choice == 1 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnEmpireArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_tk" and choice == 2 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnLizardArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
--Lizard dilemma
		if dilemma == "hire_dilemma_lzd" and choice == 0 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnDwarfArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_lzd" and choice == 1 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnHelfArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_lzd" and choice == 2 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnTombkingArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
--beast dilemma
		if dilemma == "hire_dilemma_bst" and choice == 0 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnChaosArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_bst" and choice == 1 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnNorscaArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
		if dilemma == "hire_dilemma_bst" and choice == 2 then
		local character_cqi = cm:get_saved_value("temp_character")
		local character = cm:get_character_by_cqi(cm:get_saved_value("temp_character"));
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		SpawnSkavenArmy()
		cm:set_saved_value("temp_hirer", character_cqi)
		cm:set_saved_value("hired_army", 1);
		end;
end,
true
);

core:add_listener(
	"follow_general",
	"CharacterFinishedMovingEvent",
	function(context) return context:character():faction():is_human() == true; end,
	function(context)
		local character = context:character()
		local cqi = context:character():cqi()
		local x = character:logical_position_x();
		local y = character:logical_position_y();
		local viable_x, viable_y = cm:find_valid_spawn_location_for_character_from_position(cm:model():world():whose_turn_is_it():name(), x, y, false, 2);
		local cqi_of_hirer = cm:get_saved_value("temp_hirer")
		local reinforcement_character = cm:get_character_by_cqi(cm:get_saved_value("temp_reinforcement"));
		local reinforcement_character_cqi = reinforcement_character:cqi()
		local reinforcement_character_string = cm:char_lookup_str(reinforcement_character_cqi)
		if cqi == cqi_of_hirer then
		cm:teleport_to(reinforcement_character_string, viable_x, viable_y, true)
		end;
	end,
	true
);

	core:add_listener(
	"faction_turn_end_delete_reinforcements",
	"FactionTurnEnd",
	function(context) return context:faction():is_human() == true or context:faction():is_human() == false; end,
	function()
--reset cooldown for hiring armies
	local cooldown_1 = cm:get_saved_value("hired_army"); if cooldown_1 > 0 then cm:set_saved_value("hired_army", 0); out("set value of hired_army to:"); out(cm:get_saved_value("hired_army")); end;
	cm:disable_event_feed_events(true,"wh_event_category_diplomacy","","");
out("disabled event feed")	
	local faction_key = cm:get_saved_value("temp_hiring_faction")
out(faction_key)
--dwf
	local dwarves = cm:get_faction("wh_main_dwf_dwarfs_qb2");
	local dwarves_characters = dwarves:character_list()
--emp
	local empire = cm:get_faction("wh_main_emp_empire_qb3");
	local empire_characters = empire:character_list()
--bret
	local brets = cm:get_faction("wh_main_brt_bretonnia_qb2");
	local brets_characters = brets:character_list()
--vcount
	local vcount = cm:get_faction("wh_main_vmp_vampire_counts_qb3");
	local vcount_characters = vcount:character_list()
--vcoast
	local vcoast = cm:get_faction("wh2_dlc11_cst_vampire_coast_qb3");
	local vcoast_characters = vcoast:character_list()
--skaven
	local skaven = cm:get_faction("wh2_main_skv_skaven_qb4");
	local skaven_characters = skaven:character_list()
--norsca
	local norsca = cm:get_faction("wh_main_nor_norsca_qb3");
	local norsca_characters = norsca:character_list()
--highelf
	local hef = cm:get_faction("wh2_main_hef_high_elves_qb3");
	local hef_characters = hef:character_list()
--darkelf
	local def = cm:get_faction("wh2_main_def_dark_elves_qb4");
	local def_characters = def:character_list()
--lizard
	local lizards = cm:get_faction("wh2_main_lzd_lizardmen_qb3");
	local lizards_characters = lizards:character_list()
--rogue
	local rogue = cm:get_faction("wh2_main_rogue_gerhardts_mercenaries_qb1");
	local rogue_characters = rogue:character_list()
--woodelves
	local welf = cm:get_faction("wh_dlc05_wef_wood_elves_qb2");
	local welf_characters = welf:character_list()
--chaos
	local chaos = cm:get_faction("wh_main_chs_chaos_qb1");
	local chaos_characters = chaos:character_list()
--beast
	local beast = cm:get_faction("wh_dlc03_bst_beastmen_ally");
	local beast_characters = beast:character_list()
--greenskin
	local greenskin = cm:get_faction("wh_main_grn_greenskins_qb1");
	local greenskin_characters = greenskin:character_list()
--tombking
	local tombking = cm:get_faction("wh2_dlc09_tmb_tombking_qb1");
	local tombking_characters = tombking:character_list()
out("test!4")
--destroy dwarves
		cm:force_declare_war("wh_main_dwf_dwarfs_qb2", faction_key, false, false, false)
		for i = 0, dwarves_characters:num_items() - 1 do
		cm:kill_character(dwarves_characters:item_at(i):cqi(), true, false)
		end
--destroy empire
		cm:force_declare_war("wh_main_emp_empire_qb3", faction_key, false, false, false)
		for i = 0, empire_characters:num_items() - 1 do
		cm:kill_character(empire_characters:item_at(i):cqi(), true, false)
		end
--destroy bretonnia
		cm:force_declare_war("wh_main_brt_bretonnia_qb2", faction_key, false, false, false)
		for i = 0, brets_characters:num_items() - 1 do
		cm:kill_character(brets_characters:item_at(i):cqi(), true, false)
		end
--destroy vcount
		cm:force_declare_war("wh_main_vmp_vampire_counts_qb3", faction_key, false, false, false)
		for i = 0, vcount_characters:num_items() - 1 do
		cm:kill_character(vcount_characters:item_at(i):cqi(), true, false)
		end
--destroy vcoast
		cm:force_declare_war("wh2_dlc11_cst_vampire_coast_qb3", faction_key, false, false, false)
		for i = 0, vcoast_characters:num_items() - 1 do
		cm:kill_character(vcoast_characters:item_at(i):cqi(), true, false)
		end
--destroy skaven
		cm:force_declare_war("wh2_main_skv_skaven_qb4", faction_key, false, false, false)
		for i = 0, skaven_characters:num_items() - 1 do
		cm:kill_character(skaven_characters:item_at(i):cqi(), true, false)
		end
--destroy norsca
		cm:force_declare_war("wh_main_nor_norsca_qb3", faction_key, false, false, false)
		for i = 0, norsca_characters:num_items() - 1 do
		cm:kill_character(norsca_characters:item_at(i):cqi(), true, false)
		end
--destroy hef
		cm:force_declare_war("wh2_main_hef_high_elves_qb3", faction_key, false, false, false)
		for i = 0, hef_characters:num_items() - 1 do
		cm:kill_character(hef_characters:item_at(i):cqi(), true, false)
		end
--destroy def
		cm:force_declare_war("wh2_main_def_dark_elves_qb4", faction_key, false, false, false)
		for i = 0, def_characters:num_items() - 1 do
		cm:kill_character(def_characters:item_at(i):cqi(), true, false)
		end
--destroy lizards
		cm:force_declare_war("wh2_main_lzd_lizardmen_qb3", faction_key, false, false, false)
		for i = 0, lizards_characters:num_items() - 1 do
		cm:kill_character(lizards_characters:item_at(i):cqi(), true, false)
		end
--destroy rogue
		cm:force_declare_war("wh2_main_rogue_gerhardts_mercenaries_qb1", faction_key, false, false, false)
		for i = 0, rogue_characters:num_items() - 1 do
		cm:kill_character(rogue_characters:item_at(i):cqi(), true, false)
		end
--destroy welf
		cm:force_declare_war("wh_dlc05_wef_wood_elves_qb2", faction_key, false, false, false)
		for i = 0, welf_characters:num_items() - 1 do
		cm:kill_character(welf_characters:item_at(i):cqi(), true, false)
		end
--destroy chaos
		cm:force_declare_war("wh_main_chs_chaos_qb1", faction_key, false, false, false)
		for i = 0, chaos_characters:num_items() - 1 do
		cm:kill_character(chaos_characters:item_at(i):cqi(), true, false)
		end
--destroy beasts
		cm:force_declare_war("wh_dlc03_bst_beastmen_ally", faction_key, false, false, false)
		for i = 0, beast_characters:num_items() - 1 do
		cm:kill_character(beast_characters:item_at(i):cqi(), true, false)
		end
--destroy greenskin
		cm:force_declare_war("wh_main_grn_greenskins_qb1", faction_key, false, false, false)
		for i = 0, greenskin_characters:num_items() - 1 do
		cm:kill_character(greenskin_characters:item_at(i):cqi(), true, false)
		end
--destroy tombkings
		cm:force_declare_war("wh2_dlc09_tmb_tombking_qb1", faction_key, false, false, false)
		for i = 0, tombking_characters:num_items() - 1 do
		cm:kill_character(tombking_characters:item_at(i):cqi(), true, false)
		end
out("test! destroy")
	cm:callback(function() cm:disable_event_feed_events(false,"wh_event_category_diplomacy","","") end, 0.3)
out("reenabled event feed")	
end,
true
);

