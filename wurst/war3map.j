globals
//globals from Table:
constant boolean LIBRARY_Table=true
integer Table__less= 0
integer Table__more= 8190
    //Configure it if you use more than 8190 "key" variables in your map (this will never happen though).
    
hashtable Table__ht= InitHashtable()
constant integer Table__sizeK=11
constant integer Table__listK=12
//endglobals from Table
//globals from TimerUtils:
constant boolean LIBRARY_TimerUtils=true
        //How to tweak timer utils:
        // USE_HASH_TABLE = true  (new blue)
        //  * SAFEST
        //  * SLOWEST (though hash tables are kind of fast)
        //
        // USE_HASH_TABLE = false, USE_FLEXIBLE_OFFSET = true  (orange)
        //  * kinda safe (except there is a limit in the number of timers)
        //  * ALMOST FAST
        //
        // USE_HASH_TABLE = false, USE_FLEXIBLE_OFFSET = false (red)
        //  * THE FASTEST (though is only  faster than the previous method
        //                  after using the optimizer on the map)
        //  * THE LEAST SAFE ( you may have to tweak OFSSET manually for it to
        //                     work)
        //
constant boolean TimerUtils__USE_HASH_TABLE= true
constant boolean TimerUtils__USE_FLEXIBLE_OFFSET= false

constant integer TimerUtils__OFFSET= 0x100000
integer TimerUtils__VOFFSET= TimerUtils__OFFSET
              
        //Timers to preload at map init:
constant integer TimerUtils__QUANTITY= 256
        
        //Changing this  to something big will allow you to keep recycling
        // timers even when there are already AN INCREDIBLE AMOUNT of timers in
        // the stack. But it will make things far slower so that's probably a bad idea...
constant integer TimerUtils__ARRAY_SIZE= 8190

// processed:         integer array TimerUtils__data[TimerUtils__ARRAY_SIZE]
hashtable TimerUtils__ht
// processed:         timer array TimerUtils__tT[TimerUtils__ARRAY_SIZE]
integer TimerUtils__tN= 0
constant integer TimerUtils__HELD=0x28829022
        //use a totally random number here, the more improbable someone uses it, the better.
        
boolean TimerUtils__didinit= false
//endglobals from TimerUtils
//globals from Wander:
constant boolean LIBRARY_Wander=true
constant real Wander___DEFAULT_TIMER_TIMEOUT= 1.0
constant string Wander___DEFAULT_ORDER_STRING= "move"
integer Wander___table
//endglobals from Wander
    // User-defined
real udg_GDD_Event= 0
real udg_GDD_Damage= 0
unit udg_GDD_DamagedUnit= null
unit udg_GDD_DamageSource= null
trigger array udg_GDD__TriggerArray
integer array udg_GDD__Integers
unit array udg_GDD__UnitArray
group udg_GDD__LeftMapGroup= null
real udg_whereToX= 0
real udg_whereToY= 0
real udg_wanderEvent= 0
unit udg_wanderer= null
integer udg_rng= 0

    // Generated
trigger gg_trg_Untitled_Trigger_001= null
trigger gg_trg_wander= null
trigger gg_trg_onInit= null
trigger gg_trg_onNew= null
trigger gg_trg_GUI_Friendly_Damage_Detection= null
trigger gg_trg_Table= null
trigger gg_trg_TimerUtils= null

trigger l__library_init

//JASSHelper struct globals:
constant integer si__Table__dex=1
constant integer si__Table__handles=2
constant integer si__Table__agents=3
constant integer si__Table__reals=4
constant integer si__Table__booleans=5
constant integer si__Table__strings=6
constant integer si__Table__integers=7
constant integer si__Table__players=8
constant integer si__Table__widgets=9
constant integer si__Table__destructables=10
constant integer si__Table__items=11
constant integer si__Table__units=12
constant integer si__Table__abilitys=13
constant integer si__Table__timers=14
constant integer si__Table__triggers=15
constant integer si__Table__triggerconditions=16
constant integer si__Table__triggeractions=17
constant integer si__Table__events=18
constant integer si__Table__forces=19
constant integer si__Table__groups=20
constant integer si__Table__locations=21
constant integer si__Table__rects=22
constant integer si__Table__boolexprs=23
constant integer si__Table__sounds=24
constant integer si__Table__effects=25
constant integer si__Table__unitpools=26
constant integer si__Table__itempools=27
constant integer si__Table__quests=28
constant integer si__Table__questitems=29
constant integer si__Table__defeatconditions=30
constant integer si__Table__timerdialogs=31
constant integer si__Table__leaderboards=32
constant integer si__Table__multiboards=33
constant integer si__Table__multiboarditems=34
constant integer si__Table__trackables=35
constant integer si__Table__dialogs=36
constant integer si__Table__buttons=37
constant integer si__Table__texttags=38
constant integer si__Table__lightnings=39
constant integer si__Table__images=40
constant integer si__Table__ubersplats=41
constant integer si__Table__regions=42
constant integer si__Table__fogstates=43
constant integer si__Table__fogmodifiers=44
constant integer si__Table__hashtables=45
constant integer si__Table=46
constant integer si__TableArray=47
integer s__TableArray_tempTable
integer s__TableArray_tempEnd
constant integer si__Wander=48
integer si__Wander_F=0
integer si__Wander_I=0
integer array si__Wander_V
unit array s__Wander_source
real array s__Wander_radius
real array s__Wander_centerX
real array s__Wander_centerY
real array s__Wander_timeout
real array s__Wander_random
string array s__Wander_order
timer array s__Wander_tmr
integer array s__TimerUtils__data
timer array s__TimerUtils__tT
trigger array st___prototype6

endglobals
native UnitAlive takes unit id returns boolean


//Generated allocator of Wander
function s__Wander__allocate takes nothing returns integer
 local integer this=si__Wander_F
    if (this!=0) then
        set si__Wander_F=si__Wander_V[this]
    else
        set si__Wander_I=si__Wander_I+1
        set this=si__Wander_I
    endif
    if (this>8190) then
        return 0
    endif

    set si__Wander_V[this]=-1
 return this
endfunction

//Generated destructor of Wander
function s__Wander_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__Wander_V[this]!=-1) then
        return
    endif
    set si__Wander_V[this]=si__Wander_F
    set si__Wander_F=this
endfunction
function sc___prototype6_execute takes integer i returns nothing

    call TriggerExecute(st___prototype6[i])
endfunction
function sc___prototype6_evaluate takes integer i returns nothing

    call TriggerEvaluate(st___prototype6[i])

endfunction

//library Table:
    
    
    function s__Table__dex__get_size takes nothing returns integer
        return Table__sizeK
    endfunction
    function s__Table__dex__get_list takes nothing returns integer
        return Table__listK
    endfunction
    
    function s__Table__handles_has takes integer this,integer key returns boolean
        return HaveSavedHandle(Table__ht, this, key)
    endfunction
    function s__Table__handles_remove takes integer this,integer key returns nothing
        call RemoveSavedHandle(Table__ht, this, key)
    endfunction
    
    function s__Table__agents__setindex takes integer this,integer key,agent value returns nothing
        call SaveAgentHandle(Table__ht, this, key, value)
    endfunction
    
    
    
