local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Roblox-ImGUI/refs/heads/main/ImGui.lua"))()

local UI = Lib:Create{
    Theme = "Dark", 
    Size = UDim2.new(0, 555, 0, 400)
}

local Main = UI:Tab{
    Name = "Inicio"
}

local Divider = Main:divider{
    Name = "Main shit"
}

local QuitDivider = Main:Divider{
    Name = "Quit"
}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

function drawESP(player)
    -- Verifica se o jogador está no mesmo espaço que o LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = player.Character.HumanoidRootPart
        local screenPosition, onScreen = workspace.CurrentCamera:WorldToScreenPoint(rootPart.Position)

        if onScreen then
            -- Cria uma parte visual (ex: uma caixa ou um círculo) para representar o jogador
            local espBox = Instance.new("Frame")
            espBox.Size = UDim2.new(0, 50, 0, 50) -- Tamanho da caixa ESP
            espBox.Position = UDim2.new(0, screenPosition.X - 25, 0, screenPosition.Y - 25)
            espBox.BackgroundColor3 = Color3.new(1, 0, 0) -- Cor da caixa
            espBox.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui -- Certifique-se de ter um ScreenGui no PlayerGui

            -- Remover a caixa após um certo tempo (opcional)
            delay(1, function()
                espBox:Destroy()
            end)
        end
    end
end

-- Loop que verifica os jogadores em intervalos
while wait(0.1) do
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            drawESP(player)
        end
    end
end