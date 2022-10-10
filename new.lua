-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.46074456, 0, 0.0796115324, 0)
TextLabel.Size = UDim2.new(0, 159, 0, 29)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Owlhub"
TextLabel.TextColor3 = Color3.fromRGB(243, 243, 243)
TextLabel.TextSize = 29.000

TextLabel_2.Parent = ScreenGui
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(0.485440522, 0, 0.0786407068, 0)
TextLabel_2.Size = UDim2.new(0, 200, 0, 29)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "Modded"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 85, 0)
TextLabel_2.TextSize = 31.000



--MAIN SCRIPT
local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local w = library:CreateWindow("Arsenal") -- Creates the window
local a = w:CreateFolder("Aim Cheats")
a:Toggle("Silent Aim",function(bool)
    local CurrentCamera = workspace.CurrentCamera
local Players = game.GetService(game, "Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
function ClosestPlayer()
    local MaxDist, Closest = math.huge
    for I,V in pairs(Players.GetPlayers(Players)) do
        if V == LocalPlayer then continue end
        if V.Team == LocalPlayer then continue end
        if not V.Character then continue end
        local Head = V.Character.FindFirstChild(V.Character, "Head")
        if not Head then continue end
        local Pos, Vis = CurrentCamera.WorldToScreenPoint(CurrentCamera, Head.Position)
        if not Vis then continue end
        local MousePos, TheirPos = Vector2.new(Mouse.X, Mouse.Y), Vector2.new(Pos.X, Pos.Y)
        local Dist = (TheirPos - MousePos).Magnitude
        if Dist < MaxDist then
            MaxDist = Dist
            Closest = V
        end
    end
    return Closest
end
local MT = getrawmetatable(game)
local OldNC = MT.__namecall
local OldIDX = MT.__index
setreadonly(MT, false)
MT.__namecall = newcclosure(function(self, ...)
    local Args, Method = {...}, getnamecallmethod()
    if Method == "FindPartOnRayWithIgnoreList" and not checkcaller() then
        local CP = ClosestPlayer()
        if CP and CP.Character and CP.Character.FindFirstChild(CP.Character, "Head") then
            Args[1] = Ray.new(CurrentCamera.CFrame.Position, (CP.Character.Head.Position - CurrentCamera.CFrame.Position).Unit * 1000)
            return OldNC(self, unpack(Args))
        end
    end
    return OldNC(self, ...)
end)
MT.__index = newcclosure(function(self, K)
    if K == "Clips" then
        return workspace.Map
    end
    return OldIDX(self, K)
end)
setreadonly(MT, true)
end)
a:Toggle("Aimbot",function(bool)
        -- TOGGLES --

getgenv().Aimbot = true -- aimbot toggle re-execute with true/false





-- SERVICES --

local Players = game:GetService('Players') -- Players path
local UIS = game:GetService('UserInputService') -- UserInputService path
local RunService = game:GetService('RunService') -- RunService path
local ws = game:GetService('Workspace') -- Workspace path

-- PLR STUFF --
local lp = Players.LocalPlayer -- localplayer
local mouse = lp:GetMouse() -- localplayer mouse
local camera = ws.CurrentCamera -- camera

-- SETTINGS --

local AimbotSettings = { -- settings for aimbot
    Keybind = Enum.UserInputType.MouseButton2, -- aimkey keybind
    TeamCheck = true, -- aimbot teamcheck true/false
    UseFov = false, -- aimbot use FOV true/false
    AimPart = 'Head', -- aimbot aim part
    UseTween = false -- aimbot use tween true/false
}


-- Aimbot Variable -- 
local aiming = false -- aimbot variable



-- get closest player TO THE MOUSE function

function GetClosestPlayerToMouse()
local distance = math.huge -- inf number
local target = nil -- nobody yet
    for i,v in pairs(Players:GetPlayers()) do -- loop through all players
        if v ~= lp and getgenv().Aimbot and v.Character then -- checks
            if AimbotSettings.TeamCheck then -- checks if TeamCheck
                if v.TeamColor ~= lp.TeamColor then -- if is not on same team as localplayer
                    --
                    local number = camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position) -- player 3d to 2d point
                    local mag = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(number.X, number.Y)).magnitude -- distance from mouse to number ^^
                    if mag < distance then -- if its less than the inf number or the last one then
                        distance = mag -- set it as the new one
                        target = v -- set target
                    end
                end
            else -- team check is false
                --
                local number = camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position) -- player 3d to 2d point
                    local mag = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(number.X, number.Y)).magnitude -- distance from mouse to number ^^
                    if mag < distance then -- if its less than the inf number or the last one then
                        distance = mag -- set it as the new one
                        target = v -- set target
                    end
            end
        end
    end
    return target -- return the closest player
