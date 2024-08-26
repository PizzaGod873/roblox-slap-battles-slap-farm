
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Mobile%20Friendly%20Orion')))()
local Window = OrionLib:MakeWindow({Name = "Slap Battles slap farm", HidePremium = true, IntroEnabled = false, SaveConfig = false, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Home",
    PremiumOnly = false
})

if not game.Workspace:FindFirstChild("PlayerPlatform") then
	print("Part does not exist! Adding part...")

	Part = Instance.new("Part")
	print("Part instance added!")

	Part.Name = "PlayerPlatform"
	Part.Anchored = true
	Part.Size = Vector3.new(250, 2.5, 250)
	Part.Position = Vector3.new(100000, 10000, 100000)
	print("Part properites added!")

	Part.Parent = game.Workspace
	print("Part fully added!")
else
	print("Part exists!")
end

Tab:AddButton({
	Name = "Destroy GUI",
	Callback = function()
      		OrionLib:Destroy()
  	end    
})

Tab:AddButton({
	Name = "Infinite Yield",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  	end    
})

Tab:AddToggle({
	Name = "Teleport to part (teleports every 30 seconds)",
    Default = false,
	Callback = function(Value)
		while Value == true do
			game.Players.LocalPlayer.Character:MoveTo(Vector3.new(100000, 10000, 100000))
			wait(30)
		end
	end
})

RSF = Tab:AddToggle({
        Name = "Replica Slap Farm (Use default arena portal)",
        Default = false,
	Callback = function(Value)
	ReplicaFarm = Value
	if game.Players.LocalPlayer.leaderstats.Glove.Value == "Replica" and game.Players.LocalPlayer.Character.IsInDefaultArena.Value == true then
		if ReplicaFarm == true then
			coroutine.wrap(SpamReplica)()
		end
		while ReplicaFarm do
			for i, v in pairs(workspace:GetChildren()) do
                		if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("HumanoidRootPart") then
					game.ReplicatedStorage.b:FireServer(v:WaitForChild("HumanoidRootPart"))
                		end
            		end
			task.wait()
		end
		elseif ReplicaFarm == true then
			OrionLib:MakeNotification({Name = "Error",Content = "You don't have Replica equipped, or you aren't in the Default arena.",Image = "rbxassetid://7733658504",Time = 5})
			wait(0.05)
			RSF:Set(false)
		end
	end
})

function SpamReplica()
while ReplicaFarm do
	game:GetService("ReplicatedStorage").Duplicate:FireServer()
	wait(19.9)
	end
end
OrionLib:Init()
