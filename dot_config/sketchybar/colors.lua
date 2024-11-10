return {
  black = 0xff191724,
  white = 0xfffaf4ed,
  red = 0xffeb6f92,
  green = 0xff9ccfd8,
  blue = 0xff3e8fb0,
  yellow = 0xfff6c177,
  orange = 0xffea9a97,
  magenta = 0xffeb6f92,
  grey = 0xff908caa,
  transparent = 0x00000000,

  bar = {
    bg = 0xf02c2e34,
    border = 0xff2c2e34,
  },
  popup = {
    bg = 0xc02c2e34,
    border = 0xff7f8490
  },
  bg1 = 0xff363944,
  bg2 = 0xff414550,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}