//Run these textmacros to include the entire hashtable API as wrappers.
//Don't be intimidated by the number of macros - Vexorian's map optimizer is
//supposed to kill functions which inline (all of these functions inline).
//textmacro instance: NEW_ARRAY_BASIC("Real", "Real", "real")
    function s__Table__reals__getindex takes integer this,integer key returns real
        return LoadReal(Table__ht, this, key)
    endfunction
    function s__Table__reals__setindex takes integer this,integer key,real value returns nothing
        call SaveReal(Table__ht, this, key, value)
    endfunction
    function s__Table__reals_has takes integer this,integer key returns boolean
        return HaveSavedReal(Table__ht, this, key)
    endfunction
    function s__Table__reals_remove takes integer this,integer key returns nothing
        call RemoveSavedReal(Table__ht, this, key)
    endfunction
//end of: NEW_ARRAY_BASIC("Real", "Real", "real")
//textmacro instance: NEW_ARRAY_BASIC("Boolean", "Boolean", "boolean")
    function s__Table__booleans__getindex takes integer this,integer key returns boolean
        return LoadBoolean(Table__ht, this, key)
    endfunction
    function s__Table__booleans__setindex takes integer this,integer key,boolean value returns nothing
        call SaveBoolean(Table__ht, this, key, value)
    endfunction
    function s__Table__booleans_has takes integer this,integer key returns boolean
        return HaveSavedBoolean(Table__ht, this, key)
    endfunction
    function s__Table__booleans_remove takes integer this,integer key returns nothing
        call RemoveSavedBoolean(Table__ht, this, key)
    endfunction
//end of: NEW_ARRAY_BASIC("Boolean", "Boolean", "boolean")
//textmacro instance: NEW_ARRAY_BASIC("String", "Str", "string")
    function s__Table__strings__getindex takes integer this,integer key returns string
        return LoadStr(Table__ht, this, key)
    endfunction
    function s__Table__strings__setindex takes integer this,integer key,string value returns nothing
        call SaveStr(Table__ht, this, key, value)
    endfunction
    function s__Table__strings_has takes integer this,integer key returns boolean
        return HaveSavedString(Table__ht, this, key)
    endfunction
    function s__Table__strings_remove takes integer this,integer key returns nothing
        call RemoveSavedString(Table__ht, this, key)
    endfunction
//end of: NEW_ARRAY_BASIC("String", "Str", "string")
//New textmacro to allow table.integer[] syntax for compatibility with textmacros that might desire it.
//textmacro instance: NEW_ARRAY_BASIC("Integer", "Integer", "integer")
    function s__Table__integers__getindex takes integer this,integer key returns integer
        return LoadInteger(Table__ht, this, key)
    endfunction
    function s__Table__integers__setindex takes integer this,integer key,integer value returns nothing
        call SaveInteger(Table__ht, this, key, value)
    endfunction
    function s__Table__integers_has takes integer this,integer key returns boolean
        return HaveSavedInteger(Table__ht, this, key)
    endfunction
    function s__Table__integers_remove takes integer this,integer key returns nothing
        call RemoveSavedInteger(Table__ht, this, key)
    endfunction
//end of: NEW_ARRAY_BASIC("Integer", "Integer", "integer")
    
//textmacro instance: NEW_ARRAY("Player", "player")
    function s__Table__players__getindex takes integer this,integer key returns player
        return LoadPlayerHandle(Table__ht, this, key)
    endfunction
    function s__Table__players__setindex takes integer this,integer key,player value returns nothing
        call SavePlayerHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Player", "player")
//textmacro instance: NEW_ARRAY("Widget", "widget")
    function s__Table__widgets__getindex takes integer this,integer key returns widget
        return LoadWidgetHandle(Table__ht, this, key)
    endfunction
    function s__Table__widgets__setindex takes integer this,integer key,widget value returns nothing
        call SaveWidgetHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Widget", "widget")
//textmacro instance: NEW_ARRAY("Destructable", "destructable")
    function s__Table__destructables__getindex takes integer this,integer key returns destructable
        return LoadDestructableHandle(Table__ht, this, key)
    endfunction
    function s__Table__destructables__setindex takes integer this,integer key,destructable value returns nothing
        call SaveDestructableHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Destructable", "destructable")
//textmacro instance: NEW_ARRAY("Item", "item")
    function s__Table__items__getindex takes integer this,integer key returns item
        return LoadItemHandle(Table__ht, this, key)
    endfunction
    function s__Table__items__setindex takes integer this,integer key,item value returns nothing
        call SaveItemHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Item", "item")
//textmacro instance: NEW_ARRAY("Unit", "unit")
    function s__Table__units__getindex takes integer this,integer key returns unit
        return LoadUnitHandle(Table__ht, this, key)
    endfunction
    function s__Table__units__setindex takes integer this,integer key,unit value returns nothing
        call SaveUnitHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Unit", "unit")
//textmacro instance: NEW_ARRAY("Ability", "ability")
    function s__Table__abilitys__getindex takes integer this,integer key returns ability
        return LoadAbilityHandle(Table__ht, this, key)
    endfunction
    function s__Table__abilitys__setindex takes integer this,integer key,ability value returns nothing
        call SaveAbilityHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Ability", "ability")
//textmacro instance: NEW_ARRAY("Timer", "timer")
    function s__Table__timers__getindex takes integer this,integer key returns timer
        return LoadTimerHandle(Table__ht, this, key)
    endfunction
    function s__Table__timers__setindex takes integer this,integer key,timer value returns nothing
        call SaveTimerHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Timer", "timer")
//textmacro instance: NEW_ARRAY("Trigger", "trigger")
    function s__Table__triggers__getindex takes integer this,integer key returns trigger
        return LoadTriggerHandle(Table__ht, this, key)
    endfunction
    function s__Table__triggers__setindex takes integer this,integer key,trigger value returns nothing
        call SaveTriggerHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Trigger", "trigger")
//textmacro instance: NEW_ARRAY("TriggerCondition", "triggercondition")
    function s__Table__triggerconditions__getindex takes integer this,integer key returns triggercondition
        return LoadTriggerConditionHandle(Table__ht, this, key)
    endfunction
    function s__Table__triggerconditions__setindex takes integer this,integer key,triggercondition value returns nothing
        call SaveTriggerConditionHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("TriggerCondition", "triggercondition")
//textmacro instance: NEW_ARRAY("TriggerAction", "triggeraction")
    function s__Table__triggeractions__getindex takes integer this,integer key returns triggeraction
        return LoadTriggerActionHandle(Table__ht, this, key)
    endfunction
    function s__Table__triggeractions__setindex takes integer this,integer key,triggeraction value returns nothing
        call SaveTriggerActionHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("TriggerAction", "triggeraction")
//textmacro instance: NEW_ARRAY("TriggerEvent", "event")
    function s__Table__events__getindex takes integer this,integer key returns event
        return LoadTriggerEventHandle(Table__ht, this, key)
    endfunction
    function s__Table__events__setindex takes integer this,integer key,event value returns nothing
        call SaveTriggerEventHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("TriggerEvent", "event")
//textmacro instance: NEW_ARRAY("Force", "force")
    function s__Table__forces__getindex takes integer this,integer key returns force
        return LoadForceHandle(Table__ht, this, key)
    endfunction
    function s__Table__forces__setindex takes integer this,integer key,force value returns nothing
        call SaveForceHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Force", "force")
//textmacro instance: NEW_ARRAY("Group", "group")
    function s__Table__groups__getindex takes integer this,integer key returns group
        return LoadGroupHandle(Table__ht, this, key)
    endfunction
    function s__Table__groups__setindex takes integer this,integer key,group value returns nothing
        call SaveGroupHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Group", "group")
