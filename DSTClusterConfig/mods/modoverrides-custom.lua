-- This is my own "custom default" modoverrides, with the base server mods I usually play with. Feel
-- free to use it if you want!

return {

  -- Wormhole Marks
  -- https://steamcommunity.com/sharedfiles/filedetails/?id=362175979
  ["workshop-362175979"]={ configuration_options={ ["Draw over FoW"]="disabled" }, enabled=true },

  -- Extra Equip Slots
  -- https://steamcommunity.com/sharedfiles/filedetails/?id=375850593
  ["workshop-375850593"]={ configuration_options={  }, enabled=true },

  -- Health Info
  -- https://steamcommunity.com/sharedfiles/filedetails/?id=375859599
  ["workshop-375859599"]={
    configuration_options={
      divider=5,
      random_health_value=0,
      random_range=0,
      show_type=0,
      unknwon_prefabs=1,
      use_blacklist=true
    },
    enabled=true
  },

  -- Global Positions
  -- https://steamcommunity.com/sharedfiles/filedetails/?id=378160973
  ["workshop-378160973"]={
    configuration_options={
      ENABLEPINGS=true,
      FIREOPTIONS=2,
      OVERRIDEMODE=false,
      SHAREMINIMAPPROGRESS=true,
      SHOWFIREICONS=true,
      SHOWPLAYERICONS=true,
      SHOWPLAYERSOPTIONS=2
    },
    enabled=true
  },

  -- Food Values - Item Tooltips (Server and Client)
  -- https://steamcommunity.com/sharedfiles/filedetails/?id=458940297
  ["workshop-458940297"]={
    configuration_options={
      DFV_ClientPrediction="default",
      DFV_FueledSettings="default",
      DFV_Language="EN",
      DFV_MinimalMode="default",
      DFV_PercentReplace="default",
      DFV_ShowACondition="default",
      DFV_ShowADefence="default",
      DFV_ShowAType="default",
      DFV_ShowDamage="default",
      DFV_ShowFireTime="default",
      DFV_ShowInsulation="default",
      DFV_ShowTemperature="default",
      DFV_ShowUses="default"
    },
    enabled=true
  },

  -- Quick Pick
  -- https://steamcommunity.com/sharedfiles/filedetails/?id=501385076
  ["workshop-501385076"]={ configuration_options={  }, enabled=true },

  -- Auto Tooth Trap Reset
  -- https://steamcommunity.com/sharedfiles/filedetails/?id=588560555
  ["workshop-588560555"]={ configuration_options={  }, enabled=true },

  -- Epic Healthbar
  -- https://steamcommunity.com/sharedfiles/filedetails/?id=1185229307
  ["workshop-1185229307"]={ configuration_options={  }, enabled=true }
}