--// Loaders Interface \\--
print("67vsygywgd67867fdsjbgd76") --// This is anti-ban bypass key! \\--
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Network = require(LocalPlayer.PlayerScripts.GunFramework.InternalModules.network)
--// Functions \\--
function GetPlayer()
    local MaxDist, Player = math.huge
    for I,V in pairs(Players:GetPlayers()) do
        if V == LocalPlayer then continue end
        if V.Team == LocalPlayer then continue end
        if not V.Character then continue end
        local Head = V.Character:FindFirstChild("Head")
        if not Head then continue end
        local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(Head.Position)
        if not Vis then continue end
        local MyPos, TheirPos = Vector2.new(Mouse.X, Mouse.Y), Vector2.new(Pos.X, Pos.Y)
        local Dist = (TheirPos - MyPos).Magnitude
        if Dist < MaxDist then
            MaxDist = Dist
            Player = V
        end
    end
    return Player
end
--// Aimbot Script \\--
Old = hookfunction(Network.send, function(self, ...)
    local Args = {...}
    if Args[1] == "bullet" then
        local P = GetPlayer()
        if P and P.Character and P.Character:FindFirstChild("Head") then
            Args[2] = P.Character
            Args[3] = P.Character.Head
            Args[4] = P.Character.Head.Position
            return Old(self, unpack(Args))
        end
    end
    return Old(self, ...)
end)
for I,V in pairs(game:GetService("ReplicatedStorage").GunModules:GetChildren()) do
    pcall(function()
        local a = require(V)
        a.ReloadTime = 0
        a.ClipSize = math.huge
        a.FireRate = 0
        a.Automatic = true
    end)
end
--// End \\--
hookfunction(require(LocalPlayer.PlayerScripts.GunFramework.Recoil).ShootRecoil, function() end)
local F = getconnections(game:GetService("LogService").MessageOut)[2].Function
debug.setupvalue(F, 1, {})
hookfunction(F, function() end)
