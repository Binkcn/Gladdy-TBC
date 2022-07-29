local tbl_sort, select, string_lower = table.sort, select, string.lower

local GetSpellInfo = GetSpellInfo
local GetItemInfo = GetItemInfo

local Gladdy = LibStub("Gladdy")
local L = Gladdy.L
local AURA_TYPE_DEBUFF, AURA_TYPE_BUFF = AURA_TYPE_DEBUFF, AURA_TYPE_BUFF

Gladdy.expansion = "Wrath"
Gladdy.CLASSES = { "MAGE", "PRIEST", "DRUID", "SHAMAN", "PALADIN", "WARLOCK", "WARRIOR", "HUNTER", "ROGUE", "DEATHKNIGHT" }
tbl_sort(Gladdy.CLASSES)

local specBuffs = {
    -- WARRIOR
    [GetSpellInfo(56638)] = L["Arms"], -- Taste for Blood
    [GetSpellInfo(64976)] = L["Arms"], -- Juggernaut
    [GetSpellInfo(57522)] = L["Arms"], -- Enrage
    [GetSpellInfo(52437)] = L["Arms"], -- Sudden Death
    [GetSpellInfo(46857)] = L["Arms"], -- Trauma
    [GetSpellInfo(56112)] = L["Fury"], -- Furious Attacks
    [GetSpellInfo(29801)] = L["Fury"], -- Rampage
    [GetSpellInfo(46916)] = L["Fury"], -- Slam!
    [GetSpellInfo(50227)] = L["Protection"], -- Sword and Board
    [GetSpellInfo(50720)] = L["Protection"], -- Vigilance
    [GetSpellInfo(74347)] = L["Protection"], -- Silenced - Gag Order
    -- PALADIN
    [GetSpellInfo(20375)] = L["Retribution"], -- Seal of Command
    [GetSpellInfo(59578)] = L["Retribution"], -- The Art of War
    [GetSpellInfo(31836)] = L["Holy"], -- Light's Grace
    [GetSpellInfo(53563)] = L["Holy"], -- Beacon of Light
    [GetSpellInfo(54149)] = L["Holy"], -- Infusion of Light
    [GetSpellInfo(63529)] = L["Protection"], -- Silenced - Shield of the Templar
    -- ROGUE
    [GetSpellInfo(36554)] = L["Subtlety"], -- Shadowstep
    [GetSpellInfo(44373)] = L["Subtlety"], -- Shadowstep Speed
    [GetSpellInfo(36563)] = L["Subtlety"], -- Shadowstep DMG
    [GetSpellInfo(51713)] = L["Subtlety"], -- Shadow Dance
    [GetSpellInfo(31223)] = L["Subtlety"], -- Master of Subtlety
    [GetSpellInfo(14278)] = L["Subtlety"], -- Ghostly Strike
    [GetSpellInfo(51690)] = L["Combat"], -- Killing Spree
    [GetSpellInfo(13877)] = L["Combat"], -- Blade Flurry
    [GetSpellInfo(13750)] = L["Combat"], -- Adrenaline Rush
    [GetSpellInfo(14177)] = L["Assassination"], -- Cold Blood
    -- PRIEST
    [GetSpellInfo(47788)] = L["Holy"], -- Guardian Spirit
    [GetSpellInfo(52800)] = L["Discipline"], -- Borrowed Time
    [GetSpellInfo(63944)] = L["Discipline"], -- Renewed Hope
    [GetSpellInfo(15473)] = L["Shadow"], -- Shadowform
    [GetSpellInfo(15286)] = L["Shadow"], -- Vampiric Embrace
    -- DEATHKNIGHT
    [GetSpellInfo(49222)] = L["Unholy"], -- Bone Shield
    [GetSpellInfo(49016)] = L["Blood"], -- Hysteria
    [GetSpellInfo(53138)] = L["Blood"], -- Abomination's Might
    [GetSpellInfo(55610)] = L["Frost"], -- Imp. Icy Talons
    -- MAGE
    [GetSpellInfo(43039)] = L["Frost"], -- Ice Barrier
    [GetSpellInfo(74396)] = L["Frost"], -- Fingers of Frost
    [GetSpellInfo(57761)] = L["Frost"], -- Fireball!
    [GetSpellInfo(11129)] = L["Fire"], -- Combustion
    [GetSpellInfo(64346)] = L["Fire"], -- Fiery Payback
    [GetSpellInfo(48108)] = L["Fire"], -- Hot Streak
    [GetSpellInfo(54741)] = L["Fire"], -- Firestarter
    [GetSpellInfo(55360)] = L["Fire"], -- Living Bomb
    [GetSpellInfo(31583)] = L["Arcane"], -- Arcane Empowerment
    [GetSpellInfo(44413)] = L["Arcane"], -- Incanter's Absorption
    -- WARLOCK
    [GetSpellInfo(30302)] = L["Destruction"], -- Nether Protection
    [GetSpellInfo(63244)] = L["Destruction"], -- Pyroclasm
    [GetSpellInfo(54277)] = L["Destruction"], -- Backdraft
    [GetSpellInfo(47283)] = L["Destruction"], -- Empowered Imp
    [GetSpellInfo(34936)] = L["Destruction"], -- Backlash
    [GetSpellInfo(47193)] = L["Demonology"], -- Demonic Empowerment
    [GetSpellInfo(64371)] = L["Affliction"], -- Eradication
    -- SHAMAN
    [GetSpellInfo(57663)] = L["Elemental"], -- Totem of Wrath
    [GetSpellInfo(65264)] = L["Elemental"], -- Lava Flows
    [GetSpellInfo(51470)] = L["Elemental"], -- Elemental Oath
    [GetSpellInfo(52179)] = L["Elemental"], -- Astral Shift
    [GetSpellInfo(49284)] = L["Restoration"], -- Earth Shield
    [GetSpellInfo(53390)] = L["Restoration"], -- Tidal Waves
    [GetSpellInfo(30809)] = L["Enhancement"], -- Unleashed Rage
    [GetSpellInfo(53817)] = L["Enhancement"], -- Maelstrom Weapon
    [GetSpellInfo(63685)] = L["Enhancement"], -- Freeze (Frozen Power)
    -- HUNTER
    [GetSpellInfo(20895)] = L["Beast Mastery"], -- Spirit Bond
    [GetSpellInfo(19506)] = L["Marksmanship"], -- Trueshot Aura
    -- DRUID
    [GetSpellInfo(24932)] = L["Feral"], -- Leader of the Pack
    [GetSpellInfo(34123)] = L["Restoration"], -- Tree of Life
    [GetSpellInfo(24907)] = L["Balance"], -- Moonkin Aura
    [GetSpellInfo(53251)] = L["Restoration"], -- Wild Growth
}
function Gladdy:GetSpecBuffs()
    return specBuffs
end

