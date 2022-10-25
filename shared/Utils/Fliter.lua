local LightingService = game:GetService("Lighting")
local Applying = false
local Objects = {}

local module = {

	-- To create your own filter, just add another table like these
	-- and give it a unique key so it can be called in module.ApplyFilter
	Filters = {

		["None"] = {
			["BloomEffect"] = { Intensity = 0, Size = 0, Threshold = 5 },
			["BlurEffect"] = { Size = 0 },
			["ColorCorrectionEffect"] = {
				Brightness = 0,
				Contrast = 0,
				Saturation = 0,
				TintColor = Color3.fromRGB(255, 255, 255),
			},
			["SunRaysEffect"] = { Intensity = 0, Spread = 0 },
		},

		["Vintage"] = {
			["BloomEffect"] = { Intensity = 2, Size = 50, Threshold = 1 },
			["BlurEffect"] = { Size = 3 },
			["ColorCorrectionEffect"] = {
				Brightness = 0.04,
				Contrast = -0.1,
				Saturation = -0.05,
				TintColor = Color3.fromRGB(252, 255, 233),
			},
			["SunRaysEffect"] = { Intensity = 0.1, Spread = 0.1 },
		},

		["Warm"] = {
			["BloomEffect"] = { Intensity = 2, Size = 50, Threshold = 1 },
			["BlurEffect"] = { Size = 2 },
			["ColorCorrectionEffect"] = {
				Brightness = 0.01,
				Contrast = 0.01,
				Saturation = 0.1,
				TintColor = Color3.fromRGB(255, 227, 180),
			},
			["SunRaysEffect"] = { Intensity = 0.1, Spread = 0.1 },
		},

		["Cool"] = {
			["BloomEffect"] = { Intensity = 5, Size = 40, Threshold = 1 },
			["BlurEffect"] = { Size = 2 },
			["ColorCorrectionEffect"] = {
				Brightness = -0.03,
				Contrast = -0.1,
				Saturation = -0.1,
				TintColor = Color3.fromRGB(212, 240, 255),
			},
			["SunRaysEffect"] = { Intensity = 0.05, Spread = 0.03 },
		},

		["Negative"] = {
			["BloomEffect"] = { Intensity = 10, Size = 50, Threshold = 1 },
			["BlurEffect"] = { Size = 0 },
			["ColorCorrectionEffect"] = {
				Brightness = 0.1,
				Contrast = -1.8,
				Saturation = -1,
				TintColor = Color3.fromRGB(235, 246, 255),
			},
			["SunRaysEffect"] = { Intensity = 0.2, Spread = 0.1 },
		},

		["Realistic"] = {
			["BloomEffect"] = { Intensity = 1, Size = 38, Threshold = 0.8 },
			["BlurEffect"] = { Size = 2 },
			["ColorCorrectionEffect"] = {
				Brightness = -0.01,
				Contrast = 0.06,
				Saturation = -0.06,
				TintColor = Color3.fromRGB(255, 253, 252),
			},
			["SunRaysEffect"] = { Intensity = 0.2, Spread = 0.1 },
		},

		["Western"] = {
			["BloomEffect"] = { Intensity = 2, Size = 40, Threshold = 1 },
			["BlurEffect"] = { Size = 1 },
			["ColorCorrectionEffect"] = {
				Brightness = 0.02,
				Contrast = -0.03,
				Saturation = -0.4,
				TintColor = Color3.fromRGB(255, 205, 123),
			},
			["SunRaysEffect"] = { Intensity = 0.1, Spread = 0.7 },
		},

		["Old School"] = {
			["BloomEffect"] = { Intensity = 3, Size = 50, Threshold = 1 },
			["BlurEffect"] = { Size = 2 },
			["ColorCorrectionEffect"] = {
				Brightness = 0.05,
				Contrast = 0.06,
				Saturation = -0.95,
				TintColor = Color3.fromRGB(249, 255, 255),
			},
			["SunRaysEffect"] = { Intensity = 0.5, Spread = 0.02 },
		},

		["Meme"] = {
			["BloomEffect"] = { Intensity = 10, Size = 80, Threshold = 1 },
			["BlurEffect"] = { Size = 1 },
			["ColorCorrectionEffect"] = {
				Brightness = 0.2,
				Contrast = 1,
				Saturation = 30,
				TintColor = Color3.fromRGB(255, 255, 255),
			},
			["SunRaysEffect"] = { Intensity = 0.01, Spread = 0.12 },
		},
	},
}

function module:ApplyFilter(FilterType)
	--Avoid doing two applications at once and making a mess
	if Applying then
		repeat
			task.wait(0.1)
		until not Applying
	end
	Applying = true

	--Remove old filter
	for i = 1, #Objects do
		Objects[i]:Destroy()
	end

	--Find chosen filter
	local Filter = self.Filters[FilterType] or self.Filters.Realistic

	--Apply filter
	for obj, props in pairs(Filter) do
		local effect = Instance.new(obj)

		for p, v in pairs(props) do
			effect[p] = v
		end

		Objects[#Objects + 1] = effect

		effect.Parent = LightingService
	end

	--Allow new application
	Applying = false
end

return module