end


UIS.InputBegan:Connect(function(input) -- input began
    if input.UserInputType == AimbotSettings.Keybind then -- input is aimbot keybind
        aiming = true -- aiming to true
    end
end)
UIS.InputEnded:Connect(function(input) -- input ended
    if input.UserInputType == AimbotSettings.Keybind then -- input is aimbot keybind
        aiming = false -- aiming to false
    end
end)


RunService.RenderStepped:Connect(function() -- every frame ran loop
    if aiming and getgenv().Aimbot then -- if aiming and aimbot is true
        local goal = GetClosestPlayerToMouse().Character -- get closest players character
        camera.CFrame = CFrame.new(camera.CFrame.Position, goal.Head.Position) -- change camera CFrame to the target
    end
end)
end)
local a = w:CreateFolder("Visual Cheats")
a:Toggle("Esp",function(bool)
    local lplr = game.Players.LocalPlayer
    local camera = game:GetService("Workspace").CurrentCamera
    local CurrentCamera = workspace.CurrentCamera
    local worldToViewportPoint = CurrentCamera.worldToViewportPoint
    
    local HeadOff = Vector3.new(0, 0.5, 0)
    local LegOff = Vector3.new(0,3,0)
    
    for i,v in pairs(game.Players:GetChildren()) do
        local BoxOutline = Drawing.new("Square")
        BoxOutline.Visible = false
        BoxOutline.Color = Color3.new(0,0,0)
        BoxOutline.Thickness = 3
        BoxOutline.Transparency = 1
        BoxOutline.Filled = false
    
        local Box = Drawing.new("Square")
        Box.Visible = false
        Box.Color = Color3.new(1,1,1)
        Box.Thickness = 1
        Box.Transparency = 1
        Box.Filled = false
    
        local HealthBarOutline = Drawing.new("Square")
        HealthBarOutline.Thickness = 3
        HealthBarOutline.Filled = false
        HealthBarOutline.Color = Color3.new(0,0,0)
        HealthBarOutline.Transparency = 1
        HealthBarOutline.Visible = false
    
        local HealthBar = Drawing.new("Square")
        HealthBar.Thickness = 1
        HealthBar.Filled = false
        HealthBar.Transparency = 1
        HealthBar.Visible = false
    
        function boxesp()
            game:GetService("RunService").RenderStepped:Connect(function()
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                    local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
    
                    local RootPart = v.Character.HumanoidRootPart
                    local Head = v.Character.Head
                    local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
                    local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
                    local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)
    
                    if onScreen then
                        BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                        BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                        BoxOutline.Visible = true
    
                        Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                        Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                        Box.Visible = true
    
                        HealthBarOutline.Size = Vector2.new(2, HeadPosition.Y - LegPosition.Y)
                        HealthBarOutline.Position = BoxOutline.Position - Vector2.new(6,0)
                        HealthBarOutline.Visible = true
    
                        HealthBar.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / math.clamp(game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value, 0, game:GetService("Players")[v.Character.Name].NRPBS:WaitForChild("MaxHealth").Value)))
                        HealthBar.Position = Vector2.new(Box.Position.X - 6, Box.Position.Y + (1 / HealthBar.Size.Y))
                        HealthBar.Color = Color3.fromRGB(255 - 255 / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value), 255 / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value), 0)
                        HealthBar.Visible = true
    
                        if v.TeamColor == lplr.TeamColor then
                            --- Our Team
                            BoxOutline.Visible = false
                            Box.Visible = false
                            HealthBarOutline.Visible = false
                            HealthBar.Visible = false
                        else
                            ---Enemy Team
                            BoxOutline.Visible = true
                            Box.Visible = true
                            HealthBarOutline.Visible = true
                            HealthBar.Visible = true
                        end
    
                    else
                        BoxOutline.Visible = false
                        Box.Visible = false
                        HealthBarOutline.Visible = false
                        HealthBar.Visible = false
                    end
                else
                    BoxOutline.Visible = false
                    Box.Visible = false
                    HealthBarOutline.Visible = false
                    HealthBar.Visible = false
                end
            end)
        end
        coroutine.wrap(boxesp)()
    end
    
    game.Players.PlayerAdded:Connect(function(v)
        local BoxOutline = Drawing.new("Square")
        BoxOutline.Visible = false
        BoxOutline.Color = Color3.new(0,0,0)
        BoxOutline.Thickness = 3
        BoxOutline.Transparency = 1
        BoxOutline.Filled = false
    
        local Box = Drawing.new("Square")
        Box.Visible = false
        Box.Color = Color3.new(1,1,1)
        Box.Thickness = 1
        Box.Transparency = 1
        Box.Filled = false
    
        local HealthBarOutline = Drawing.new("Square")
        HealthBarOutline.Thickness = 3
        HealthBarOutline.Filled = false
        HealthBarOutline.Color = Color3.new(0,0,0)
        HealthBarOutline.Transparency = 1
        HealthBarOutline.Visible = false
    
        local HealthBar = Drawing.new("Square")
        HealthBar.Thickness = 1
        HealthBar.Filled = false
        HealthBar.Transparency = 1
        HealthBar.Visible = false
    
        function boxesp()
            game:GetService("RunService").RenderStepped:Connect(function()
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                    local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
    
                    local RootPart = v.Character.HumanoidRootPart
                    local Head = v.Character.Head
                    local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
                    local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
                    local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)
    
                    if onScreen then
                        BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                        BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                        BoxOutline.Visible = true
    
                        Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                        Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                        Box.Visible = true
    
                        HealthBarOutline.Size = Vector2.new(2, HeadPosition.Y - LegPosition.Y)
                        HealthBarOutline.Position = BoxOutline.Position - Vector2.new(6,0)
                        HealthBarOutline.Visible = true
    
                        HealthBar.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / math.clamp(game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value, 0, game:GetService("Players")[v.Character.Name].NRPBS:WaitForChild("MaxHealth").Value)))
                        HealthBar.Position = Vector2.new(Box.Position.X - 6, Box.Position.Y + (1/HealthBar.Size.Y))
                HealthBar.Color = Color3.fromRGB(255 - 255 / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value), 255 / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value), 0)                    
                HealthBar.Visible = true
    
                        if v.TeamColor == lplr.TeamColor then
                            --- Our Team
                            BoxOutline.Visible = false
                            Box.Visible = false
                            HealthBarOutline.Visible = false
                            HealthBar.Visible = false
                        else
                            ---Enemy Team
                            BoxOutline.Visible = true
                            Box.Visible = true
                            HealthBarOutline.Visible = true
                            HealthBar.Visible = true
                        end
    
                    else
                        BoxOutline.Visible = false
                        Box.Visible = false
                        HealthBarOutline.Visible = false
                        HealthBar.Visible = false
                    end
                else
                    BoxOutline.Visible = false
                    Box.Visible = false
                    HealthBarOutline.Visible = false
                    HealthBar.Visible = false
                end
            end)
        end
        coroutine.wrap(boxesp)()
    end)
