local input = {}
local uis = game:service'UserInputService'

input.mouse = game:GetService'Players'.LocalPlayer:GetMouse();

input.down = setmetatable({}, {
	__index = function(i, v)
		local isDown = false;
		v = v:lower();
		for _, key in pairs(Enum.UserInputType:GetEnumItems()) do
			if (key.Name:lower() == v and uis:IsMouseButtonPressed(key.Name)) then
				isDown = true;
			end
		end
		for _, key in pairs(Enum.KeyCode:GetEnumItems()) do
			if (key.Name:lower() == v and uis:IsKeyDown(key.Name)) then
				isDown = true;
			end
		end
		return isDown
	end
})

getgenv().input = input;