//textmacro instance: NEW_ARRAY("Location", "location")
    function s__Table__locations__getindex takes integer this,integer key returns location
        return LoadLocationHandle(Table__ht, this, key)
    endfunction
    function s__Table__locations__setindex takes integer this,integer key,location value returns nothing
        call SaveLocationHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Location", "location")
//textmacro instance: NEW_ARRAY("Rect", "rect")
    function s__Table__rects__getindex takes integer this,integer key returns rect
        return LoadRectHandle(Table__ht, this, key)
    endfunction
    function s__Table__rects__setindex takes integer this,integer key,rect value returns nothing
        call SaveRectHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Rect", "rect")
//textmacro instance: NEW_ARRAY("BooleanExpr", "boolexpr")
    function s__Table__boolexprs__getindex takes integer this,integer key returns boolexpr
        return LoadBooleanExprHandle(Table__ht, this, key)
    endfunction
    function s__Table__boolexprs__setindex takes integer this,integer key,boolexpr value returns nothing
        call SaveBooleanExprHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("BooleanExpr", "boolexpr")
//textmacro instance: NEW_ARRAY("Sound", "sound")
    function s__Table__sounds__getindex takes integer this,integer key returns sound
        return LoadSoundHandle(Table__ht, this, key)
    endfunction
    function s__Table__sounds__setindex takes integer this,integer key,sound value returns nothing
        call SaveSoundHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Sound", "sound")
//textmacro instance: NEW_ARRAY("Effect", "effect")
    function s__Table__effects__getindex takes integer this,integer key returns effect
        return LoadEffectHandle(Table__ht, this, key)
    endfunction
    function s__Table__effects__setindex takes integer this,integer key,effect value returns nothing
        call SaveEffectHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Effect", "effect")
//textmacro instance: NEW_ARRAY("UnitPool", "unitpool")
    function s__Table__unitpools__getindex takes integer this,integer key returns unitpool
        return LoadUnitPoolHandle(Table__ht, this, key)
    endfunction
    function s__Table__unitpools__setindex takes integer this,integer key,unitpool value returns nothing
        call SaveUnitPoolHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("UnitPool", "unitpool")
//textmacro instance: NEW_ARRAY("ItemPool", "itempool")
    function s__Table__itempools__getindex takes integer this,integer key returns itempool
        return LoadItemPoolHandle(Table__ht, this, key)
    endfunction
    function s__Table__itempools__setindex takes integer this,integer key,itempool value returns nothing
        call SaveItemPoolHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("ItemPool", "itempool")
//textmacro instance: NEW_ARRAY("Quest", "quest")
    function s__Table__quests__getindex takes integer this,integer key returns quest
        return LoadQuestHandle(Table__ht, this, key)
    endfunction
    function s__Table__quests__setindex takes integer this,integer key,quest value returns nothing
        call SaveQuestHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Quest", "quest")
//textmacro instance: NEW_ARRAY("QuestItem", "questitem")
    function s__Table__questitems__getindex takes integer this,integer key returns questitem
        return LoadQuestItemHandle(Table__ht, this, key)
    endfunction
    function s__Table__questitems__setindex takes integer this,integer key,questitem value returns nothing
        call SaveQuestItemHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("QuestItem", "questitem")
//textmacro instance: NEW_ARRAY("DefeatCondition", "defeatcondition")
    function s__Table__defeatconditions__getindex takes integer this,integer key returns defeatcondition
        return LoadDefeatConditionHandle(Table__ht, this, key)
    endfunction
    function s__Table__defeatconditions__setindex takes integer this,integer key,defeatcondition value returns nothing
        call SaveDefeatConditionHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("DefeatCondition", "defeatcondition")
//textmacro instance: NEW_ARRAY("TimerDialog", "timerdialog")
    function s__Table__timerdialogs__getindex takes integer this,integer key returns timerdialog
        return LoadTimerDialogHandle(Table__ht, this, key)
    endfunction
    function s__Table__timerdialogs__setindex takes integer this,integer key,timerdialog value returns nothing
        call SaveTimerDialogHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("TimerDialog", "timerdialog")
//textmacro instance: NEW_ARRAY("Leaderboard", "leaderboard")
    function s__Table__leaderboards__getindex takes integer this,integer key returns leaderboard
        return LoadLeaderboardHandle(Table__ht, this, key)
    endfunction
    function s__Table__leaderboards__setindex takes integer this,integer key,leaderboard value returns nothing
        call SaveLeaderboardHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Leaderboard", "leaderboard")
//textmacro instance: NEW_ARRAY("Multiboard", "multiboard")
    function s__Table__multiboards__getindex takes integer this,integer key returns multiboard
        return LoadMultiboardHandle(Table__ht, this, key)
    endfunction
    function s__Table__multiboards__setindex takes integer this,integer key,multiboard value returns nothing
        call SaveMultiboardHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Multiboard", "multiboard")
//textmacro instance: NEW_ARRAY("MultiboardItem", "multiboarditem")
    function s__Table__multiboarditems__getindex takes integer this,integer key returns multiboarditem
        return LoadMultiboardItemHandle(Table__ht, this, key)
    endfunction
    function s__Table__multiboarditems__setindex takes integer this,integer key,multiboarditem value returns nothing
        call SaveMultiboardItemHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("MultiboardItem", "multiboarditem")
//textmacro instance: NEW_ARRAY("Trackable", "trackable")
    function s__Table__trackables__getindex takes integer this,integer key returns trackable
        return LoadTrackableHandle(Table__ht, this, key)
    endfunction
    function s__Table__trackables__setindex takes integer this,integer key,trackable value returns nothing
        call SaveTrackableHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Trackable", "trackable")
//textmacro instance: NEW_ARRAY("Dialog", "dialog")
    function s__Table__dialogs__getindex takes integer this,integer key returns dialog
        return LoadDialogHandle(Table__ht, this, key)
    endfunction
    function s__Table__dialogs__setindex takes integer this,integer key,dialog value returns nothing
        call SaveDialogHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Dialog", "dialog")
//textmacro instance: NEW_ARRAY("Button", "button")
    function s__Table__buttons__getindex takes integer this,integer key returns button
        return LoadButtonHandle(Table__ht, this, key)
    endfunction
    function s__Table__buttons__setindex takes integer this,integer key,button value returns nothing
        call SaveButtonHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Button", "button")
//textmacro instance: NEW_ARRAY("TextTag", "texttag")
    function s__Table__texttags__getindex takes integer this,integer key returns texttag
        return LoadTextTagHandle(Table__ht, this, key)
    endfunction
    function s__Table__texttags__setindex takes integer this,integer key,texttag value returns nothing
        call SaveTextTagHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("TextTag", "texttag")
//textmacro instance: NEW_ARRAY("Lightning", "lightning")
    function s__Table__lightnings__getindex takes integer this,integer key returns lightning
        return LoadLightningHandle(Table__ht, this, key)
    endfunction
    function s__Table__lightnings__setindex takes integer this,integer key,lightning value returns nothing
        call SaveLightningHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Lightning", "lightning")
//textmacro instance: NEW_ARRAY("Image", "image")
    function s__Table__images__getindex takes integer this,integer key returns image
        return LoadImageHandle(Table__ht, this, key)
    endfunction
    function s__Table__images__setindex takes integer this,integer key,image value returns nothing
        call SaveImageHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Image", "image")
