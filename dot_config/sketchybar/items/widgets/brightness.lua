local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

local popup_width = 250

local brightness_percent = sbar.add("item", "widgets.brightness1", {
  position = "right",
  icon = { drawing = false },
  label = {
    string = "??%",
    padding_left = 1,
    font = { family = settings.font.numbers }
  },
})

local brightness_icon = sbar.add("item", "widgets.brightness2", {
    position = "right",
	padding_right = -1,
	icon = {
		string = icons.brightness._100,
		width = 0,
		align = "left",
		color = colors.grey,
		font = {
			style = settings.font.style_map["Regular"],
			size = 14.0,
		},
	},
	label = {
		width = 25,
		align = "left",
		font = {
			style = settings.font.style_map["Regular"],
			size = 14.0,
		},
	},
})

local brightness_bracket = sbar.add("bracket", "widgets.brightness.bracket", {
	brightness_icon.name,
	brightness_percent.name,
}, {
	background = { color = colors.bg1 },
	popup = { align = "center" },
})

local brightness_slider = sbar.add("slider", popup_width, {
  position = "popup." .. brightness_bracket.name,
  slider = {
    highlight_color = colors.blue,
    background = {
      height = 6,
      corner_radius = 3,
      color = colors.bg2,
    },
    knob= {
      string = "􀀁",
      drawing = true,
    },
  },
  background = { color = colors.bg1, height = 2, y_offset = -20 },
  click_script = 'osascript -e "set brightness output brightness $PERCENTAGE"'
})

brightness_percent:subscribe("brightness_change", function(env)
  local brightness = tonumber(env.INFO)
  local icon = icons.brightness._0
  if brightness > 60 then
    icon = icons.brightness._100
  elseif brightness > 30 then
    icon = icons.brightness._66
  elseif brightness > 10 then
    icon = icons.brightness._33
  elseif brightness > 0 then
    icon = icons.brightness._10
  end

  local lead = ""
  if brightness < 10 then
    lead = "0"
  end

  brightness_icon:set({ label = icon })
  brightness_percent:set({ label = lead .. brightness .. "%" })
  brightness_slider:set({ slider = { percentage = brightness } })
end)

local function brightness_collapse_details()
  local drawing = brightness_bracket:query().popup.drawing == "on"
  if not drawing then return end
  brightness_bracket:set({ popup = { drawing = false } })
  sbar.remove('/brightness.device\\.*/')
end

local function brightness_toggle_details(env)
  if env.BUTTON == "right" then
    sbar.exec("open /System/Library/PreferencePanes/Displays.prefpane")
    return
  end

  local should_draw = brightness_bracket:query().popup.drawing == "off"
  if should_draw then
    brightness_bracket:set({ popup = { drawing = true } })
    sbar.exec("brightness -l", function(result)
      local brightness_level = tonumber(string.match(result, "brightness: (%d+%.%d+)")) * 100
      local color = colors.grey
      local counter = 0

      for i = 0, 100, 10 do
        local color = colors.grey
        if math.floor(brightness_level) == i then
          color = colors.white
        end
        sbar.add("item", "brightness.level." .. counter, {
          position = "popup." .. brightness_bracket.name,
          width = popup_width,
          align = "center",
          label = { string = i .. "%", color = color },
          click_script = 'osascript -e "set brightness output brightness ' .. (i / 100) .. '" && sketchybar --set /brightness.level\\.*/ label.color=' .. colors.grey .. ' --set $NAME label.color=' .. colors.white
        })
        counter = counter + 1
      end
    end)
  else
    brightness_collapse_details()
  end
end

sbar.add("item", "widgets.brightness.padding", {
	position = "right",
	width = settings.group_paddings,
})

local function brightness_collapse_details()
  local drawing = brightness_bracket:query().popup.drawing == "on"
  if not drawing then return end
  brightness_bracket:set({ popup = { drawing = false } })
  sbar.remove('/brightness.device\\.*/')
end

local function brightness_scroll(env)
  local delta = env.SCROLL_DELTA
  sbar.exec('osascript -e "set brightness output brightness (output brightness of (get settings) + ' .. delta .. ')"')
end

brightness_icon:subscribe("mouse.clicked", brightness_toggle_details)
brightness_icon:subscribe("mouse.scrolled", brightness_scroll)
brightness_percent:subscribe("mouse.clicked", brightness_toggle_details)
brightness_percent:subscribe("mouse.exited.global", brightness_collapse_details)
brightness_percent:subscribe("mouse.scrolled", brightness_scroll)
