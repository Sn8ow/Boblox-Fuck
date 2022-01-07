--// Mouse Service \\--
mouse = game.Players.LocalPlayer:GetMouse()
--// Tool Service \\--
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Click To Teleport"
tool.Activated:connect(function()
--// Locals Services \\--
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
--// Ending \\--
tool.Parent = game.Players.LocalPlayer.Backpack