//textmacro instance: NEW_ARRAY("Ubersplat", "ubersplat")
    function s__Table__ubersplats__getindex takes integer this,integer key returns ubersplat
        return LoadUbersplatHandle(Table__ht, this, key)
    endfunction
    function s__Table__ubersplats__setindex takes integer this,integer key,ubersplat value returns nothing
        call SaveUbersplatHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Ubersplat", "ubersplat")
//textmacro instance: NEW_ARRAY("Region", "region")
    function s__Table__regions__getindex takes integer this,integer key returns region
        return LoadRegionHandle(Table__ht, this, key)
    endfunction
    function s__Table__regions__setindex takes integer this,integer key,region value returns nothing
        call SaveRegionHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Region", "region")
//textmacro instance: NEW_ARRAY("FogState", "fogstate")
    function s__Table__fogstates__getindex takes integer this,integer key returns fogstate
        return LoadFogStateHandle(Table__ht, this, key)
    endfunction
    function s__Table__fogstates__setindex takes integer this,integer key,fogstate value returns nothing
        call SaveFogStateHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("FogState", "fogstate")
//textmacro instance: NEW_ARRAY("FogModifier", "fogmodifier")
    function s__Table__fogmodifiers__getindex takes integer this,integer key returns fogmodifier
        return LoadFogModifierHandle(Table__ht, this, key)
    endfunction
    function s__Table__fogmodifiers__setindex takes integer this,integer key,fogmodifier value returns nothing
        call SaveFogModifierHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("FogModifier", "fogmodifier")
//textmacro instance: NEW_ARRAY("Hashtable", "hashtable")
    function s__Table__hashtables__getindex takes integer this,integer key returns hashtable
        return LoadHashtableHandle(Table__ht, this, key)
    endfunction
    function s__Table__hashtables__setindex takes integer this,integer key,hashtable value returns nothing
        call SaveHashtableHandle(Table__ht, this, key, value)
    endfunction
//end of: NEW_ARRAY("Hashtable", "hashtable")
    
    
    // Implement modules for intuitive syntax (tb.handle; tb.unit; etc.)
//Implemented from module Table__realm:
    function s__Table__get_real takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__integerm:
    function s__Table__get_integer takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__booleanm:
    function s__Table__get_boolean takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__stringm:
    function s__Table__get_string takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__playerm:
    function s__Table__get_player takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__widgetm:
    function s__Table__get_widget takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__destructablem:
    function s__Table__get_destructable takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__itemm:
    function s__Table__get_item takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__unitm:
    function s__Table__get_unit takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__abilitym:
    function s__Table__get_ability takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__timerm:
    function s__Table__get_timer takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__triggerm:
    function s__Table__get_trigger takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__triggerconditionm:
    function s__Table__get_triggercondition takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__triggeractionm:
    function s__Table__get_triggeraction takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__eventm:
    function s__Table__get_event takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__forcem:
    function s__Table__get_force takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__groupm:
    function s__Table__get_group takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__locationm:
    function s__Table__get_location takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__rectm:
    function s__Table__get_rect takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__boolexprm:
    function s__Table__get_boolexpr takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__soundm:
    function s__Table__get_sound takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__effectm:
    function s__Table__get_effect takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__unitpoolm:
    function s__Table__get_unitpool takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__itempoolm:
    function s__Table__get_itempool takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__questm:
    function s__Table__get_quest takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__questitemm:
    function s__Table__get_questitem takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__defeatconditionm:
    function s__Table__get_defeatcondition takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__timerdialogm:
    function s__Table__get_timerdialog takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__leaderboardm:
    function s__Table__get_leaderboard takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__multiboardm:
    function s__Table__get_multiboard takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__multiboarditemm:
    function s__Table__get_multiboarditem takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__trackablem:
    function s__Table__get_trackable takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__dialogm:
    function s__Table__get_dialog takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__buttonm:
    function s__Table__get_button takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__texttagm:
    function s__Table__get_texttag takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__lightningm:
    function s__Table__get_lightning takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__imagem:
    function s__Table__get_image takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__ubersplatm:
    function s__Table__get_ubersplat takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__regionm:
    function s__Table__get_region takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__fogstatem:
    function s__Table__get_fogstate takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__fogmodifierm:
    function s__Table__get_fogmodifier takes integer this returns integer
        return this
    endfunction
//Implemented from module Table__hashtablem:
    function s__Table__get_hashtable takes integer this returns integer
        return this
    endfunction
    
    function s__Table__get_handle takes integer this returns integer
        return this
    endfunction
    
    function s__Table__get_agent takes integer this returns integer
        return this
    endfunction
    
    //set this = tb[GetSpellAbilityId()]
    function s__Table__getindex takes integer this,integer key returns integer
        return LoadInteger(Table__ht, this, key)
    endfunction
    
    //set tb[389034] = 8192
    function s__Table__setindex takes integer this,integer key,integer tb returns nothing
        call SaveInteger(Table__ht, this, key, tb)
    endfunction
    
    //set b = tb.has(2493223)
    function s__Table_has takes integer this,integer key returns boolean
        return HaveSavedInteger(Table__ht, this, key)
    endfunction
    
    //call tb.remove(294080)
    function s__Table_remove takes integer this,integer key returns nothing
        call RemoveSavedInteger(Table__ht, this, key)
    endfunction
    
    //Remove all data from a Table instance
    function s__Table_flush takes integer this returns nothing
        call FlushChildHashtable(Table__ht, this)
    endfunction
    
    //local Table tb = Table.create()
    function s__Table_create takes nothing returns integer
        local integer this= (LoadInteger(Table__ht, ((Table__listK)), (0))) // INLINED!!
        
        if this == 0 then
            set this=Table__more + 1
            set Table__more=this
        else
            call SaveInteger(Table__ht, ((Table__listK)), (0), ( (LoadInteger(Table__ht, ((Table__listK)), (this))))) // INLINED!!
            call RemoveSavedInteger(Table__ht, ((Table__listK)), (this)) //Clear hashed memory // INLINED!!
        endif
        
        return this
    endfunction
    
    // Removes all data from a Table instance and recycles its index.
    //
    //     call tb.destroy()
    //
    function s__Table_destroy takes integer this returns nothing
        
        call FlushChildHashtable(Table__ht, (this)) // INLINED!!
        
        call SaveInteger(Table__ht, ((Table__listK)), (this), ( (LoadInteger(Table__ht, ((Table__listK)), (0))))) // INLINED!!
        call SaveInteger(Table__ht, ((Table__listK)), (0), ( this)) // INLINED!!
    endfunction
    
//ignored textmacro command: TABLE_BC_METHODS()
    
