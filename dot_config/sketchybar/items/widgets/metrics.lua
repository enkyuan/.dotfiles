local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

sbar.exec("killall cpu_load >/dev/null; $CONFIG_DIR/helpers/event_providers/cpu_load/bin/cpu_load cpu_update 2.0")
sbar.exec("killall memory_load >/dev/null; $CONFIG_DIR/helpers/event_providers/memory_load/bin/memory_load memory_update 2.0")

local memory = sbar.add("item", "widgets.memory" , 42, {
  position = "right",
  background = {
    height = 22,
    color = { alpha = 0 },
    border_width = 0,
    drawing = true,
  },
  icon = { 
    string = icons.memory,
    color = colors.teal 
  },
  label = {
    string = "??%",
    font = {
      family = settings.font.numbers,
      style = settings.font.style_map["Bold"],
    },
    align = "right",
    padding_right = 0,
  },
  padding_right = settings.paddings + 6
})

memory:subscribe("memory_update", function(env)
  local load = tonumber(env.memory_load)
  memory:push({ load })
  memory:set({
      label = env.memory_load,
  })
end)

memory:subscribe("mouse.clicked", function(env)
  sbar.exec("open -a 'Activity Monitor'")
end)

local cpu = sbar.add("item", "widgets.cpu" , 42, {
  position = "right",
  background = {
    height = 22,
    color = { alpha = 0 },
    border_width = 0,
    drawing = true,
  },
  icon = { 
    string = icons.cpu,
  },
  label = {
    string = "??%",
    font = {
      family = settings.font.numbers,
      style = settings.font.style_map["Bold"],
    },
    align = "right",
    padding_right = 0,
  },
  padding_right = settings.paddings + 6
})

cpu:subscribe("cpu_update", function(env)
  -- Also available: env.user_load, env.sys_load
  local load = tonumber(env.total_load)
  cpu:push({ load / 100. })

  local color = colors.blue
  if load > 30 then
    if load < 60 then
      color = colors.yellow
    elseif load < 80 then
      color = colors.orange
    else
      color = colors.red
    end
  end

  cpu:set({
    label = env.total_load .. "%",
  })
end)

cpu:subscribe("mouse.clicked", function(env)
  sbar.exec("open -a 'Activity Monitor'")
end)

-- Background around the cpu item
sbar.add("bracket", "widgets.metrics.bracket", { cpu.name, memory.name }, {
  background = { color = colors.bg1 }
})

-- Background around the cpu item
sbar.add("item", "widgets.cpu.padding", {
  position = "right",
  width = settings.group_paddings
})
