local _0x1a3b,_0x2b4c,_0x3d5e,_0x4f6a,_0x5g7b = game.Players.LocalPlayer,game.Players.LocalPlayer.Character,game.Players.LocalPlayer.CharacterAdded:Wait(),game.Players.LocalPlayer.Data.Level.Value,workspace
local _0x6h8i = function()
    if _0x5g7b <= 700 then return _0x4f6a.FirstSea.Enemies:GetChildren() elseif _0x5g7b <= 1500 then return _0x4f6a.SecondSea.Enemies:GetChildren() else return _0x4f6a.ThirdSea.Enemies:GetChildren() end
end
for _0x9j0k,_0x1p2q in pairs(_0x6h8i()) do
    if _0x1p2q:FindFirstChild("Humanoid") and _0x1p2q.Humanoid.Health > 0 then
        _0x3d5e.CFrame = _0x1p2q.HumanoidRootPart.CFrame
        while _0x1p2q.Humanoid.Health > 0 do
            game:GetService("VirtualUser"):CaptureController()
            game:GetService("VirtualUser"):Button1Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            task.wait(0.1)
        end
    end
end