end)

a:Toggle("Nametags",function(bool)
    local c = workspace.CurrentCamera
local ps = game:GetService("Players")
local lp = ps.LocalPlayer
local rs = game:GetService("RunService")

local function esp(p,cr)
    local h = cr:WaitForChild("Humanoid")
    local hrp = cr:WaitForChild("HumanoidRootPart")

    local text = Drawing.new("Text")
    text.Visible = false
    text.Center = true
    text.Outline = true 
    text.Font = 2
    text.Color = Color3.fromRGB(255,255,255)
    text.Size = 13

    local c1
    local c2
    local c3

    local function dc()
        text.Visible = false
        text:Remove()
        if c1 then
            c1:Disconnect()
            c1 = nil 
        end
        if c2 then
            c2:Disconnect()
            c2 = nil 
        end
        if c3 then
            c3:Disconnect()
            c3 = nil 
        end
    end

    c2 = cr.AncestryChanged:Connect(function(_,parent)
        if not parent then
            dc()
        end
    end)

    c3 = h.HealthChanged:Connect(function(v)
        if (v<=0) or (h:GetState() == Enum.HumanoidStateType.Dead) then
            dc()
        end
    end)

    c1 = rs.RenderStepped:Connect(function()
        local hrp_pos,hrp_onscreen = c:WorldToViewportPoint(hrp.Position)
        if hrp_onscreen then
            text.Position = Vector2.new(hrp_pos.X, hrp_pos.Y)
            text.Text = p.Name
            text.Visible = true
        else
            text.Visible = false
        end
    end)
end

local function p_added(p)
    if p.Character then
        esp(p,p.Character)
    end
    p.CharacterAdded:Connect(function(cr)
        esp(p,cr)
    end)
end

for i,p in next, ps:GetPlayers() do 
    if p ~= lp then
        p_added(p)
    end
end


a:Toggle("Tracers",function(bool)
    local lplr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint

_G.TeamCheck = false -- Use True or False to toggle TeamCheck

for i,v in pairs(game.Players:GetChildren()) do
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1,1,1)
    Tracer.Thickness = 1
    Tracer.Transparency = 1

    function lineesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                if OnScreen then
                    Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)

                    if _G.TeamCheck and v.TeamColor == lplr.TeamColor then
                        --//Teammates
                        Tracer.Visible = false
                    else
                        --//Enemies
                        Tracer.Visible = true
                    end
                else
                    Tracer.Visible = false
                end
            else
                Tracer.Visible = false
            end
        end)
    end
    coroutine.wrap(lineesp)()