//ignored textmacro command: TABLE_BC_STRUCTS()
    
    
    //Returns a new TableArray to do your bidding. Simply use:
    //
    //    local TableArray ta = TableArray[array_size]
    //
    function s__TableArray__staticgetindex takes integer array_size returns integer
        local integer tb= (LoadInteger(Table__ht, ((Table__sizeK)), (array_size))) // INLINED!!
        local integer this= (LoadInteger(Table__ht, (tb), (0))) // INLINED!!
        
        
        if this == 0 then
            set this=Table__less - array_size
            set Table__less=this
        else
            call SaveInteger(Table__ht, (tb), (0), ( (LoadInteger(Table__ht, (tb), (this))))) //Set the last destroyed to the last-last destroyed // INLINED!!
            call RemoveSavedInteger(Table__ht, (tb), (this)) //Clear hashed memory // INLINED!!
        endif
        
        call SaveInteger(Table__ht, ((Table__sizeK)), (this), ( array_size)) //This remembers the array size // INLINED!!
        return this
    endfunction
    
    //Returns the size of the TableArray
    function s__TableArray__get_size takes integer this returns integer
        return (LoadInteger(Table__ht, ((Table__sizeK)), (this))) // INLINED!!
    endfunction
    
    //This magic method enables two-dimensional[array][syntax] for Tables,
    //similar to the two-dimensional utility provided by hashtables them-
    //selves.
    //
    //ta[integer a].unit[integer b] = unit u
    //ta[integer a][integer c] = integer d
    //
    //Inline-friendly when not running in debug mode
    //
    function s__TableArray__getindex takes integer this,integer key returns integer










        return this + key
    endfunction
    
    //Destroys a TableArray without flushing it; I assume you call .flush()
    //if you want it flushed too. This is a public method so that you don't
    //have to loop through all TableArray indices to flush them if you don't
    //need to (ie. if you were flushing all child-keys as you used them).
    //
    function s__TableArray_destroy takes integer this returns nothing
        local integer tb= (LoadInteger(Table__ht, ((Table__sizeK)), ((LoadInteger(Table__ht, ((Table__sizeK)), ((this))))))) // INLINED!!
        
        
        if tb == 0 then
            //Create a Table to index recycled instances with their array size
            set tb=s__Table_create()
            call SaveInteger(Table__ht, ((Table__sizeK)), ((LoadInteger(Table__ht, ((Table__sizeK)), ((this))))), ( tb)) // INLINED!!
        endif
        
        call RemoveSavedInteger(Table__ht, ((Table__sizeK)), (this)) //Clear the array size from hash memory // INLINED!!
        
        call SaveInteger(Table__ht, (tb), (this), ( (LoadInteger(Table__ht, (tb), (0))))) // INLINED!!
        call SaveInteger(Table__ht, (tb), (0), ( this)) // INLINED!!
    endfunction
    
    
    //Avoids hitting the op limit
    function s__TableArray_clean takes nothing returns nothing
        local integer tb= s__TableArray_tempTable
        local integer end= tb + 0x1000
        if end < s__TableArray_tempEnd then
            set s__TableArray_tempTable=end
            call ForForce(bj_FORCE_PLAYER[0], function s__TableArray_clean)
        else
            set end=s__TableArray_tempEnd
        endif
        loop
            call FlushChildHashtable(Table__ht, (tb)) // INLINED!!
            set tb=tb + 1
            exitwhen tb == end
        endloop
    endfunction
    
    //Flushes the TableArray and also destroys it. Doesn't get any more
    //similar to the FlushParentHashtable native than this.
    //
    function s__TableArray_flush takes integer this returns nothing
        set s__TableArray_tempTable=this
        set s__TableArray_tempEnd=this + (LoadInteger(Table__ht, ((Table__sizeK)), ((this)))) // INLINED!!
        call ForForce(bj_FORCE_PLAYER[0], function s__TableArray_clean)
        call s__TableArray_destroy(this)
    endfunction
    
    

//library Table ends
//library TimerUtils:
//*********************************************************************
//* TimerUtils (red+blue+orange flavors for 1.24b+) 2.0
//* ----------
//*
//*  To implement it , create a custom text trigger called TimerUtils
//* and paste the contents of this script there.
//*
//*  To copy from a map to another, copy the trigger holding this
//* library to your map.
//*
//* (requires vJass)   More scripts: htt://www.wc3c.net
//*
//* For your timer needs:
//*  * Attaching
//*  * Recycling (with double-free protection)
//*
//* set t=NewTimer()      : Get a timer (alternative to CreateTimer)
//* set t=NewTimerEx(x)   : Get a timer (alternative to CreateTimer), call
//*                            Initialize timer data as x, instead of 0.
//*
//* ReleaseTimer(t)       : Relese a timer (alt to DestroyTimer)
//* SetTimerData(t,2)     : Attach value 2 to timer
//* GetTimerData(t)       : Get the timer's value.
//*                         You can assume a timer's value is 0
//*                         after NewTimer.
//*
//* Multi-flavor:
//*    Set USE_HASH_TABLE to true if you don't want to complicate your life.
//*
//* If you like speed and giberish try learning about the other flavors.
//*
//********************************************************************

//================================================================

    //==================================================================================================
    
    

    //It is dependent on jasshelper's recent inlining optimization in order to perform correctly.
    function SetTimerData takes timer t,integer value returns nothing

            // new blue
            call SaveInteger(TimerUtils__ht, 0, GetHandleId(t), value)
            

















    endfunction

    function GetTimerData takes timer t returns integer

            // new blue
            return LoadInteger(TimerUtils__ht, 0, GetHandleId(t))
            

















    endfunction

    //==========================================================================================

    //==========================================================================================
    // I needed to decide between duplicating code ignoring the "Once and only once" rule
    // and using the ugly textmacros. I guess textmacros won.
    //

    function NewTimerEx takes integer value returns timer
        if ( TimerUtils__tN == 0 ) then
            if ( not TimerUtils__didinit ) then
                //This extra if shouldn't represent a major performance drawback
                //because QUANTITY rule is not supposed to be broken every day. 
                call TriggerEvaluate(st___prototype6[(1)]) // INLINED!!
                set TimerUtils__tN=TimerUtils__tN - 1
            else
                //If this happens then the QUANTITY rule has already been broken, try to fix the
                // issue, else fail.
                set s__TimerUtils__tT[0]= CreateTimer()















            endif
        else
            set TimerUtils__tN=TimerUtils__tN - 1
        endif
        call SaveInteger(TimerUtils__ht, 0, GetHandleId((s__TimerUtils__tT[TimerUtils__tN] )), ( value)) // INLINED!!
     return s__TimerUtils__tT[TimerUtils__tN]
    endfunction
    
    function NewTimer takes nothing returns timer
        return NewTimerEx(0)
    endfunction


    //==========================================================================================
    function ReleaseTimer takes timer t returns nothing
        if ( t == null ) then
            return
        endif
        if ( TimerUtils__tN == TimerUtils__ARRAY_SIZE ) then
            //stack is full, the map already has much more troubles than the chance of bug
            call DestroyTimer(t)
        else
            call PauseTimer(t)
            if ( (LoadInteger(TimerUtils__ht, 0, GetHandleId((t)))) == TimerUtils__HELD ) then // INLINED!!
                return
            endif
            call SaveInteger(TimerUtils__ht, 0, GetHandleId((t )), ( TimerUtils__HELD)) // INLINED!!
            set s__TimerUtils__tT[TimerUtils__tN]= t
            set TimerUtils__tN=TimerUtils__tN + 1
        endif
    endfunction

    function TimerUtils__init takes nothing returns nothing
     local integer i=0
     local integer o=- 1
     local boolean oops= false
        if ( TimerUtils__didinit ) then
            return
        else
            set TimerUtils__didinit=true
        endif
     

            set TimerUtils__ht=InitHashtable()
            loop
                exitwhen ( i == TimerUtils__QUANTITY )
                set s__TimerUtils__tT[i]= CreateTimer()
                call SaveInteger(TimerUtils__ht, 0, GetHandleId((s__TimerUtils__tT[i] )), ( TimerUtils__HELD)) // INLINED!!
                set i=i + 1
            endloop
            set TimerUtils__tN=TimerUtils__QUANTITY










































    endfunction


