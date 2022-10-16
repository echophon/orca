local I = function(self, x, y)
  self.y = y
  self.x = x
  self.name = "increment"
  self.ports = { {-1, 0 , "in-step" }, {1, 0, "in-mod" }, {0, 1, "i-out"} }
  self:spawn(self.ports)

  local step = self:listen(self.x - 1, self.y) or 1
  local mod = self:listen(self.x + 1, self.y) or 36
  local val = self:listen(self.x, self.y + 1) or 0
  val = ((val + step) % mod)

  self:write(0, 1, self.chars[val])
end

return I