local specSpells = {
    -- WARRIOR
    [GetSpellInfo(47486)] = L["Arms"], -- Mortal Strike
    [GetSpellInfo(46924)] = L["Arms"], -- Bladestorm
    [GetSpellInfo(23881)] = L["Fury"], -- Bloodthirst
    [GetSpellInfo(12809)] = L["Protection"], -- Concussion Blow
    [GetSpellInfo(47498)] = L["Protection"], -- Devastate
    [GetSpellInfo(46968)] = L["Protection"], -- Shockwave
    [GetSpellInfo(50720)] = L["Protection"], -- Vigilance
    -- PALADIN
    [GetSpellInfo(48827)] = L["Protection"], -- Avenger's Shield
    [GetSpellInfo(48825)] = L["Holy"], -- Holy Shock
    [GetSpellInfo(53563)] = L["Holy"], -- Beacon of Light
    [GetSpellInfo(35395)] = L["Retribution"], -- Crusader Strike
    [GetSpellInfo(66006)] = L["Retribution"], -- Divine Storm
    [GetSpellInfo(20066)] = L["Retribution"], -- Repentance
    -- ROGUE
    [GetSpellInfo(48666)] = L["Assassination"], -- Mutilate
    [GetSpellInfo(14177)] = L["Assassination"], -- Cold Blood
    [GetSpellInfo(51690)] = L["Combat"], -- Killing Spree
    [GetSpellInfo(13877)] = L["Combat"], -- Blade Flurry
    [GetSpellInfo(13750)] = L["Combat"], -- Adrenaline Rush
    [GetSpellInfo(36554)] = L["Subtlety"], -- Shadowstep
    [GetSpellInfo(48660)] = L["Subtlety"], -- Hemorrhage
    [GetSpellInfo(51713)] = L["Subtlety"], -- Shadow Dance
    -- PRIEST
    [GetSpellInfo(53007)] = L["Discipline"], -- Penance
    [GetSpellInfo(10060)] = L["Discipline"], -- Power Infusion
    [GetSpellInfo(33206)] = L["Discipline"], -- Pain Suppression
    [GetSpellInfo(34861)] = L["Holy"], -- Circle of Healing
    [GetSpellInfo(15487)] = L["Shadow"], -- Silence
    [GetSpellInfo(48160)] = L["Shadow"], -- Vampiric Touch
    -- DEATHKNIGHT
    [GetSpellInfo(55262)] = L["Blood"], -- Heart Strike
    [GetSpellInfo(49203)] = L["Frost"], -- Hungering Cold
    [GetSpellInfo(55268)] = L["Frost"], -- Frost Strike
    [GetSpellInfo(51411)] = L["Frost"], -- Howling Blast
    [GetSpellInfo(55271)] = L["Unholy"], -- Scourge Strike
    -- MAGE
    [GetSpellInfo(44781)] = L["Arcane"], -- Arcane Barrage
    [GetSpellInfo(55360)] = L["Fire"], -- Living Bomb
    [GetSpellInfo(42950)] = L["Fire"], -- Dragon's Breath
    [GetSpellInfo(42945)] = L["Fire"], -- Blast Wave
    [GetSpellInfo(44572)] = L["Frost"], -- Deep Freeze
    -- WARLOCK
    [GetSpellInfo(59164)] = L["Affliction"], -- Haunt
    [GetSpellInfo(47843)] = L["Affliction"], -- Unstable Affliction
    [GetSpellInfo(59672)] = L["Demonology"], -- Metamorphosis
    [GetSpellInfo(47193)] = L["Demonology"], -- Demonic Empowerment
    [GetSpellInfo(59172)] = L["Destruction"], -- Chaos Bolt
    [GetSpellInfo(47847)] = L["Destruction"], -- Shadowfury
    -- SHAMAN
    [GetSpellInfo(59159)] = L["Elemental"], -- Thunderstorm
    [GetSpellInfo(16166)] = L["Elemental"], -- Elemental Mastery
    [GetSpellInfo(51533)] = L["Enhancement"], -- Feral Spirit
    [GetSpellInfo(30823)] = L["Enhancement"], -- Shamanistic Rage
    [GetSpellInfo(17364)] = L["Enhancement"], -- Stormstrike
    [GetSpellInfo(61301)] = L["Restoration"], -- Riptide
    [GetSpellInfo(51886)] = L["Restoration"], -- Cleanse Spirit
    -- HUNTER
    [GetSpellInfo(19577)] = L["Beast Mastery"], -- Intimidation
    [GetSpellInfo(34490)] = L["Marksmanship"], -- Silencing Shot
    [GetSpellInfo(53209)] = L["Marksmanship"], -- Chimera Shot
    [GetSpellInfo(60053)] = L["Survival"], -- Explosive Shot
    [GetSpellInfo(49012)] = L["Survival"], -- Wyvern Sting
    -- DRUID
    [GetSpellInfo(53201)] = L["Balance"], -- Starfall
    [GetSpellInfo(61384)] = L["Balance"], -- Typhoon
    [GetSpellInfo(48566)] = L["Feral"], -- Mangle (Cat)
    [GetSpellInfo(48564)] = L["Feral"], -- Mangle (Bear)
    [GetSpellInfo(18562)] = L["Restoration"], -- Swiftmend
}
function Gladdy:GetSpecSpells()
    return specSpells
end