//library TimerUtils ends
//library Wander:
//==================================================================
// Version: 1.4.2
// Author: BPower
//==================================================================
// Libary Wander mimics the native Wander ability, while
// granting advanced controll over the unit movement.
//==================================================================
// Credits to:
//     Vexorian for TimerUtils    -    wc3c.net/showthread.php?t=101322
//     Bribe for Table            -    hiveworkshop.com/forums/jass-resources-412/snippet-new-table-188084/
//==================================================================
// API:
//
//    Methods:
//
//        static method operator [] takes unit whichUnit returns thistype
//
//        static method create takes unit whichUnit, real range, real cooldown returns thistype
//
//        method destroy takes nothing returns nothing
//
//        method exists takes nothing returns boolean
//
//        method pause takes nothing returns nothing
//
//        method resume takes nothing returns nothing
//
//    Fields:
//
//        readonly unit   source
//                 real   radius
//                 real   centerX
//                 real   centerY
//                 real   timeout ( The timer timeout )
//                 real   random  ( Optionally adds a random interval to the timer timeout )
//                 string order   ( Either "move" or "attack" are recommended )
//
//==================================================================
// User settings:

    
//==================================================================
// Wander code. Make changes carefully.
//==================================================================
    
    

    function Wander___Random takes nothing returns real
        return GetRandomReal(0., 1.)
    endfunction
    
        // implement Alloc
        //
        // Struct members:
                 
        
        function s__Wander__get_exists takes integer this returns boolean
            return s__Wander_tmr[this] != null
        endfunction
        
        function s__Wander__staticgetindex takes unit whichUnit returns integer
            return (LoadInteger(Table__ht, (Wander___table), (GetHandleId(whichUnit)))) // INLINED!!
        endfunction
        
        function s__Wander_pause takes integer this returns nothing
            call PauseTimer(s__Wander_tmr[this])
        endfunction
        
        function s__Wander_resume takes integer this returns nothing
            call ResumeTimer(s__Wander_tmr[this])
        endfunction
            
        function s__Wander_destroy takes integer this returns nothing
            if not (s__Wander_tmr[(this)] != null) then // INLINED!!
                return
            endif
            
            call s__Wander_deallocate(this)
            call RemoveSavedInteger(Table__ht, (Wander___table), (GetHandleId(s__Wander_source[this]))) // INLINED!!

                call ReleaseTimer(s__Wander_tmr[this])




            
            set s__Wander_source[this]=null
            set s__Wander_tmr[this]=null
        endfunction
        
        function s__Wander_issueWander takes integer this returns boolean
            local real t= (GetRandomReal(0., 1.)) * 2 * bj_PI // INLINED!!
            local real r= (GetRandomReal(0., 1.)) + (GetRandomReal(0., 1.)) // INLINED!!
            if r > 1. then
                set r=( 2 - r ) * s__Wander_radius[this]
            else
                set r=r * s__Wander_radius[this]
            endif
            
            return IssuePointOrder(s__Wander_source[this], s__Wander_order[this], s__Wander_centerX[this] + r * Cos(t), s__Wander_centerY[this] + r * Sin(t))
        endfunction
        
        function s__Wander_onPeriodic takes nothing returns nothing

                local integer this= (LoadInteger(TimerUtils__ht, 0, GetHandleId((GetExpiredTimer())))) // INLINED!!



                
            if UnitAlive(s__Wander_source[this]) then
                   // There are a few order ids, which eventually mess with the following unit order comparison.
                   // For example order id 851974. An endless going, undocumented order serving no obvious purpose.
                if GetUnitCurrentOrder(s__Wander_source[this]) == 0 and s__Wander_issueWander(this) then
                    call TimerStart(s__Wander_tmr[this], s__Wander_timeout[this] + s__Wander_random[this] * (GetRandomReal(0., 1.)), true, function s__Wander_onPeriodic) // INLINED!!
                else
                    // Update in short intervals until a wander order is issued.
                    call TimerStart(s__Wander_tmr[this], Wander___DEFAULT_TIMER_TIMEOUT, true, function s__Wander_onPeriodic)
                endif
            else
                call s__Wander_destroy(this)
            endif
        endfunction
    
        function s__Wander_create takes unit whichUnit,real range,real cooldown returns integer
            local integer this= (LoadInteger(Table__ht, (Wander___table), (GetHandleId((whichUnit))))) // INLINED!!
            
            if not (s__Wander_tmr[(this)] != null) then // INLINED!!
                set this=s__Wander__allocate()
                set s__Wander_source[this]=whichUnit
                set s__Wander_order[this]=Wander___DEFAULT_ORDER_STRING
                call SaveInteger(Table__ht, (Wander___table), (GetHandleId(whichUnit)), ( this)) // INLINED!!
                




                    set s__Wander_tmr[this]=NewTimerEx(this)

            endif
            
            set s__Wander_radius[this]=range
            set s__Wander_random[this]=0.
            set s__Wander_centerX[this]=GetUnitX(whichUnit)
            set s__Wander_centerY[this]=GetUnitY(whichUnit)
            set s__Wander_timeout[this]=RMaxBJ(0., cooldown)
            
            call TimerStart(s__Wander_tmr[this], s__Wander_timeout[this], true, function s__Wander_onPeriodic)
            
            return this
        endfunction

        function s__Wander_init takes nothing returns nothing
            set Wander___table=s__Table_create()
        endfunction
//Implemented from module Wander___Init:
        function s__Wander_Wander___Init__onInit takes nothing returns nothing
            set Wander___table=s__Table_create() // INLINED!!
        endfunction
        

//library Wander ends
//===========================================================================
// 
// Just another Warcraft III map
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Tue Oct 24 05:35:35 2017
//   Map Author: Unknown
// 
//===========================================================================

//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************


function InitGlobals takes nothing returns nothing
    local integer i= 0
    set udg_GDD_Event=0
    set udg_GDD_Damage=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_GDD__Integers[i]=0
        set i=i + 1
    endloop

    set udg_GDD__LeftMapGroup=CreateGroup()
    set udg_whereToX=0
    set udg_whereToY=0
    set udg_wanderEvent=0
    set udg_rng=0
endfunction

//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************

//===========================================================================
function CreateNeutralHostile takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_AGGRESSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u=CreateUnit(p, 'nmrl', - 269.1, - 3411.0, 359.703)
    set u=CreateUnit(p, 'nmrl', - 210.4, - 3285.6, 19.161)
    set u=CreateUnit(p, 'nmrl', - 53.6, - 3305.0, 110.910)
    set u=CreateUnit(p, 'nmrl', - 178.3, - 3439.3, 62.075)
    set u=CreateUnit(p, 'nmrl', 628.6, - 2676.5, 73.633)
    set u=CreateUnit(p, 'nmrl', 655.1, - 2734.6, 163.339)
    set u=CreateUnit(p, 'nmrl', 747.3, - 2748.0, 251.265)
    set u=CreateUnit(p, 'nmrl', 728.1, - 2681.3, 331.138)
    set u=CreateUnit(p, 'nmrl', 719.1, - 2875.6, 101.605)
    set u=CreateUnit(p, 'nmrl', - 907.5, - 2613.5, 69.853)
    set u=CreateUnit(p, 'nmrl', - 956.8, - 2664.1, 225.260)
    set u=CreateUnit(p, 'nmrl', - 1020.8, - 2660.8, 17.952)
    set u=CreateUnit(p, 'nmrl', - 1009.2, - 2563.6, 139.058)
    set u=CreateUnit(p, 'nmrl', - 880.7, - 2525.5, 49.517)
    set u=CreateUnit(p, 'nmrl', - 943.5, - 2544.6, 340.652)
    set u=CreateUnit(p, 'nmrl', 25.1, - 1245.1, 49.517)
