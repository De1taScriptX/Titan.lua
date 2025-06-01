-- Carrega OrionLib
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/UltraStuff/scripts2/main/orionlib.lua"))()

-- Cria janela
local Window = OrionLib:MakeWindow({
    Name = "AutoKill | Delta Safe",
    HidePremium = false,
    SaveConfig = false
})

-- Aba principal
local MainTab = Window:MakeTab({
    Name = "Principal",
    Icon = "",
    PremiumOnly = false
})

-- Auto Kill
local AutoKillAtivo = false
MainTab:AddToggle({
    Name = "Auto Kill (Delta)",
    Default = false,
    Callback = function(Value)
        AutoKillAtivo = Value
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer

        task.spawn(function()
            while AutoKillAtivo do
                task.wait(0.3)
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            local targetPos = player.Character.HumanoidRootPart.Position
                            local currentPos = LocalPlayer.Character.HumanoidRootPart.Position
                            local newPos = currentPos:Lerp(targetPos + Vector3.new(0, 0, 2), 0.4)
                            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(newPos)
                        end
                    end
                end
            end
        end)
    end
})

-- Antiban avançado
pcall(function()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)

    local old = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" or method == "kick" then
            return nil
        end
        return old(self, ...)
    end)

    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    LocalPlayer.Kick = function() end
end)