end

game.Players.PlayerAdded:Connect(function(v)
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1,1,1)
    Tracer.Thickness = 1
    Tracer.Transparency = 1

    function lineesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                if OnScreen then
                    Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)

                    if _G.TeamCheck and v.TeamColor == lplr.TeamColor then
                        --//Teammates
                        Tracer.Visible = false
                    else
                        --//Enemies
                        Tracer.Visible = true
                    end
                else
                    Tracer.Visible = false
                end
            else
                Tracer.Visible = false
            end
        end)
    end
    coroutine.wrap(lineesp)()
end)
end)

a:Toggle("Skelton Esp",function(bool)
    local camera = workspace.CurrentCamera
    local entities = game:GetService("Players")
    local localplayer = entities.LocalPlayer 
    local runservice = game:GetService("RunService")
    
    local esp_settings = {
        enabled = true,
        skel = true,
        skel_col = Color3.fromRGB(255,255,255)
    }
    
    local function draw(player, character)
    
        local skel_head = Drawing.new("Line")
        skel_head.Visible = false
        skel_head.Thickness = 1.5
        skel_head.Color = Color3.new(1,1,1)
    
        local skel_torso = Drawing.new("Line")
        skel_torso.Visible = false
        skel_torso.Thickness = 1.5
        skel_torso.Color = Color3.new(1,1,1)
    
        local skel_leftarm = Drawing.new("Line")
        skel_leftarm.Visible = false
        skel_leftarm.Thickness = 1.5
        skel_leftarm.Color = Color3.new(1,1,1)
    
        local skel_rightarm = Drawing.new("Line")
        skel_rightarm.Visible = false
        skel_rightarm.Thickness = 1.5
        skel_rightarm.Color = Color3.new(1,1,1)
    
        local skel_leftleg = Drawing.new("Line")
        skel_leftleg.Visible = false
        skel_leftleg.Thickness = 1.5
        skel_leftleg.Color = Color3.new(1,1,1)
    
        local skel_rightleg = Drawing.new("Line")
        skel_rightleg.Visible = false
        skel_rightleg.Thickness = 1.5
        skel_rightleg.Color = Color3.new(1,1,1)
    
        local function update()
            local connection
            connection = runservice.RenderStepped:Connect(function()
    
                if workspace:FindFirstChild(character.Name) and
                character and 
                character:FindFirstChild("HumanoidRootPart") and 
                character:FindFirstChild("Humanoid") and 
                character:FindFirstChild("Humanoid").Health ~= 0 then 
    
                    local character_rootpart_3d = character.HumanoidRootPart.Position
                    local character_rootpart_2d, rootpart_onscreen = camera:WorldToViewportPoint(character_rootpart_3d)
    
                    if rootpart_onscreen and character.Humanoid.RigType == Enum.HumanoidRigType.R6 and esp_settings.enabled then
    
                        local head_2d = camera:WorldToViewportPoint(character.Head.Position)
                        local torso_upper_2d = camera:WorldToViewportPoint(character.Torso.Position + Vector3.new(0,1,0))
                        local torso_lower_2d = camera:WorldToViewportPoint(character.Torso.Position + Vector3.new(0,-1,0))
                        
                        local leftarm_2d = camera:WorldToViewportPoint(character["Left Arm"].Position + Vector3.new(0,-1,0))
                        local rightarm_2d = camera:WorldToViewportPoint(character["Right Arm"].Position + Vector3.new(0,-1,0))
                        local leftleg_2d = camera:WorldToViewportPoint(character["Left Leg"].Position + Vector3.new(0,-1,0))
                        local rightleg_2d = camera:WorldToViewportPoint(character["Right Leg"].Position + Vector3.new(0,-1,0))
    
                        skel_head.From = Vector2.new(head_2d.X, head_2d.Y)
                        skel_head.To = Vector2.new(torso_upper_2d.X, torso_upper_2d.Y)
    
                        skel_torso.From = Vector2.new(torso_upper_2d.X, torso_upper_2d.Y)
                        skel_torso.To = Vector2.new(torso_lower_2d.X, torso_lower_2d.Y)
                        
                        skel_leftarm.From = Vector2.new(torso_upper_2d.X, torso_upper_2d.Y)
                        skel_leftarm.To = Vector2.new(leftarm_2d.X, leftarm_2d.Y)
    
                        skel_rightarm.From = Vector2.new(torso_upper_2d.X, torso_upper_2d.Y)
                        skel_rightarm.To = Vector2.new(rightarm_2d.X, rightarm_2d.Y)
    
                        skel_leftleg.From = Vector2.new(torso_lower_2d.X, torso_lower_2d.Y)
                        skel_leftleg.To = Vector2.new(leftleg_2d.X, leftleg_2d.Y)
    
                        skel_rightleg.From = Vector2.new(torso_lower_2d.X, torso_lower_2d.Y)
                        skel_rightleg.To = Vector2.new(rightleg_2d.X, rightleg_2d.Y)
    
                        skel_head.Visible = esp_settings.skel
                        skel_torso.Visible = esp_settings.skel
                        skel_leftarm.Visible = esp_settings.skel
                        skel_rightarm.Visible = esp_settings.skel
                        skel_leftleg.Visible = esp_settings.skel
                        skel_rightleg.Visible = esp_settings.skel
    
                    else
    
                        skel_head.Visible = false
                        skel_torso.Visible = false
                        skel_leftarm.Visible = false
                        skel_rightarm.Visible = false
                        skel_leftleg.Visible = false
                        skel_rightleg.Visible = false
    
                    end
    
                else
    
                    if player == nil then
                        connection:Disconnect()
                        connection = nil 
                    end
    
                    skel_head.Visible = false
                    skel_torso.Visible = false
                    skel_leftarm.Visible = false
                    skel_rightarm.Visible = false
                    skel_leftleg.Visible = false
                    skel_rightleg.Visible = false
    
                end
            end)
        end
        coroutine.wrap(update)()
    
    end
    
    local function playeradded(player)
        if player.Character then
            coroutine.wrap(draw)(player, player.Character)
        end
        player.CharacterAdded:Connect(function(character)
            coroutine.wrap(draw)(player, character)
        end)
    end
    
    for a,b in next, entities:GetPlayers() do
        if b ~= localplayer then
            playeradded(b)
        end
    end
    
    entities.PlayerAdded:Connect(playeradded)
end)
ps.PlayerAdded:Connect(p_added)
end)
a:Toggle("Chams",function(bool)
    local players = game.Players:GetPlayers()

for i,v in pairs(players) do
    local esp = Instance.new("Highlight")
    esp.Name = v.Name
    esp.FillTransparency = 0
    esp.FillColor = Color3.new(1, 8.666667, 0)
    esp.OutlineColor = Color3.new(1, 0.333333, 1)
    esp.OutlineTransparency = 0
    esp.Parent = v.Character
end
end)
local a = w:CreateFolder("Movement Cheats")
a:Toggle("Disable Fly",function(bool)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/BypassedFly.lua"))() 
    Fly(false)
end)
a:Toggle("Fly",function(bool)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/BypassedFly.lua"))() 
    Fly(true)
end)
a:Toggle("Infinite Jump",function(bool)
    game:GetService("UserInputService").JumpRequest:connect(function()
        if InfiniteJumpEnabled then
            game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
        end
    end)
end)
a:Toggle("Ai Bot (PLAYS FOR YOU)",function(bool)

    -- Bot Settings
    getgenv().AimSens = 1/35; -- Aimbot sens
    getgenv().LookSens = 1/60; -- Aim while walking sens
    getgenv().PreAimDis = 45; -- if within 55 Studs then preaim
    getgenv().KnifeOutDis = 85; -- if within 85 Studs then swap back to gun
    getgenv().ReloadDis = 30; -- if over 50 Studs away then reload
    getgenv().RecalDis = 15; -- if player moves over this many studs then recalculate path to them
    
    -- Services
    local PathfindingService = game:GetService("PathfindingService");
    local Players = game:GetService("Players");
    local ReplicatedStorage = game:GetService("ReplicatedStorage");
    local RunService = game:GetService("RunService");
    local TweenService = game:GetService('TweenService');
    local VIM = game:GetService("VirtualInputManager");
    local UserInputService = game:GetService("UserInputService");
    
    -- Local Plr
    local Plr = Players.LocalPlayer;
    local Char = Plr.Character or Plr.CharacterAdded:Wait();
    local Head = Char:WaitForChild("Head", 1337);
    local Root = Char:WaitForChild("HumanoidRootPart", 1337);
    local Humanoid = Char:WaitForChild("Humanoid", 1337);
    
    -- GUI Stuff
    local MainMenu = Plr.PlayerGui:WaitForChild("Menew", 1337);
    local PlayButton = MainMenu:WaitForChild("Main", 1337).Play;
    local MainHUD = Plr.PlayerGui:WaitForChild("GUI", 1337);
    local TeamSelection = MainHUD:WaitForChild("TeamSelection", 1337);
    local Events = ReplicatedStorage:WaitForChild("Events", 1337);
    
    -- Team/Spawn Stuff
    local buttonColors = {"Blu", "Rd", "Ylw", "Grn"};
    
    -- error bypass
    for i,v in pairs(getconnections(game:GetService("ScriptContext").Error)) do v:Disable() end
    
    -- Simple ESP
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/SimpleESP.lua", true))()
    
    -- Current Path
    local currpath = PathfindingService:CreatePath({["WaypointSpacing"] = 5});
    
    -- Aimbot Vars
    local Camera = workspace.CurrentCamera;
    
    -- Mouse
    local Mouse = Plr:GetMouse();
    
    -- Map Spawns
    local Map = workspace:WaitForChild("Map", 1337)
    local Spawns = workspace:WaitForChild("Map", 1337):WaitForChild("Spawns", 1337)
    
    -- Ignore
    local RayIgnore = workspace:WaitForChild("Ray_Ignore", 1337)
    local MapIgnore = Map:WaitForChild("Ignore", 1337)
    
    -- Temp Vars
    local CurrentEquipped = "Gun";
    local ClosestPlr;
    local IsAiming;
    local InitialPosition;
    local WalkToObject;
    
    -- Get Closest plr
    local function getClosestPlr()
        local nearestPlayer, nearestDistance
        for _, player in pairs(Players:GetPlayers()) do
            if player.TeamColor ~= Plr.TeamColor and player ~= Plr then
                local character = player.Character
                if character then
                    local nroot = character:FindFirstChild("HumanoidRootPart")
                    if nroot and player:FindFirstChild("Status").Alive.Value then
                        if character.Humanoid and (character.Humanoid:GetState() ~= Enum.HumanoidStateType.Climbing and character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall) then
                            local distance = Plr:DistanceFromCharacter(nroot.Position)
                            if (nearestDistance and distance >= nearestDistance) then continue end
                            nearestDistance = distance
                            nearestPlayer = player
                        end
                    end
                end
            end
        end
        return nearestPlayer
    end
    
    -- Wallcheck / Visible Check
    local function IsVisible(target, ignorelist)
        local obsParts = Camera:GetPartsObscuringTarget({target}, ignorelist);
    
        if #obsParts == 0 then
            return true;
        else
            return false;
        end
    end
    
    -- Aimbot/Triggerbot
    local function Aimlock()
        -- Temp Holder
        local aimpart = nil;
    
        -- Detect first visible part
        if ClosestPlr and ClosestPlr.Character then
            for i,v in ipairs(ClosestPlr.Character:GetChildren()) do
                if v and v:IsA("Part") then -- is part
                    if IsVisible(v.Position,{Camera,Char,ClosestPlr.Character,RayIgnore,MapIgnore}) then -- is visible
                        aimpart = v;
                        break;
                    end
                end
            end
        end
    
        -- If visible aim and shoot
        if aimpart then
            IsAiming = true;
            -- Aim at player
            local tcamcframe = Camera.CFrame;
            for i = 0, 1, AimSens do
                if not aimpart then break; end
                if (Head.Position.Y + aimpart.Position.Y) < 0 then break; end -- Stop bot from aiming at the ground
                Camera.CFrame = tcamcframe:Lerp(CFrame.new(Camera.CFrame.p, aimpart.Position), i)
                task.wait(0)
            end
    
            -- Mouse down and back up
            VIM:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, true, game, 1)
            task.wait(0.25)
            VIM:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, false, game, 1)
        end
    
        IsAiming = false;
    end
    
    -- Auto Spawn
    local function AutoSpawn()
        if MainMenu.Enabled then
            -- Fire play button
            for i,v in pairs(getconnections(PlayButton.MouseButton1Down)) do
               v:Fire();
            end
    
            -- Wait for GUI to change
            repeat task.wait(1) until TeamSelection.Visible;
    
            -- Buttons check and auto team select
            if TeamSelection:FindFirstChild("Buttons").Visible then -- normal
                for i, teamButton in pairs(TeamSelection:FindFirstChild("Buttons"):GetChildren()) do
                    if table.find(buttonColors, teamButton.Name) and not teamButton.lock.Visible then
                        for i,v in pairs(getconnections(teamButton.MouseButton1Down)) do
                           v:Fire();
                        end
                        break;
                    end
                end
            elseif TeamSelection:FindFirstChild("ButtonsFFA").Visible then -- FFA
                for i,v in pairs(getconnections(TeamSelection:FindFirstChild("ButtonsFFA").FFA.MouseButton1Down)) do
                    v:Fire();
                end
            end
        end
    end
    
    -- Pathfinding to Plr function
    WalkToObject = function()
        if ClosestPlr and ClosestPlr.Character then
            -- RootPart
            local CRoot = ClosestPlr.Character:FindFirstChild("HumanoidRootPart")
            if CRoot then
                -- Get start position
                InitialPosition = CRoot.Position;
    
                -- Calculate path
                local success, errorMessage = pcall(function()
                    currpath:ComputeAsync(Root.Position, CRoot.Position)
                end)
    
                if success and currpath.Status == Enum.PathStatus.Success then
                    local waypoints = currpath:GetWaypoints();
    
                    -- Navigate to each waypoint
                    for i, wap in pairs(waypoints) do
                        -- Catcher
                        if i == 1 then continue end -- skip first waypoint
                        if not ClosestPlr or not ClosestPlr.Character or ClosestPlr ~= getClosestPlr() or not ClosestPlr:FindFirstChild("Status").Alive.Value or not Plr:FindFirstChild("Status").Alive.Value then
                            ClosestPlr = nil;
                            return;
                        elseif (InitialPosition - CRoot.Position).Magnitude > RecalDis  then -- moved too far from start
                            WalkToObject(); -- restart
                            return;
                        end
    
                        -- Detect if needing to jump
                        if wap.Action == Enum.PathWaypointAction.Jump and Humanoid and Humanoid.Jump == false then
                            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        end
    
                        -- Aim while walking (either path or plr)
                        task.spawn(function()
                            local primary = ClosestPlr.Character.PrimaryPart.Position;
                            local studs = Plr:DistanceFromCharacter(primary)
    
                            local tcamcframe = Camera.CFrame;
                            for i = 0, 1, LookSens do
                                if IsAiming then break; end
                                if primary and studs then
                                    -- If close aim at player
                                    if math.floor(studs + 0.5) < PreAimDis then
                                        if ClosestPlr and ClosestPlr.Character then
                                            local CChar = ClosestPlr.Character;
                                            if Char:FindFirstChild("Head") and CChar and CChar:FindFirstChild("Head") then
                                                local MiddleAim = (Vector3.new(wap.Position.X,Char.Head.Position.Y,wap.Position.Z) + Vector3.new(CChar.Head.Position.X,CChar.Head.Position.Y,CChar.Head.Position.Z))/2;
                                                Camera.CFrame = tcamcframe:Lerp(CFrame.new(Camera.CFrame.p, MiddleAim), i);
                                            end
                                        end
                                    else -- else aim at waypoint
                                        local mixedaim = (Camera.CFrame.p.Y + Char.Head.Position.Y)/2;
                                        Camera.CFrame = tcamcframe:Lerp(CFrame.new(Camera.CFrame.p, Vector3.new(wap.Position.X,mixedaim,wap.Position.Z)), i);
                                    end
                                end
                                task.wait(0)
                            end
                        end)
    
                        -- Auto Knife out (for faster running and realism)
                        task.spawn(function()
                            local primary = ClosestPlr.Character.PrimaryPart.Position;
                            local studs = Plr:DistanceFromCharacter(primary)
    
                            if primary and studs then
                                local arms = Camera:FindFirstChild("Arms");
                                if arms then
                                    arms = arms:FindFirstChild("Real");
                                    if math.floor(studs + 0.5) > KnifeOutDis and not IsVisible(primary, {Camera,Char,ClosestPlr.Character,RayIgnore,MapIgnore}) then
                                        if arms.Value ~= "Knife" and CurrentEquipped == "Gun" then
                                            VIM:SendKeyEvent(true, Enum.KeyCode.Q, false, game);
                                            CurrentEquipped = "Knife";
                                        end
                                    elseif arms.Value == "Knife" and CurrentEquipped ~= "Gun" then
                                        VIM:SendKeyEvent(true, Enum.KeyCode.Q, false, game);
                                        CurrentEquipped = "Gun";
                                    end
                                end
                            end
                        end)
    
                        -- Move to Waypoint
                        if Humanoid then
                            Humanoid:MoveTo(wap.Position);
                            Humanoid.MoveToFinished:Wait(); -- Wait for us to get to Waypoint
                        end
                    end
                else
                    -- Can't find path, move to a random spawn.
                    warn("[AimmyAI] - Unable to calculate path!");
                    WalkToObject(); -- restart
                end
            end
        end
    end
    
    -- Walk to the Plr
    local function WalkToPlr()
        -- Get Closest Plr
        ClosestPlr = getClosestPlr();
    
        -- Walk to Plr
        if ClosestPlr and ClosestPlr.Character and ClosestPlr.Character:FindFirstChild("HumanoidRootPart") then
            if Humanoid.WalkSpeed > 0 and Plr:FindFirstChild("Status").Alive.Value and ClosestPlr:FindFirstChild("Status").Alive.Value then
                --Create ESP
                local studs = Plr:DistanceFromCharacter(ClosestPlr.Character.PrimaryPart.Position)
                SESP_Create(ClosestPlr.Character.Head, ClosestPlr.Name, "TempTrack", Color3.new(1, 0, 0), math.floor(studs + 0.5));
    
                -- Auto Reload (if next plr is far enough and out of site)
                if math.floor(studs + 0.5) > ReloadDis and not IsVisible(ClosestPlr.Character.HumanoidRootPart.Position, {Camera,Char,ClosestPlr.Character,RayIgnore,MapIgnore}) then
                    VIM:SendKeyEvent(true, Enum.KeyCode.R, false, game)
                end
    
                -- AI Walk to Plr
                WalkToObject(ClosestPlr.Character.HumanoidRootPart);
            end
        end
    end
    
    -- Loop Auto Spawn
    task.spawn(function()
        while task.wait(0.5) do
            AutoSpawn();
        end
    end)
    
    -- Loop Pathfind
    task.spawn(function()
        while task.wait() do
            if (ClosestPlr == nil or ClosestPlr ~= getClosestPlr()) then
                SESP_Clear("TempTrack");
                WalkToPlr();
            end
        end
    end)
    
    -- Loop Aimlock
    task.spawn(function()
        while task.wait() do
            if ClosestPlr ~= nil and Camera then
                if Plr:FindFirstChild("Status").Alive.Value and Humanoid.WalkSpeed > 0 then
                    Aimlock();
                end
            end
        end
    end)
    
    
    -- Detect Stuck Bot
    local stuckamt = 0;
    task.spawn(function()
        while task.wait(0.5) do
            if Humanoid then
                if Humanoid.MoveDirection.Magnitude == 0 then
                    if stuckamt == 5 then
                        -- Double jump
                        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        warn("[AimmyAI] - Attempting to jump out of stuck position..");
                        stuckamt = 0;
                    elseif stuckamt >= 10 then
                        SESP_Clear("TempTrack");
                        WalkToPlr();
                        warn("[AimmyAI] - Max stuck count, recalculating..");
                        stuckamt = 0;
                    end
                end
            end
        end
    end)
end)
local a = w:CreateFolder("BAN")
a:Toggle("Ban yourself",function(bool)
    if not isfile("outro.mp3") then writefile("outro.mp3", game:HttpGet("https://github.com/lolct/hack/blob/main/outro.mp3?raw=true")) end local song = Instance.new("Sound", workspace) song.SoundId = getsynasset("outro.mp3") song:play() task.wait(9.1) game.ReplicatedStorage.Peep:FireServer()
end)