endfunction

//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
endfunction

//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
endfunction

//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreatePlayerBuildings()
    call CreateNeutralHostile()
    call CreatePlayerUnits()
endfunction

//***************************************************************************
//*
//*  Triggers
//*
//***************************************************************************

//===========================================================================
// Trigger: Untitled Trigger 001
//===========================================================================
function Trig_Untitled_Trigger_001_Actions takes nothing returns nothing
    call SetTimeOfDay(12)
endfunction

//===========================================================================
function InitTrig_Untitled_Trigger_001 takes nothing returns nothing
    set gg_trg_Untitled_Trigger_001=CreateTrigger()
    call TriggerAddAction(gg_trg_Untitled_Trigger_001, function Trig_Untitled_Trigger_001_Actions)
endfunction

//===========================================================================
// Trigger: wander
//===========================================================================


// Trigger: GUI Friendly Damage Detection
//===========================================================================
// GUI-Friendly Damage Detection -- v1.2.1 -- by Weep
//    http:// www.thehelper.net/forums/showthread.php?t=137957
//
//    Requires: only this trigger and its variables.
//
// -- What? --
//    This snippet provides a leak-free, GUI-friendly implementation of an "any unit takes
//    damage" event.  It requires no JASS knowledge to use.
//
//    It uses the Game - Value Of Real Variable event as its method of activating other
//    triggers, and passes the event responses through a few globals.
//
// -- Why? --
//    The traditional GUI method of setting up a trigger than runs when any unit is damaged
//    leaks trigger events.  This snippet is easy to implement and removes the need to do
//    you own GUI damage detection setup.
//
// -- How To Implement --
//    0. Before you copy triggers that use GDD into a new map, you need to copy over GDD
//       with its GDD Variable Creator trigger, or there will be a problem: the variables
//       won't be automatically created correctly.
//
//    1. Be sure "Automatically create unknown variables while pasting trigger data" is
//       enabled in the World Editor general preferences.
//    2. Copy this trigger category ("GDD") and paste it into your map.
//       (Alternately: create the variables listed in the globals block below, create a
//       trigger named "GUI Friendly Damage Detection", and paste in this entire text.)
//    3. Create your damage triggers using Game - Value Of Real Variable as the event,
//       select GDD_Event as the variable, and leave the rest of the settings to the default
//       "becomes Equal to 0.00".
//       The event responses are the following variables:
//          GDD_Damage is the amount of damage, replacing Event Response - Damage Taken.
//          GDD_DamagedUnit is the damaged unit, replacing Event Response - Triggering Unit.
//              Triggering Unit can still be used, if you need to use waits.
//              Read the -- Notes -- section below for more info.
//          GDD_DamageSource is the damaging unit, replacing Event Response - Damage Source.
//
// -- Notes --
//    GDD's event response variables are not wait-safe; you can't use them after a wait in
//    a trigger.  If you need to use waits, Triggering Unit (a.k.a. GetTriggerUnit()) can
//    be used in place of GDD_DamageSource.  There is no usable wait-safe equivalent to
//    Event Damage or Damage Source; you'll need to save the values yourself.
//
//    Don't write any values to the variables used as the event responses, or it will mess
//    up any other triggers using this snippet for their triggering.  Only use their values.
//
//    This uses arrays, so can detect damage for a maximum of 8190 units at a time, and
//    cleans up data at a rate of 33.33 per second, by default.  This should be enough for
//    most maps, but if you want to change the rate, change the value returned in the
//    GDD_RecycleRate function at the top of the code, below.
//
//    By default, GDD will not register units that have Locust at the moment of their
//    entering the game, and will not recognize when they take damage (which can only
//    happen if the Locust ability is later removed from the unit.)  To allow a unit to have
//    Locust yet still cause GDD damage events if Locust is removed, you can either design
//    the unit to not have Locust by default and add it via triggers after creation, or
//    edit the GDD_Filter function at the top of the code, below.
//
// -- Credits --
//    Captain Griffin on wc3c.net for the research and concept of GroupRefresh.
//
//    Credit in your map not needed, but please include this README.
//
// -- Version History --
//    1.2.1: Minor code cleaning.  Added configuration functions.  Updated documentation.
//    1.2.0: Made this snippet work properly with recursive damage.
//    1.1.1: Added a check in order to not index units with the Locust ability (dummy units).
//           If you wish to check for damage taken by a unit that is unselectable, do not
//           give the unit-type Locust in the object editor; instead, add the Locust ability
//           'Aloc' via a trigger after its creation, then remove it.
//    1.1.0: Added a check in case a unit gets moved out of the map and back.
//    1.0.0: First release.


//===================================================================
// Configurables.
function GDD_RecycleRate takes nothing returns real
    return 0.03
endfunction

function GDD_Filter takes unit u returns boolean
    return GetUnitAbilityLevel(u, 'Aloc') == 0 //By default, the system ignores Locust units, because they normally can't take damage anyway
endfunction

//===================================================================
// This is just for reference.
// If you use JassHelper, you could uncomment this section instead of creating the variables in the trigger editor.

// globals
//  real udg_GDD_Event = 0.
//  real udg_GDD_Damage = 0.
//  unit udg_GDD_DamagedUnit
//  unit udg_GDD_DamageSource
//  trigger array udg_GDD__TriggerArray
//  integer array udg_GDD__Integers
//  unit array udg_GDD__UnitArray
//  group udg_GDD__LeftMapGroup = CreateGroup()
// endglobals

//===================================================================
// System code follows.  Don't touch!
function GDD_Event takes nothing returns boolean
    local unit damagedcache= udg_GDD_DamagedUnit
    local unit damagingcache= udg_GDD_DamageSource
    local real damagecache= udg_GDD_Damage
    set udg_GDD_DamagedUnit=GetTriggerUnit()
    set udg_GDD_DamageSource=GetEventDamageSource()
    set udg_GDD_Damage=GetEventDamage()
    set udg_GDD_Event=1.
    set udg_GDD_Event=0.
    set udg_GDD_DamagedUnit=damagedcache
    set udg_GDD_DamageSource=damagingcache
    set udg_GDD_Damage=damagecache
    set damagedcache=null
    set damagingcache=null
    return false
endfunction

