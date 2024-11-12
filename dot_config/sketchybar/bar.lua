local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
  topmost = on,
  hidden=on,
  height = 44,
  sticky = off,
  color = colors.transparent,
  padding_right = 2,
  padding_left = 2,
})