local importantAuras = {
    --- Crowd control
    [GetSpellInfo(33786)] = { -- Cyclone
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 33786,
    },
    [GetSpellInfo(18658)] = { -- Hibernate
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 18658,
    },
    [GetSpellInfo(14309)] = { -- Freezing Trap Effect
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 14309,
    },
    [GetSpellInfo(60210)] = { -- Freezing arrow effect
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 60210,
    },
    [GetSpellInfo(6770)] = { -- Sap
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 6770,
    },
    [GetSpellInfo(2094)] = { -- Blind
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 2094,
    },
    [GetSpellInfo(5782)] = { -- Fear
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 5782,
    },
    [GetSpellInfo(47860)] = { -- Death Coil Warlock
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 47860,
    },
    [GetSpellInfo(6358)] = { -- Seduction
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 6358,
    },
    [GetSpellInfo(5484)] = { -- Howl of Terror
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 5484,
    },
    [GetSpellInfo(5246)] = { -- Intimidating Shout
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 5246,
    },
    [GetSpellInfo(8122)] = { -- Psychic Scream
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 8122,
    },
    [GetSpellInfo(12826)] = { -- Polymorph
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 12826,
        texture = select(3, GetSpellInfo(12826)),
    },
    [GetSpellInfo(51514)] = { -- Hex
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 51514,
    },
    [GetSpellInfo(18647)] = { -- Banish
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 18647,
    },
    [GetSpellInfo(605)] = { -- Mind Control
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 605,
    },
    [GetSpellInfo(14327)] = { -- Scare Beast
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 14327,
    },

    --- Roots
    -- Entangling Roots
    [GetSpellInfo(26989)] = {
        track = AURA_TYPE_DEBUFF,
        priority = 30,
        spellID = 26989,
    },
    [select(1, GetSpellInfo(27010)) .. " " .. select(1, GetSpellInfo(16689))] = {
        track = AURA_TYPE_DEBUFF,
        priority = 30,
        spellID = 27010,
        altName = select(1, GetSpellInfo(27010)) .. " " .. select(1, GetSpellInfo(16689)),
    },
    [GetSpellInfo(42917)] = { -- Frost Nova
        track = AURA_TYPE_DEBUFF,
        priority = 30,
        spellID = 42917,
    },
    [GetSpellInfo(33395)] = { -- Freeze (Water Elemental)
        track = AURA_TYPE_DEBUFF,
        priority = 30,
        spellID = 33395,
    },
    [GetSpellInfo(16979)] = { -- Feral Charge
        track = AURA_TYPE_DEBUFF,
        priority = 30,
        spellID = 16979,
    },
    [GetSpellInfo(23694)] = { -- Improved Hamstring
        track = AURA_TYPE_DEBUFF,
        priority = 30,
        spellID = 23694,
    },
    [GetSpellInfo(4167)] = { -- Web (Hunter Pet)
        track = AURA_TYPE_DEBUFF,
        priority = 30,
        spellID = 4167,
    },

    --- Stuns and incapacitates
    [GetSpellInfo(8983)] = { -- Bash
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 8983,
    },
    [GetSpellInfo(1833)] = { -- Cheap Shot
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 1833,
    },
    [GetSpellInfo(8643)] = { -- Kidney Shot
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 8643,
    },
    [GetSpellInfo(1776)] = { -- Gouge
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 1776,
    },
    [GetSpellInfo(44572)] = { -- Deep Freeze
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 44572,
    },
    [GetSpellInfo(49012)] = { -- Wyvern Sting
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 49012,
    },
    [GetSpellInfo(19503)] = { -- Scatter Shot
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 19503,
    },
    [GetSpellInfo(49803)] = { -- Pounce
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 49803,
    },
    [GetSpellInfo(49802)] = { -- Maim
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 49802,
    },
    [GetSpellInfo(10308)] = { -- Hammer of Justice
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 10308,
    },
    [GetSpellInfo(20066)] = { -- Repentance
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 20066,
    },
    [GetSpellInfo(46968)] = { -- Shockwave
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 46968,
    },
    [GetSpellInfo(49203)] = { -- Hungering Cold
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 49203,
    },
    [GetSpellInfo(47481)] = { -- Gnaw (dk pet stun)
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 47481,
    },
    [GetSpellInfo(47847)] = { -- Shadowfury Stun
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 47847,
    },
    [GetSpellInfo(16922)] = { -- Imp Starfire Stun
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 16922,
    },
    [GetSpellInfo(5530)] = { -- Mace Stun Effect
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        texture = select(3, GetSpellInfo(12284)),
        spellID = 5530,
    },
    [GetSpellInfo(20549)] = { -- War Stomp
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 20549,
    },
    [GetSpellInfo(7922)] = { -- Charge Stun
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 7922,
        texture = select(3, GetSpellInfo(100))
    },
    [GetSpellInfo(25274)] = { -- Intercept Stun
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 25274,
        texture = select(3, GetSpellInfo(25272))
    },
    [GetSpellInfo(12809)] = { -- Concussion Blow
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 12809,
    },
    [GetSpellInfo(12355)] = { -- Impact
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 12355,
    },
    [GetSpellInfo(19577)] = {-- Intimidation
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 19577,
    },
    [GetSpellInfo(31661)] = { -- Dragon's Breath
        track = AURA_TYPE_DEBUFF,
        priority = 40,
        spellID = 31661,
    },

    --- Silences
    [GetSpellInfo(18469)] = { -- Improved Counterspell
        track = AURA_TYPE_DEBUFF,
        priority = 20,
        spellID = 18469,
    },
    [GetSpellInfo(15487)] = { -- Silence
        track = AURA_TYPE_DEBUFF,
        priority = 20,
        spellID = 15487,
    },
    [GetSpellInfo(34490)] = { -- Silencing Shot
        track = AURA_TYPE_DEBUFF,
        priority = 20,
        spellID = 34490,
    },
    [GetSpellInfo(18425)] = { -- Improved Kick
        track = AURA_TYPE_DEBUFF,
        priority = 20,
        spellID = 18425,
    },
    [GetSpellInfo(49916)] = { -- Strangulate
        track = AURA_TYPE_DEBUFF,
        priority = 20,
        spellID = 49916,
    },
    [GetSpellInfo(74347)] = { -- Silenced - Gag Order
        track = AURA_TYPE_DEBUFF,
        priority = 20,
        spellID = 74347,
    },
    [GetSpellInfo(63529)] = { -- Silenced - Shield of the Templar
        track = AURA_TYPE_DEBUFF,
        priority = 20,
        spellID = 63529,
    },
    ["Unstable Affliction Silence"] = { -- Unstable Affliction Silence (GetSpellInfo returns "Unstable Affliction")
        track = AURA_TYPE_DEBUFF,
        altName = select(1, GetSpellInfo(31117)) .. " Silence",
        priority = 20,
        spellID = 31117,
    },
    [GetSpellInfo(24259)] = { -- Spell Lock (Felhunter)
        track = AURA_TYPE_DEBUFF,
        priority = 20,
        spellID = 24259,
    },
    [GetSpellInfo(28730)] = { -- Arcane Torrent
        track = AURA_TYPE_DEBUFF,
        priority = 20,
        spellID = 28730,
    },
    [GetSpellInfo(1330)] = { -- Garrote - Silence
        track = AURA_TYPE_DEBUFF,
        priority = 20,
        spellID = 1330,
    },

    --- Disarms
    [GetSpellInfo(676)] = { -- Disarm
        track = AURA_TYPE_DEBUFF,
        priority = 20,
        spellID = 676,
    },
    [GetSpellInfo(51722)] = { -- Dismantle
        track = AURA_TYPE_DEBUFF,
        priority = 20,
        spellID = 51722,
    },
    [GetSpellInfo(53359)] = { -- Chimera Shot - Scorpid
        track = AURA_TYPE_DEBUFF,
        priority = 20,
        spellID = 53359,
    },

    --- Buffs
    [GetSpellInfo(1022)] = { -- Hand of Protection
        track = AURA_TYPE_BUFF,
        priority = 20,
        spellID = 1022,
    },
    [GetSpellInfo(1044)] = { -- Hand of Freedom
        track = AURA_TYPE_BUFF,
        priority = 20,
        spellID = 1044,
    },
    [GetSpellInfo(6940)] = { -- Hand of Sacrifice
        track = AURA_TYPE_BUFF,
        priority = 20,
        spellID = 6940,
    },
    [GetSpellInfo(64205)] = { -- Divine Sacrifice
        track = AURA_TYPE_BUFF,
        priority = 20,
        spellID = 64205,
    },
    [GetSpellInfo(53271)] = { -- Master's Call (Hunter Pet Hand of Freedom)
        track = AURA_TYPE_BUFF,
        priority = 20,
        spellID = 53271,
    },
    [GetSpellInfo(2825)] = { -- Bloodlust
        track = AURA_TYPE_BUFF,
        priority = 20,
        spellID = 2825,
    },
    [GetSpellInfo(32182)] = { -- Heroism
        track = AURA_TYPE_BUFF,
        priority = 20,
        spellID = 32182,
    },
    [GetSpellInfo(33206)] = { -- Pain Suppression
        track = AURA_TYPE_BUFF,
        priority = 20,
        spellID = 33206,
    },
    [GetSpellInfo(29166)] = { -- Innervate
        track = AURA_TYPE_BUFF,
        priority = 20,
        spellID = 29166,
    },
    [GetSpellInfo(18708)] = { -- Fel Domination
        track = AURA_TYPE_BUFF,
        priority = 20,
        spellID = 18708,
    },
    [GetSpellInfo(54428)] = { -- Divine Plea
        track = AURA_TYPE_BUFF,
        priority = 20,
        spellID = 54428,
    },
    [GetSpellInfo(31821)] = { -- Aura mastery
        track = AURA_TYPE_BUFF,
        priority = 20,
        spellID = 31821,
    },
    [GetSpellInfo(51713)] = { -- Shadow Dance
        track = AURA_TYPE_BUFF,
        priority = 20,
        spellID = 51713,
    },
    [GetSpellInfo(7744)] = { -- Will of the Forsaken
        track = AURA_TYPE_BUFF,
        priority = 20,
        spellID = 7744,
    },
    [GetSpellInfo(12292)] = { -- Death Wish
        track = AURA_TYPE_BUFF,
        priority = 15,
        spellID = 12292,
    },
    [GetSpellInfo(23920)] = { -- Spell Reflection
        track = AURA_TYPE_BUFF,
        priority = 50,
        spellID = 23920,
    },
    [GetSpellInfo(6346)] = {-- Fear Ward
        track = AURA_TYPE_BUFF,
        priority = 9,
        spellID = 6346,
    },

    --- Turtling abilities
    [GetSpellInfo(871)] = { -- Shield Wall
        track = AURA_TYPE_BUFF,
        priority = 20,
        spellID = 871,
    },
    [GetSpellInfo(48707)] = { -- Anti-Magic Shell
        track = AURA_TYPE_BUFF,
        priority = 20,
        spellID = 48707,
    },
    [GetSpellInfo(31224)] = { -- Cloak of Shadows
        track = AURA_TYPE_BUFF,
        priority = 20,
        spellID = 31224,
    },
    [GetSpellInfo(19263)] = { -- Deterrence
        track = AURA_TYPE_BUFF,
        priority = 20,
        spellID = 19263,
    },
    [GetSpellInfo(26669)] = { -- Evasion
        track = AURA_TYPE_BUFF,
        priority = 10,
        spellID = 26669,
    },

    --- Immunities
    [GetSpellInfo(34471)] = { -- The Beast Within
        track = AURA_TYPE_BUFF,
        priority = 20,
        spellID = 34471,
    },
    [GetSpellInfo(45438)] = { -- Ice Block
        track = AURA_TYPE_BUFF,
        priority = 30,
        spellID = 45438,
    },
    [GetSpellInfo(642)] = { -- Divine Shield
        track = AURA_TYPE_BUFF,
        priority = 30,
        spellID = 642,
    },

    --- Alt Stuff
    [GetSpellInfo(34709)] = { -- Shadowsight Buff
        track = AURA_TYPE_BUFF,
        duration = 15,
        priority = 15,
        magic = true,
        spellID = 34709,
    },
    [GetSpellInfo(8178)] = { -- Grounding Totem Effect
        track = AURA_TYPE_BUFF,
        duration = 0,
        priority = 15,
        spellID = 8178
    },
    [GetSpellInfo(5024)] = { -- Flee (Skull of impending Doom) -- 5024
        track = AURA_TYPE_BUFF,
        priority = 15,
        spellID = 5024,
        altName = select(1, GetSpellInfo(5024)) .. " - " .. (select(1, GetItemInfo(4984)) or "Skull of Impending Doom"),
    },
}