function GDD_AddDetection takes nothing returns boolean
//  if(udg_GDD__Integers[0] > 8190) then
//      call BJDebugMsg("GDD: Too many damage events!  Decrease number of units present in the map or increase recycle rate.")
//      ***Recycle rate is specified in the GDD_RecycleRate function at the top of the code.  Smaller is faster.***
//      return
//  endif
    if ( IsUnitInGroup(GetFilterUnit(), udg_GDD__LeftMapGroup) ) then
        call GroupRemoveUnit(udg_GDD__LeftMapGroup, GetFilterUnit())
    elseif ( (GetUnitAbilityLevel((GetFilterUnit()), 'Aloc') == 0) ) then // INLINED!!
        set udg_GDD__Integers[0]=udg_GDD__Integers[0] + 1
        set udg_GDD__UnitArray[udg_GDD__Integers[0]]=GetFilterUnit()
        set udg_GDD__TriggerArray[udg_GDD__Integers[0]]=CreateTrigger()
        call TriggerRegisterUnitEvent(udg_GDD__TriggerArray[udg_GDD__Integers[0]], udg_GDD__UnitArray[udg_GDD__Integers[0]], EVENT_UNIT_DAMAGED)
        call TriggerAddCondition(udg_GDD__TriggerArray[udg_GDD__Integers[0]], Condition(function GDD_Event))
    endif
    return false
endfunction

function GDD_PreplacedDetection takes nothing returns nothing
    local group g= CreateGroup()
    local integer i= 0
    loop
        call GroupEnumUnitsOfPlayer(g, Player(i), Condition(function GDD_AddDetection))
        set i=i + 1
        exitwhen i == bj_MAX_PLAYER_SLOTS
    endloop
    call DestroyGroup(g)
    set g=null
endfunction

function GDD_GroupRefresh takes nothing returns nothing
// Based on GroupRefresh by Captain Griffen on wc3c.net
    if ( bj_slotControlUsed[5063] == true ) then
        call GroupClear(udg_GDD__LeftMapGroup)
        set bj_slotControlUsed[5063]=false
    endif
    call GroupAddUnit(udg_GDD__LeftMapGroup, GetEnumUnit())
endfunction

function GDD_Recycle takes nothing returns nothing
    if ( udg_GDD__Integers[0] <= 0 ) then
        return
    elseif ( udg_GDD__Integers[1] <= 0 ) then
        set udg_GDD__Integers[1]=udg_GDD__Integers[0]
    endif
    if ( GetUnitTypeId(udg_GDD__UnitArray[udg_GDD__Integers[1]]) == 0 ) then
        call DestroyTrigger(udg_GDD__TriggerArray[udg_GDD__Integers[1]])
        set udg_GDD__TriggerArray[udg_GDD__Integers[1]]=null
        set udg_GDD__TriggerArray[udg_GDD__Integers[1]]=udg_GDD__TriggerArray[udg_GDD__Integers[0]]
        set udg_GDD__UnitArray[udg_GDD__Integers[1]]=udg_GDD__UnitArray[udg_GDD__Integers[0]]
        set udg_GDD__UnitArray[udg_GDD__Integers[0]]=null
        set udg_GDD__Integers[0]=udg_GDD__Integers[0] - 1
    endif
    set udg_GDD__Integers[1]=udg_GDD__Integers[1] - 1
endfunction

function GDD_LeaveMap takes nothing returns boolean
    local boolean cached= bj_slotControlUsed[5063]
    if ( udg_GDD__Integers[2] < 64 ) then
        set udg_GDD__Integers[2]=udg_GDD__Integers[2] + 1
    else
        set bj_slotControlUsed[5063]=true
        call ForGroup(udg_GDD__LeftMapGroup, function GDD_GroupRefresh)
        set udg_GDD__Integers[2]=0
    endif
    call GroupAddUnit(udg_GDD__LeftMapGroup, GetFilterUnit())
    set bj_slotControlUsed[5063]=cached
    return false
endfunction

// ===========================================================================
function InitTrig_GUI_Friendly_Damage_Detection takes nothing returns nothing
    local region r= CreateRegion()
    call RegionAddRect(r, GetWorldBounds())
    call TriggerRegisterEnterRegion(CreateTrigger(), r, Condition(function GDD_AddDetection))
    call TriggerRegisterLeaveRegion(CreateTrigger(), r, Condition(function GDD_LeaveMap))
    call GDD_PreplacedDetection()
    call TimerStart(CreateTimer(), (0.03), true, function GDD_Recycle) // INLINED!!
    set r=null
endfunction//===========================================================================
// Trigger: Table
//===========================================================================
// Trigger: TimerUtils
//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    call InitTrig_Untitled_Trigger_001()
    //Function not found: call InitTrig_wander()
    call InitTrig_GUI_Friendly_Damage_Detection()
    //Function not found: call InitTrig_Table()
    //Function not found: call InitTrig_TimerUtils()
endfunction

//===========================================================================
function RunInitializationTriggers takes nothing returns nothing
    call ConditionalTriggerExecute(gg_trg_Untitled_Trigger_001)
endfunction

//***************************************************************************
//*
//*  Players
//*
//***************************************************************************

function InitCustomPlayerSlots takes nothing returns nothing

    // Player 0
    call SetPlayerStartLocation(Player(0), 0)
    call SetPlayerColor(Player(0), ConvertPlayerColor(0))
    call SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(0), true)
    call SetPlayerController(Player(0), MAP_CONTROL_USER)

endfunction

function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_002
    call SetPlayerTeam(Player(0), 0)

endfunction

//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************

//===========================================================================
function main takes nothing returns nothing
    call SetCameraBounds(- 15616.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 15872.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 15616.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 15360.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 15616.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 15360.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 15616.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 15872.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("BarrensDay")
    call SetAmbientNightSound("BarrensNight")
    call SetMapMusic("Music", true, 0)
    call CreateAllUnits()
    call InitBlizzard()

call ExecuteFunc("jasshelper__initstructs26007812")
call ExecuteFunc("TimerUtils__init")

    call InitGlobals()
    call InitCustomTriggers()
    call ConditionalTriggerExecute(gg_trg_Untitled_Trigger_001) // INLINED!!

endfunction

//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************

function config takes nothing returns nothing
    call SetMapName("Just another Warcraft III map")
    call SetMapDescription("Nondescript")
    call SetPlayers(1)
    call SetTeams(1)
    call SetGamePlacement(MAP_PLACEMENT_USE_MAP_SETTINGS)

    call DefineStartLocation(0, - 3968.0, - 704.0)

    // Player setup
    call InitCustomPlayerSlots()
    call SetPlayerSlotAvailable(Player(0), MAP_CONTROL_USER)
    call InitGenericPlayerSlots()
endfunction




//Struct method generated initializers/callers:

//Functions for BigArrays:
function sa___prototype6_TimerUtils__init takes nothing returns boolean

     local integer i=0
     local integer o=- 1
     local boolean oops= false
        if ( TimerUtils__didinit ) then
    return true
        else
            set TimerUtils__didinit=true
        endif
            set TimerUtils__ht=InitHashtable()
            loop
                exitwhen ( i == TimerUtils__QUANTITY )
                set s__TimerUtils__tT[i]= CreateTimer()
                call SaveInteger(TimerUtils__ht, 0, GetHandleId((s__TimerUtils__tT[i] )), ( TimerUtils__HELD)) // INLINED!!
                set i=i + 1
            endloop
            set TimerUtils__tN=TimerUtils__QUANTITY
    return true
endfunction

function jasshelper__initstructs26007812 takes nothing returns nothing
    set st___prototype6[1]=CreateTrigger()
    call TriggerAddAction(st___prototype6[1],function sa___prototype6_TimerUtils__init)
    call TriggerAddCondition(st___prototype6[1],Condition(function sa___prototype6_TimerUtils__init))
















































call ExecuteFunc("s__Wander_Wander___Init__onInit")

endfunction