function Gladdy:GetImportantAuras()
    return importantAuras
end

local interrupts = {
    [GetSpellInfo(19675)] = { duration = 4, spellID = 19675, track = AURA_TYPE_DEBUFF, texture = select(3, GetSpellInfo(19675)), priority = 15 }, -- Feral Charge Effect (Druid)
    [GetSpellInfo(2139)] = { duration = 8, spellID = 2139, track = AURA_TYPE_DEBUFF, texture = select(3, GetSpellInfo(2139)), priority = 15 }, -- Counterspell (Mage)
    [GetSpellInfo(1766)] = { duration = 5, spellID = 1766, track = AURA_TYPE_DEBUFF, texture = select(3, GetSpellInfo(1766)), priority = 15 }, -- Kick (Rogue)
    [GetSpellInfo(6552)] = { duration = 4, spellID = 6552, track = AURA_TYPE_DEBUFF, texture = select(3, GetSpellInfo(6552)), priority = 15 }, -- Pummel (Warrior)
    [GetSpellInfo(72)] = { duration = 6, spellID = 72, track = AURA_TYPE_DEBUFF, texture = select(3, GetSpellInfo(72)), priority = 15 }, -- Shield Bash (Warrior)
    [GetSpellInfo(57994)] = { duration = 2, spellID = 57994, track = AURA_TYPE_DEBUFF, texture = select(3, GetSpellInfo(57994)), priority = 15 }, -- Wind Shear (Shaman)
    [GetSpellInfo(19244)] = { duration = 5, spellID = 19244, track = AURA_TYPE_DEBUFF, texture = select(3, GetSpellInfo(19244)), priority = 15 }, -- Spell Lock (Warlock
    [GetSpellInfo(47528)] = { duration = 5, spellID = 47528, track = AURA_TYPE_DEBUFF, texture = select(3, GetSpellInfo(47528)), priority = 15 }, -- Mind Freeze (Deathknight)
}
function Gladdy:GetInterrupts()
    return interrupts
end

local cooldownList = {
    -- Spell Name			   Cooldown[, Spec]
    -- Mage
    ["MAGE"] = {
        [1953] = 15, -- Blink
        [42917] = 25, -- Frost Nova
        [2139] = 24, -- Counterspell
        [55342] = 180, -- Mirror Image
        [12051] = 480, --Evocation
        [45438] = { cd = 300, [L["Frost"]] = 240, }, -- Ice Block
        [44572] = { cd = 30, spec = L["Frost"], }, -- Deep Freeze
        [12472] = { cd = 180, spec = L["Frost"], }, -- Icy Veins
        [31687] = { cd = 180, spec = L["Frost"], }, -- Summon Water Elemental
        [12043] = { cd = 120, spec = L["Arcane"], }, -- Presence of Mind
        [12042] = { cd = 180, spec = L["Arcane"], }, -- Arcane Power
        [42950] = { cd = 20, spec = L["Fire"] }, -- Dragon's Breath
        [11129] = { cd = 120, spec = L["Fire"] }, -- Combustion
        [11958] = { cd = 480, spec = L["Frost"], -- Coldsnap
                    resetCD = {
                        [12472] = true,
                        [45438] = true,
                        [42917] = true,
                        [31687] = true,
                        [44572] = true,
                    },
        },
    },

    -- Priest
    ["PRIEST"] = {
        [10890] = { cd = 27, [L["Shadow"]] = 23, }, -- Psychic Scream
        [34433] = { cd = 300, [L["Shadow"]] = 180, }, -- Shadowfiend
        [15487] = { cd = 45, spec = L["Shadow"], }, -- Silence
        [64044] = { cd = 120, spec = L["Shadow"], }, -- Psychic Horror
        [64843] = 480, -- Divine Hymn
        [64901] = 360, -- Hymn of Hope
        [32379] = 12, -- Shadow Word: Death
        [6346] = 180, -- Fear Ward
        [47585] = { cd = 75, spec = L["Shadow"], }, -- Dispersion (+ Glyph)
        [10060] = { cd = 120, spec = L["Discipline"], }, -- Power Infusion
        [33206] = { cd = 180, spec = L["Discipline"], }, -- Pain Suppression
    },

    -- Death Knight
    ["DEATHKNIGHT"] = {
        [47476] = 120, -- Strangulate
        [47528] = 10, -- Mind Freeze
        [48707] = 45, -- Anti-Magic Shell
        [48792] = 120, -- Icebound Fortitude
        [49576] = 35, -- Death Grip
        [47568] = 300, -- Empower Rune Weapon
        [48743] = 120, -- Death Pact
        [49039] = 120, -- Lichborne
        [47481] = { cd = 60, spec = L["Unholy"], }, -- Pet Gnaw
        [51052] = { cd = 120, spec = L["Unholy"], }, -- Anti-Magic Zone
        [46584] = { cd = 180, notSpec = L["Unholy"], }, -- Raise Dead
        [49206] = { cd = 180, spec = L["Unholy"], }, -- Summon Gargoyle
        [49028] = { cd = 90, spec = L["Blood"], }, -- Dancing Rune Weapon
        [49203] = { cd = 60, spec = L["Frost"], }, -- Hungering Cold
    },

    -- Druid
    ["DRUID"] = {
        [22812] = 60, -- Barkskin
        [29166] = 180, -- Innervate
        [8983] = 60, -- Bash
        [53312] = 60, -- Natures Grasp
        [48505] = { cd = 90, spec = L["Balance"], }, -- Starfall
        [50334] = { cd = 180, spec = L["Feral"], }, -- Berserk
        [17116] = { cd = 120, spec = L["Restoration"], }, -- Natures Swiftness
        [18562] = { cd = 15, spec = L["Restoration"], }, -- Swiftmend
        [33831] = { cd = 180, spec = L["Balance"], }, -- Force of Nature
    },

    -- Shaman
    ["SHAMAN"] = {
        [57994] = 6, -- Wind Shear
        [51514] = 45, -- Hex
        [8177] = 15, -- Grounding Totem
        [30823] = { cd = 60, spec = L["Enhancement"], }, -- Shamanistic Rage
        [16166] = { cd = 180, spec = L["Elemental"], }, -- Elemental Mastery
        [59159] = { cd = 45, spec = L["Elemental"], }, -- Thunderstorm
        [16188] = { cd = 120, spec = L["Restoration"], }, -- Natures Swiftness
        [51533] = { cd = 180, spec = L["Enhancement"], }, -- Feral Spirit
        [16190] = { cd = 300, spec = L["Restoration"], }, -- Mana Tide Totem
    },

    -- Paladin
    ["PALADIN"] = {
        [10278] = 300, -- Hand of Protection
        [1044] = 25, -- Hand of Freedom
        [54428] = 60, -- Divine Plea
        [6940] = 120, -- Hand of Sacrifice
        [64205] = 120, -- Divine Sacrifice
        [10308] = { cd = 60, [L["Protection"]] = 40, }, -- Hammer of Justice
        [642] = { cd = 300, -- Divine Shield
                  sharedCD = {
                      cd = 30,
                      [31884] = true,
                  },
        },
        [31884] = { cd = 180, -- Avenging Wrath
                    sharedCD = {
                        cd = 30,
                        [642] = true,
                    },
        },
        [31821] = { cd = 120, spec = L["Holy"], }, -- Aura Mastery
        [20066] = { cd = 60, spec = L["Retribution"], }, -- Repentance
        [20216] = { cd = 120, spec = L["Holy"], }, -- Divine Favor
        [31842] = { cd = 180, spec = L["Holy"], }, -- Divine Illumination
        [31935] = { cd = 30, spec = L["Protection"], }, -- Avengers Shield

    },

    -- Warlock
    ["WARLOCK"] = {
        [17928] = 40, -- Howl of Terror
        [47860] = 120, -- Death Coil
        [18708] = 180, -- Feldom
        [47996] = { cd = 30, pet = true, }, -- Intercept
        [48020] = 30, -- Demonic Circle: Port
        [19647] = { cd = 24, pet = true, }, -- Spell Lock
        [27277] = { cd = 8, pet = true, },  -- Devour Magic
        [61290] = 15,  -- Shadowflame
        [47847] = { cd = 20, spec = L["Destruction"], }, -- Shadowfury
        [17877] = { cd = 15, spec = L["Destruction"], }, -- Shadowburn
        [17962] = { cd = 10, spec = L["Destruction"], }, -- Conflagrate
        [59172] = { cd = 12, spec = L["Destruction"], }, -- Chaos Bolt
        [47241] = { cd = 180, spec = L["Demonology"], }, -- Metamorphosis
        [1122] = { cd = 600, spec = L["Demonology"], }, -- Inferno
    },

    -- Warrior
    ["WARRIOR"] = {
        [6552] = { cd = 10, -- Pummel
                   sharedCD = {
                       [72] = true,
                   },
        },
        [72] = { cd = 12, -- Shield Bash
                 sharedCD = {
                     [6552] = true,
                 },
        },
        [23920] = 10, -- Spell Reflection
        [3411] = 30, -- Intervene
        [676] = 60, -- Disarm
        [5246] = 120, -- Intimidating Shout
        [2565] = 60, -- Shield Block
        [55694] = 180, -- Enraged Regeneration
        [20230] = 300, -- Retaliation
        [1719] = 300, -- Recklessness
        [871] = 300, -- Shield Wall
        [12292] = { cd = 180, spec = L["Fury"], }, -- Death Wish
        [46924] = { cd = 90, spec = L["Arms"], }, -- Bladestorm
        [46968] = { cd = 20, spec = L["Protection"], }, -- Shockwave
        [12975] = { cd = 180, spec = L["Protection"], }, -- Last Stand
        [12809] = { cd = 30, spec = L["Protection"], }, -- Concussion Blow

    },

    -- Hunter
    ["HUNTER"] = {
        --[53548] 	= 28,    -- Crab Prin
        --[53562] 	= 40,    -- Ravager Stun

        [19503] = 30, -- Scatter Shot
        [19263] = 90, -- Deterrence
        [781] = 15, -- Disengage
        [5384] = 20, -- Feign Death
        [3045] = 20, -- Rapid Fire
        [60192] = { cd = 28, -- Freezing Arrow
                    sharedCD = {
                        [14311] = true, -- Freezing Trap
                        [13809] = true, -- Frost Trap
                    },
        },
        [14311] = { cd = 28, -- Freezing Trap
                    sharedCD = {
                        [60192] = true, -- Freezing Arrow
                        [13809] = true, -- Frost Trap
                    },
        },
        [13809] = { cd = 28, -- Frost Trap
                    sharedCD = {
                        [14311] = true, -- Freezing Trap
                        [60192] = true, -- Freezing Arrow
                    },
        },
        [34600] = { cd = 28, }, -- Snake Trap
        [34490] = { cd = 20, spec = L["Marksmanship"], }, -- Silencing Shot
        [19386] = { cd = 60, spec = L["Survival"], }, -- Wyvern Sting
        [53271] = { cd = 60, pet = true, }, -- Masters Call
        [19577] = { cd = 60, pet = true, }, -- Intimidation
        [19574] = { cd = 120, pet = true, }, -- Bestial Wrath
        [23989] = { cd = 180, -- Readiness
                    resetCD = {
                        [19503] = true, -- Scatter Shot
                        [19263] = true, -- Deterrence
                        [781] = true, -- Disengage
                        [60192] = true, -- Freezing Arrow
                        [14311] = true, -- Freezing Trap
                        [13809] = true, -- Frost Trap
                        [34600] = true, -- Snake Trap
                        [34490] = true, -- Silencing Shot
                        [19386] = true, -- Wyvern Sting
                        [53271] = true, -- Masters call
                        [19577] = true, -- Intimidation
                    },
        },
    },

    -- Rogue
    ["ROGUE"] = {
        [1766] = 10, -- Kick
        [8643] = 20, -- Kidney Shot
        [26669] = 180, -- Evasion
        [31224] = 90, -- Cloak of Shadow
        [26889] = 180, -- Vanish
        [2094] = 180, -- Blind
        [51722] = 60, -- Dismantle
        [11305] = 180, -- Sprint
        [14177] = { cd = 180, spec = L["Assassination"], }, -- Cold Blood
        [51713] = { cd = 60, spec = L["Subtlety"], }, -- Shadow Dance
        [13750] = { cd = 180, spec = L["Combat"], }, -- Adrenaline Rush
        [13877] = { cd = 120, spec = L["Combat"], }, -- Blade Flurry
        [51690] = { cd = 120, spec = L["Combat"], }, -- Killing Spree
        [36554] = { cd = 30, spec = L["Subtlety"], }, -- Shadowstep
        [14185] = { cd = 480, spec = L["Subtlety"], -- Preparation
                    resetCD = {
                        [26669] = true,
                        [11305] = true,
                        [26889] = true,
                        [14177] = true,
                        [36554] = true,
                    },
        },
    },
    ["Scourge"] = {

    },
    ["BloodElf"] = {

    },
    ["Tauren"] = {

    },
    ["Orc"] = {

    },
    ["Troll"] = {

    },
    ["NightElf"] = {

    },
    ["Draenei"] = {

    },
    ["Human"] = {

    },
    ["Gnome"] = {
    },
    ["Dwarf"] = {

    },
}
function Gladdy:GetCooldownList()
    return cooldownList
end

local racials = {
    ["Scourge"] = {
        [7744] = true, -- Will of the Forsaken
        duration = 120,
        spellName = select(1, GetSpellInfo(7744)),
        texture = select(3, GetSpellInfo(7744))
    },
    ["BloodElf"] = {
        [28730] = true, -- Arcane Torrent
        duration = 120,
        spellName = select(1, GetSpellInfo(28730)),
        texture = select(3, GetSpellInfo(28730))
    },
    ["Tauren"] = {
        [20549] = true, -- War Stomp
        duration = 120,
        spellName = select(1, GetSpellInfo(20549)),
        texture = select(3, GetSpellInfo(20549))
    },
    ["Orc"] = {
        [20572] = true,
        [33697] = true,
        [33702] = true,
        duration = 120,
        spellName = select(1, GetSpellInfo(20572)),
        texture = select(3, GetSpellInfo(20572))
    },
    ["Troll"] = {
        [26297] = true,
        duration = 180,
        spellName = select(1, GetSpellInfo(26297)),
        texture = select(3, GetSpellInfo(26297))
    },
    ["NightElf"] = {
        [58984] = true,
        duration = 120,
        spellName = select(1, GetSpellInfo(58984)),
        texture = select(3, GetSpellInfo(58984))
    },
    ["Draenei"] = {
        [28880] = true,
        duration = 180,
        spellName = select(1, GetSpellInfo(28880)),
        texture = select(3, GetSpellInfo(28880))
    },
    ["Human"] = {
        [59752] = true, -- Perception
        duration = 120,
        spellName = select(1, GetSpellInfo(59752)),
        texture = select(3, GetSpellInfo(59752))
    },
    ["Gnome"] = {
        [20589] = true, -- Escape Artist
        duration = 105,
        spellName = select(1, GetSpellInfo(20589)),
        texture = select(3, GetSpellInfo(20589))
    },
    ["Dwarf"] = {
        [20594] = true, -- Stoneform
        duration = 180,
        spellName = select(1, GetSpellInfo(20594)),
        texture = select(3, GetSpellInfo(20594))
    },
}
function Gladdy:Racials()
    return racials
end


---------------------
-- TOTEM STUFF
---------------------

local totemData = {
    -- Fire
    [string_lower("Searing Totem")] = { id = 3599, texture = select(3, GetSpellInfo(3599)), color = { r = 0, g = 0, b = 0, a = 1 } },
    [string_lower("Flametongue Totem")] = { id = 8227, texture = select(3, GetSpellInfo(8227)), color = { r = 0, g = 0, b = 0, a = 1 } },
    [string_lower("Magma Totem")] = { id = 8190, texture = select(3, GetSpellInfo(8190)), color = { r = 0, g = 0, b = 0, a = 1 }, pulse = 2 },
    [string_lower("Fire Nova Totem")] = { id = 1535, texture = select(3, GetSpellInfo(1535)), color = { r = 0, g = 0, b = 0, a = 1 }, pulse = { cd = 4, once = true } },
    [string_lower("Totem of Wrath")] = { id = 30706, texture = select(3, GetSpellInfo(30706)), color = { r = 0, g = 0, b = 0, a = 1 } },
    [string_lower("Fire Elemental Totem")] = { id = 32982, texture = select(3, GetSpellInfo(32982)), color = { r = 0, g = 0, b = 0, a = 1 } },
    [string_lower("Frost Resistance Totem")] = { id = 8181, texture = select(3, GetSpellInfo(8181)), color = { r = 0, g = 0, b = 0, a = 1 } },
    [string_lower("Totem of Wrath")] = { id = 30706, texture = select(3, GetSpellInfo(30706)), color = { r = 0, g = 0, b = 0, a = 1 } },
    -- Water
    [string_lower("Fire Resistance Totem")] = { id = 8184, texture = select(3, GetSpellInfo(8184)), color = { r = 0, g = 0, b = 0, a = 1 } },
    [string_lower("Disease Cleansing Totem")] = { id = 8170, texture = select(3, GetSpellInfo(8170)), color = { r = 0, g = 0, b = 0, a = 1 }, pulse = 5 },
    [string_lower("Healing Stream Totem")] = { id = 5394, texture = select(3, GetSpellInfo(5394)), color = { r = 0, g = 0, b = 0, a = 1 }, pulse = 2 },
    [string_lower("Mana Tide Totem")] = { id = 16190, texture = select(3, GetSpellInfo(16190)), color = { r = 0.078, g = 0.9, b = 0.16, a = 1 } },
    [string_lower("Mana Spring Totem")] = { id = 5675, texture = select(3, GetSpellInfo(5675)), color = { r = 0, g = 0, b = 0, a = 1 }, pulse = 2 },
    -- Earth
    [string_lower("Earthbind Totem")] = { id = 2484, texture = select(3, GetSpellInfo(2484)), color = { r = 0.5, g = 0.5, b = 0.5, a = 1 }, pulse = 3 },
    [string_lower("Stoneclaw Totem")] = { id = 5730, texture = select(3, GetSpellInfo(5730)), color = { r = 0, g = 0, b = 0, a = 1 }, pulse = 2 },
    [string_lower("Stoneskin Totem")] = { id = 8071, texture = select(3, GetSpellInfo(8071)), color = { r = 0, g = 0, b = 0, a = 1 } },
    [string_lower("Strength of Earth Totem")] = { id = 8075, texture = select(3, GetSpellInfo(8075)), color = { r = 0, g = 0, b = 0, a = 1 } },
    [string_lower("Earth Elemental Totem")] = { id = 33663, texture = select(3, GetSpellInfo(33663)), color = { r = 0, g = 0, b = 0, a = 1 } },
    [string_lower("Tremor Totem")] = { id = 8143, texture = select(3, GetSpellInfo(8143)), color = { r = 1, g = 0.9, b = 0.1, a = 1 }, pulse = 3 },
    -- Air
    [string_lower("Grounding Totem")] = { id = 8177, texture = select(3, GetSpellInfo(8177)), color = { r = 0, g = 0.53, b = 0.92, a = 1 } },
    [string_lower("Nature Resistance Totem")] = { id = 10595, texture = select(3, GetSpellInfo(10595)), color = { r = 0, g = 0, b = 0, a = 1 } },
    [string_lower("Windfury Totem")] = { id = 8512, texture = select(3, GetSpellInfo(8512)), color = { r = 0.96, g = 0, b = 0.07, a = 1 } },
    [string_lower("Sentry Totem")] = { id = 6495, texture = select(3, GetSpellInfo(6495)), color = { r = 0, g = 0, b = 0, a = 1 } },
    [string_lower("Wrath of Air Totem")] = { id = 3738, texture = select(3, GetSpellInfo(3738)), color = { r = 0, g = 0, b = 0, a = 1 } },
}

local totemSpellIdToPulse = {
    [GetSpellInfo(totemData[string_lower("Earthbind Totem")].id)] = totemData[string_lower("Earthbind Totem")].pulse,
    [2484] = totemData[string_lower("Earthbind Totem")].pulse,
    [GetSpellInfo(totemData[string_lower("Tremor Totem")].id)] = totemData[string_lower("Tremor Totem")].pulse,
    [8143] = totemData[string_lower("Tremor Totem")].pulse,
    --[GetSpellInfo(totemData[string_lower("Poison Cleansing Totem")].id)] = totemData[string_lower("Poison Cleansing Totem")].pulse,
    --[8166] = totemData[string_lower("Poison Cleansing Totem")].pulse,
    [GetSpellInfo(totemData[string_lower("Disease Cleansing Totem")].id)] = totemData[string_lower("Disease Cleansing Totem")].pulse,
    [8170] = totemData[string_lower("Disease Cleansing Totem")].pulse,
    [GetSpellInfo(totemData[string_lower("Fire Nova Totem")].id)] = totemData[string_lower("Fire Nova Totem")].pulse,
    [1535] = totemData[string_lower("Fire Nova Totem")].pulse, -- Rank 1
    [8498] = totemData[string_lower("Fire Nova Totem")].pulse, -- Rank 2
    [8499] = totemData[string_lower("Fire Nova Totem")].pulse, -- Rank 3
    [11314] = totemData[string_lower("Fire Nova Totem")].pulse, -- Rank 4
    [11315] = totemData[string_lower("Fire Nova Totem")].pulse, -- Rank 5
    [25546] = totemData[string_lower("Fire Nova Totem")].pulse, -- Rank 6
    [25547] = totemData[string_lower("Fire Nova Totem")].pulse, -- Rank 7
    [GetSpellInfo(totemData[string_lower("Magma Totem")].id)] = totemData[string_lower("Magma Totem")].pulse,
    [8190] = totemData[string_lower("Magma Totem")].pulse, -- Rank 1
    [10585] = totemData[string_lower("Magma Totem")].pulse, -- Rank 2
    [10586] = totemData[string_lower("Magma Totem")].pulse, -- Rank 3
    [10587] = totemData[string_lower("Magma Totem")].pulse, -- Rank 4
    [25552] = totemData[string_lower("Magma Totem")].pulse, -- Rank 5
    [GetSpellInfo(totemData[string_lower("Healing Stream Totem")].id)] = totemData[string_lower("Healing Stream Totem")].pulse,
    [5394] = totemData[string_lower("Healing Stream Totem")].pulse, -- Rank 1
    [6375] = totemData[string_lower("Healing Stream Totem")].pulse, -- Rank 2
    [6377] = totemData[string_lower("Healing Stream Totem")].pulse, -- Rank 3
    [10462] = totemData[string_lower("Healing Stream Totem")].pulse, -- Rank 4
    [10463] = totemData[string_lower("Healing Stream Totem")].pulse, -- Rank 5
    [25567] = totemData[string_lower("Healing Stream Totem")].pulse, -- Rank 6
    [GetSpellInfo(totemData[string_lower("Mana Spring Totem")].id)] = totemData[string_lower("Mana Spring Totem")].pulse,
    [5675] = totemData[string_lower("Mana Spring Totem")].pulse, -- Rank 1
    [10495] = totemData[string_lower("Mana Spring Totem")].pulse, -- Rank 2
    [10496] = totemData[string_lower("Mana Spring Totem")].pulse, -- Rank 3
    [10497] = totemData[string_lower("Mana Spring Totem")].pulse, -- Rank 4
    [25570] = totemData[string_lower("Mana Spring Totem")].pulse, -- Rank 5
    [GetSpellInfo(totemData[string_lower("Stoneclaw Totem")].id)] = totemData[string_lower("Stoneclaw Totem")].pulse,
    [5730] = totemData[string_lower("Stoneclaw Totem")].pulse, -- Rank 1
    [6390] = totemData[string_lower("Stoneclaw Totem")].pulse, -- Rank 2
    [6391] = totemData[string_lower("Stoneclaw Totem")].pulse, -- Rank 3
    [6392] = totemData[string_lower("Stoneclaw Totem")].pulse, -- Rank 4
    [10427] = totemData[string_lower("Stoneclaw Totem")].pulse, -- Rank 5
    [10428] = totemData[string_lower("Stoneclaw Totem")].pulse, -- Rank 6
    [25525] = totemData[string_lower("Stoneclaw Totem")].pulse, -- Rank 7
}

local totemNpcIdsToTotemData = {
    --fire
    [2523] = totemData[string_lower("Searing Totem")],
    [3902] = totemData[string_lower("Searing Totem")],
    [3903] = totemData[string_lower("Searing Totem")],
    [3904] = totemData[string_lower("Searing Totem")],
    [7400] = totemData[string_lower("Searing Totem")],
    [7402] = totemData[string_lower("Searing Totem")],
    [15480] = totemData[string_lower("Searing Totem")],
    [31162] = totemData[string_lower("Searing Totem")],
    [31164] = totemData[string_lower("Searing Totem")],
    [31165] = totemData[string_lower("Searing Totem")],
    [21995] = totemData[string_lower("Searing Totem")],
    [22209] = totemData[string_lower("Searing Totem")],
    [22895] = totemData[string_lower("Searing Totem")],
    [22896] = totemData[string_lower("Searing Totem")],
    [34687] = totemData[string_lower("Searing Totem")],
    [36532] = totemData[string_lower("Searing Totem")],
    [43423] = totemData[string_lower("Searing Totem")],
    [67380] = totemData[string_lower("Searing Totem")],
    [73477] = totemData[string_lower("Searing Totem")],
    [79238] = totemData[string_lower("Searing Totem")],
    [22896] = totemData[string_lower("Searing Totem")],
    [84519] = totemData[string_lower("Searing Totem")],
    [110730] = totemData[string_lower("Searing Totem")],
    [132178] = totemData[string_lower("Searing Totem")],
    [9637] = totemData[string_lower("Searing Totem")],

    [5950] = totemData[string_lower("Flametongue Totem")],
    [6012] = totemData[string_lower("Flametongue Totem")],
    [7423] = totemData[string_lower("Flametongue Totem")],
    [10557] = totemData[string_lower("Flametongue Totem")],
    [15485] = totemData[string_lower("Flametongue Totem")],
    [31132] = totemData[string_lower("Flametongue Totem")],
    [31133] = totemData[string_lower("Flametongue Totem")],
    [31158] = totemData[string_lower("Flametongue Totem")],
    [42605] = totemData[string_lower("Flametongue Totem")],

    [5929] = totemData[string_lower("Magma Totem")],
    [7464] = totemData[string_lower("Magma Totem")],
    [7465] = totemData[string_lower("Magma Totem")],
    [7466] = totemData[string_lower("Magma Totem")],
    [15484] = totemData[string_lower("Magma Totem")],
    [31166] = totemData[string_lower("Magma Totem")],
    [31167] = totemData[string_lower("Magma Totem")],
    [32887] = totemData[string_lower("Magma Totem")],
    [42211] = totemData[string_lower("Magma Totem")],
    [71335] = totemData[string_lower("Magma Totem")],
    [71925] = totemData[string_lower("Magma Totem")],
    [73085] = totemData[string_lower("Magma Totem")],
    [73093] = totemData[string_lower("Magma Totem")],
    [73268] = totemData[string_lower("Magma Totem")],
    [88971] = totemData[string_lower("Magma Totem")],
    [97369] = totemData[string_lower("Magma Totem")],
    [98676] = totemData[string_lower("Magma Totem")],

    [5879] = totemData[string_lower("Fire Nova Totem")],
    [6110] = totemData[string_lower("Fire Nova Totem")],
    [6111] = totemData[string_lower("Fire Nova Totem")],
    [7844] = totemData[string_lower("Fire Nova Totem")],
    [7845] = totemData[string_lower("Fire Nova Totem")],
    [14662] = totemData[string_lower("Fire Nova Totem")],
    [15482] = totemData[string_lower("Fire Nova Totem")],
    [15483] = totemData[string_lower("Fire Nova Totem")],
    [24320] = totemData[string_lower("Fire Nova Totem")],
    [32775] = totemData[string_lower("Fire Nova Totem")],
    [32776] = totemData[string_lower("Fire Nova Totem")],

    [17539] = totemData[string_lower("Totem of Wrath")],
    [22970] = totemData[string_lower("Totem of Wrath")],
    [22971] = totemData[string_lower("Totem of Wrath")],
    [30652] = totemData[string_lower("Totem of Wrath")],
    [30653] = totemData[string_lower("Totem of Wrath")],
    [30654] = totemData[string_lower("Totem of Wrath")],

    [15439] = totemData[string_lower("Fire Elemental Totem")],
    [40830] = totemData[string_lower("Fire Elemental Totem")],
    [41337] = totemData[string_lower("Fire Elemental Totem")],
    [41346] = totemData[string_lower("Fire Elemental Totem")],
    [72301] = totemData[string_lower("Fire Elemental Totem")],

    [5926] = totemData[string_lower("Frost Resistance Totem")],
    [7412] = totemData[string_lower("Frost Resistance Totem")],
    [7413] = totemData[string_lower("Frost Resistance Totem")],
    [15486] = totemData[string_lower("Frost Resistance Totem")],
    [31171] = totemData[string_lower("Frost Resistance Totem")],
    [31172] = totemData[string_lower("Frost Resistance Totem")],

    -- Water
    [5927] = totemData[string_lower("Fire Resistance Totem")],
    [7424] = totemData[string_lower("Fire Resistance Totem")],
    [7425] = totemData[string_lower("Fire Resistance Totem")],
    [15487] = totemData[string_lower("Fire Resistance Totem")],
    [31169] = totemData[string_lower("Fire Resistance Totem")],
    [31170] = totemData[string_lower("Fire Resistance Totem")],


    [5924] = totemData[string_lower("Disease Cleansing Totem")],

    [3527] = totemData[string_lower("Healing Stream Totem")],
    [3906] = totemData[string_lower("Healing Stream Totem")],
    [3907] = totemData[string_lower("Healing Stream Totem")],
    [3908] = totemData[string_lower("Healing Stream Totem")],
    [3909] = totemData[string_lower("Healing Stream Totem")],
    [14664] = totemData[string_lower("Healing Stream Totem")],
    [15488] = totemData[string_lower("Healing Stream Totem")],
    [18235] = totemData[string_lower("Healing Stream Totem")],
    [31181] = totemData[string_lower("Healing Stream Totem")],
    [31182] = totemData[string_lower("Healing Stream Totem")],
    [31185] = totemData[string_lower("Healing Stream Totem")],
    [34686] = totemData[string_lower("Healing Stream Totem")],
    [36542] = totemData[string_lower("Healing Stream Totem")],
    [37810] = totemData[string_lower("Healing Stream Totem")],
    [38428] = totemData[string_lower("Healing Stream Totem")],
    [47077] = totemData[string_lower("Healing Stream Totem")],
    [72309] = totemData[string_lower("Healing Stream Totem")],
    [72457] = totemData[string_lower("Healing Stream Totem")],
    [73890] = totemData[string_lower("Healing Stream Totem")],
    [74433] = totemData[string_lower("Healing Stream Totem")],
    [97508] = totemData[string_lower("Healing Stream Totem")],
    [112567] = totemData[string_lower("Healing Stream Totem")],
    [120357] = totemData[string_lower("Healing Stream Totem")],
    [128539] = totemData[string_lower("Healing Stream Totem")],
    [132049] = totemData[string_lower("Healing Stream Totem")],

    [10467] = totemData[string_lower("Mana Tide Totem")],
    [11100] = totemData[string_lower("Mana Tide Totem")],
    [11101] = totemData[string_lower("Mana Tide Totem")],
    [17061] = totemData[string_lower("Mana Tide Totem")],

    [3573] = totemData[string_lower("Mana Spring Totem")],
    [7414] = totemData[string_lower("Mana Spring Totem")],
    [7415] = totemData[string_lower("Mana Spring Totem")],
    [7416] = totemData[string_lower("Mana Spring Totem")],
    [15304] = totemData[string_lower("Mana Spring Totem")],
    [15489] = totemData[string_lower("Mana Spring Totem")],
    [31186] = totemData[string_lower("Mana Spring Totem")],
    [31189] = totemData[string_lower("Mana Spring Totem")],
    [31190] = totemData[string_lower("Mana Spring Totem")],

    -- Earth
    [2630] = totemData[string_lower("Earthbind Totem")],
    [22486] = totemData[string_lower("Earthbind Totem")],
    [40233] = totemData[string_lower("Earthbind Totem")],
    [74737] = totemData[string_lower("Earthbind Totem")],
    [79155] = totemData[string_lower("Earthbind Totem")],

    [3579] = totemData[string_lower("Stoneclaw Totem")],
    [3911] = totemData[string_lower("Stoneclaw Totem")],
    [3912] = totemData[string_lower("Stoneclaw Totem")],
    [3913] = totemData[string_lower("Stoneclaw Totem")],
    [7398] = totemData[string_lower("Stoneclaw Totem")],
    [7399] = totemData[string_lower("Stoneclaw Totem")],
    [14870] = totemData[string_lower("Stoneclaw Totem")],
    [15478] = totemData[string_lower("Stoneclaw Totem")],
    [31120] = totemData[string_lower("Stoneclaw Totem")],
    [31121] = totemData[string_lower("Stoneclaw Totem")],
    [31122] = totemData[string_lower("Stoneclaw Totem")],
    [40258] = totemData[string_lower("Stoneclaw Totem")],
    [102402] = totemData[string_lower("Stoneclaw Totem")],

    [5873] = totemData[string_lower("Stoneskin Totem")],
    [5919] = totemData[string_lower("Stoneskin Totem")],
    [5920] = totemData[string_lower("Stoneskin Totem")],
    [7366] = totemData[string_lower("Stoneskin Totem")],
    [7367] = totemData[string_lower("Stoneskin Totem")],
    [7368] = totemData[string_lower("Stoneskin Totem")],
    [14663] = totemData[string_lower("Stoneskin Totem")],
    [15470] = totemData[string_lower("Stoneskin Totem")],
    [15474] = totemData[string_lower("Stoneskin Totem")],
    [18177] = totemData[string_lower("Stoneskin Totem")],
    [21994] = totemData[string_lower("Stoneskin Totem")],
    [31175] = totemData[string_lower("Stoneskin Totem")],
    [31176] = totemData[string_lower("Stoneskin Totem")],
    [36550] = totemData[string_lower("Stoneskin Totem")],
    [40267] = totemData[string_lower("Stoneskin Totem")],
    [41967] = totemData[string_lower("Stoneskin Totem")],

    [5874] = totemData[string_lower("Strength of Earth Totem")],
    [5921] = totemData[string_lower("Strength of Earth Totem")],
    [5922] = totemData[string_lower("Strength of Earth Totem")],
    [7403] = totemData[string_lower("Strength of Earth Totem")],
    [15464] = totemData[string_lower("Strength of Earth Totem")],
    [15479] = totemData[string_lower("Strength of Earth Totem")],
    [21992] = totemData[string_lower("Strength of Earth Totem")],
    [30647] = totemData[string_lower("Strength of Earth Totem")],
    [31129] = totemData[string_lower("Strength of Earth Totem")],
    [40266] = totemData[string_lower("Strength of Earth Totem")],

    [15430] = totemData[string_lower("Earth Elemental Totem")],
    [24649] = totemData[string_lower("Earth Elemental Totem")],
    [39387] = totemData[string_lower("Earth Elemental Totem")],
    [40247] = totemData[string_lower("Earth Elemental Totem")],
    [72307] = totemData[string_lower("Earth Elemental Totem")],

    [5913] = totemData[string_lower("Tremor Totem")],
    [41938] = totemData[string_lower("Tremor Totem")],
    [41939] = totemData[string_lower("Tremor Totem")],

    -- Air
    [5925] = totemData[string_lower("Grounding Totem")],
    [128537] = totemData[string_lower("Grounding Totem")],
    [136251] = totemData[string_lower("Grounding Totem")],

    [7467] = totemData[string_lower("Nature Resistance Totem")],
    [7468] = totemData[string_lower("Nature Resistance Totem")],
    [7469] = totemData[string_lower("Nature Resistance Totem")],
    [15490] = totemData[string_lower("Nature Resistance Totem")],
    [31173] = totemData[string_lower("Nature Resistance Totem")],
    [31174] = totemData[string_lower("Nature Resistance Totem")],

    [6112] = totemData[string_lower("Windfury Totem")],
    [7483] = totemData[string_lower("Windfury Totem")],
    [7484] = totemData[string_lower("Windfury Totem")],
    [14666] = totemData[string_lower("Windfury Totem")],
    [15496] = totemData[string_lower("Windfury Totem")],
    [15497] = totemData[string_lower("Windfury Totem")],
    [22897] = totemData[string_lower("Windfury Totem")],
    [41940] = totemData[string_lower("Windfury Totem")],
    [41941] = totemData[string_lower("Windfury Totem")],
    [80703] = totemData[string_lower("Windfury Totem")],
    [105690] = totemData[string_lower("Windfury Totem")],
    [133684] = totemData[string_lower("Windfury Totem")],

    [3968] = totemData[string_lower("Sentry Totem")],
    [28938] = totemData[string_lower("Sentry Totem")],
    [40187] = totemData[string_lower("Sentry Totem")],
    [69505] = totemData[string_lower("Sentry Totem")],
    [70413] = totemData[string_lower("Sentry Totem")],
    [71145] = totemData[string_lower("Sentry Totem")],
    [147410] = totemData[string_lower("Sentry Totem")],

    [15447] = totemData[string_lower("Wrath of Air Totem")],
    [36556] = totemData[string_lower("Wrath of Air Totem")],
}

function Gladdy:GetTotemData()
    return totemData, totemNpcIdsToTotemData, totemSpellIdToPulse
end
