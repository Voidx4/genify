local v1 = unpack or table.unpack
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local LocalPlayer = Players.LocalPlayer
local t1 = {
	AutoDetectActive = false,
	AutoHopActive = false,
	MaxPlayers = 1,
	AutoDetectThreshold = 3,
	AutoSave = true
}
local function v12()
    if writefile then
        pcall(function()
            writefile("AxionAutoDetectConfig.json", HttpService:JSONEncode(t1))
        end)
    end
end;
(function()
    local _isfile = isfile

    if _isfile then
        _isfile = readfile

        if _isfile then
            _isfile = isfile("AxionAutoDetectConfig.json")
        end
    end

    if _isfile then
        local ok, result = pcall(function()
            local v256 = HttpService
            local t2 = { readfile("AxionAutoDetectConfig.json") }

            return v256:JSONDecode(v1(t2))
        end)

        if ok then
            ok = type(result) == "table"
        end

        if ok then
            for k, v in pairs(result) do
                t1[k] = v
            end
        end
    end
end)()
task.spawn(function()
    local Sound = Instance.new("Sound")

    Sound.SoundId = "rbxassetid://106806057419587"
    Sound.Volume = 0.5
    Sound.Parent = SoundService
    Sound:Play()
    Sound.Ended:Connect(function()
        Sound:Destroy()
    end)
end)
local t3 = {}
local ok, result = pcall(function()
    if gethui then
        return gethui()
    end

    local _syn = syn

    if _syn then
        _syn = syn.protect_gui
    end

    if _syn then
        local ScreenGui = Instance.new("ScreenGui")

        syn.protect_gui(ScreenGui)

        return CoreGui
    end

    return CoreGui
end)
local v16 = ok and result
if not v16 then
    v16 = CoreGui
end
local v17 = v16
local function v18()
    for _, child in pairs(Lighting:GetChildren()) do
        local v61 = child:IsA("BlurEffect")

        if v61 then
            v61 = child.Name:find("Axion")
        end

        if v61 then
            child:Destroy()
        end
    end
end
local color3 = Color3.fromRGB(18, 10, 24)
local color3_2 = Color3.fromRGB(28, 16, 38)
local color3_3 = Color3.fromRGB(38, 22, 50)
local color3_4 = Color3.fromRGB(52, 30, 68)
local color3_5 = Color3.fromRGB(200, 0, 255)
local color3_6 = Color3.fromRGB(150, 0, 200)
local color3_7 = Color3.fromRGB(230, 100, 255)
local color3_8 = Color3.fromRGB(255, 255, 255)
local color3_9 = Color3.fromRGB(210, 180, 230)
local color3_10 = Color3.fromRGB(140, 110, 160)
local color3_11 = Color3.fromRGB(60, 35, 80)
local color3_12 = Color3.fromRGB(35, 18, 48)
local color3_13 = Color3.fromRGB(14, 8, 20)
local Gotham = Enum.Font.Gotham
local t4 = {
	Default = {
		Background = color3,
		BackgroundTransparency = 0.1,
		Container = color3_2,
		ContainerTransparency = 0.15,
		Element = color3_3,
		ElementTransparency = 0.2,
		ElementHover = color3_4,
		Accent = color3_5,
		AccentDark = color3_6,
		AccentGlow = color3_7,
		Text = color3_8,
		TextDark = color3_9,
		TextMuted = color3_10,
		Border = color3_11,
		BorderTransparency = 0.4,
		GradientStart = color3_12,
		GradientEnd = color3_13,
		Font = Gotham
	}
}
local t5 = {
	Create = function(_, p2, p3, p4)
    local v68 = Instance.new(p2)
    local v69 = p3
    local _pairs = pairs

    if not p3 then
        v69 = {}
    end

    for v71, v72 in _pairs(v69) do
        local v73 = v71

        if v73 ~= "Parent" then
            v68[v73] = v72
        end
    end

    local _pairs2 = pairs

    if not p4 then
        p4 = {}
    end

    for _, v76 in _pairs2(p4) do
        v76.Parent = v68
    end

    if p3 and p3.Parent then
        v68.Parent = p3.Parent
    end

    return v68
end,
	Tween = function(_, p6, p7, p8, p9, p10)
    if not p6 then
        return
    end

    local new = TweenInfo.new
    local v84 = p8 or 0.25

    if not p9 then
        p9 = Enum.EasingStyle.Quart
    end

    if not p10 then
        p10 = Enum.EasingDirection.Out
    end

    local v85 = new(v84, p9, p10)
    local tween = TweenService:Create(p6, v85, p7)

    tween:Play()

    return tween
end
}
function t5.AnimateClick(_, p12)
    if not p12 then
        return
    end

    local p12Size = p12.Size
    local v90 = t5
    local new = UDim2.new
    local XScale = p12Size.X.Scale
    local v93 = p12Size.X.Offset - 4
    local YScale = p12Size.Y.Scale
    local p12SizeY = p12Size.Y
    local Tween = v90.Tween
    local v97 = new(XScale, v93, YScale, p12SizeY.Offset - 4)
    local _Enum = Enum

    Tween(v90, p12, {
		Size = v97
	}, 0.08, _Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    task.delay(0.08, function()
        t5:Tween(p12, {
			Size = p12Size
		}, 0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    end)
end
function t5.MakeDraggable(_, p14, p15, p16)
    local u103
    local u104
    local inputPosition
    local u106
    p15.InputBegan:Connect(function(input)
        local v261 = input.UserInputType == Enum.UserInputType.MouseButton1

        if not v261 then
            v261 = input.UserInputType == Enum.UserInputType.Touch
        end

        if v261 then
            u103 = true
            inputPosition = input.Position
            u106 = p14.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    u103 = false
                end
            end)
        end
    end)
    p15.InputChanged:Connect(function(input)
        local v263 = input.UserInputType == Enum.UserInputType.MouseMovement

        if not v263 then
            v263 = input.UserInputType == Enum.UserInputType.Touch
        end

        if v263 then
            u104 = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == u104 and u103 then
            local v265 = input.Position - inputPosition
            local v266 = t5
            local v267 = p14
            local uDim2 = UDim2.new(u106.X.Scale, u106.X.Offset + v265.X, u106.Y.Scale, u106.Y.Offset + v265.Y)
            local v269 = p16

            v266:Tween(v267, {
				Position = uDim2
			}, (v269.AnimationSpeed or 0.25) * 0.5)
        end
    end)
end
function t3.CreateWindow(_, p18)
    if not p18 then
        p18 = {}
    end
    v18()
    if v17:FindFirstChild("ServerHopUI") then
        v17:FindFirstChild("ServerHopUI"):Destroy()
    end
    local v109 = p18.Name or "Bai Rus"
    local v110 = p18.Subtitle or "By G5B"
    local v111 = p18.Version or "v2.0"
    local Default = t4.Default
    local t6 = {
		AnimationSpeed = 0.25,
		CornerRadius = 10,
		ElementCornerRadius = 6
	}
    local t7 = {
		Tabs = {},
		CurrentTab = nil,
		Theme = Default
	}
    local v115 = t5
    local v116 = v17
    local Sibling = Enum.ZIndexBehavior.Sibling
    local v118 = v115:Create("ScreenGui", {
		Name = "ServerHopUI",
		Parent = v116,
		ZIndexBehavior = Sibling,
		ResetOnSpawn = false,
		IgnoreGuiInset = true
	})
    local v119 = t5
    local Background = Default.Background
    local DefaultBackgroundTransparency = Default.BackgroundTransparency
    local uDim2 = UDim2.new(0.5, 0, 0.5, 0)
    local uDim2_2 = UDim2.new(0, 380, 0, 280)
    local vector2 = Vector2.new(0.5, 0.5)
    local t8 = {
		Name = "MainContainer",
		Parent = v118,
		BackgroundColor3 = Background,
		BackgroundTransparency = DefaultBackgroundTransparency,
		Position = uDim2,
		Size = uDim2_2,
		AnchorPoint = vector2,
		ClipsDescendants = true
	}
    local v126 = t5
    local Create = v119.Create
    local v128 = v126:Create("UICorner", {
		CornerRadius = UDim.new(0, t6.CornerRadius)
	})
    local v129 = t5
    local Border = Default.Border
    local Create2 = v129.Create
    local BorderTransparency = Default.BorderTransparency
    local v133 = Create(v119, "Frame", t8, {
		v128,
		Create2(v129, "UIStroke", {
			Color = Border,
			Transparency = BorderTransparency,
			Thickness = 1.5
		}),
		t5:Create("UIGradient", {
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Default.GradientStart),
				ColorSequenceKeypoint.new(1, Default.GradientEnd)
			}),
			Rotation = 135
		})
	})
    local v134 = t5
    local new = UDim2.new
    local Create3 = v134.Create
    local v137 = new(1, 0, 1, 0)
    local v138 = Create3(v134, "CanvasGroup", {
		Name = "CanvasGroup",
		Parent = v133,
		Size = v137,
		BackgroundTransparency = 1,
		GroupTransparency = 1
	})
    t5:Tween(v138, {
		GroupTransparency = 0
	}, 0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local v139 = t5
    local Container = Default.Container
    local ContainerTransparency = Default.ContainerTransparency
    local uDim2_3 = UDim2.new(0, 8, 0, 8)
    local uDim2_4 = UDim2.new(1, -16, 0, 36)
    local t9 = {
		Name = "Header",
		Parent = v138,
		BackgroundColor3 = Container,
		BackgroundTransparency = ContainerTransparency,
		Position = uDim2_3,
		Size = uDim2_4
	}
    local v145 = t5
    local Create4 = v139.Create
    local v147 = v145:Create("UICorner", {
		CornerRadius = UDim.new(0, t6.CornerRadius)
	})
    local v148 = t5
    local Border2 = Default.Border
    local BorderTransparency2 = Default.BorderTransparency
    local v151 = Create4(v139, "Frame", t9, {
		v147,
		v148:Create("UIStroke", {
			Color = Border2,
			Transparency = BorderTransparency2,
			Thickness = 1
		})
	})
    local v152 = t5
    local _UDim2 = UDim2
    local Create5 = v152.Create
    local v155 = _UDim2.new(0, 10, 0, 2)
    local uDim2_5 = UDim2.new(0.6, 0, 0, 18)
    local DefaultFont = Default.Font
    local Accent = Default.Accent
    local Left = Enum.TextXAlignment.Left
    Create5(v152, "TextLabel", {
		Name = "Title",
		Parent = v151,
		BackgroundTransparency = 1,
		Position = v155,
		Size = uDim2_5,
		Font = DefaultFont,
		Text = v109,
		TextColor3 = Accent,
		TextSize = 13,
		TextXAlignment = Left
	})
    local v160 = t5
    local uDim2_6 = UDim2.new(0, 10, 0, 18)
    local uDim2_7 = UDim2.new(0, 0.6, 0, 14)
    local DefaultFont2 = Default.Font
    local v164 = v110 .. " | " .. v111
    local TextMuted = Default.TextMuted
    local Create6 = v160.Create
    local Left2 = Enum.TextXAlignment.Left
    Create6(v160, "TextLabel", {
		Name = "Subtitle",
		Parent = v151,
		BackgroundTransparency = 1,
		Position = uDim2_6,
		Size = uDim2_7,
		Font = DefaultFont2,
		Text = v164,
		TextColor3 = TextMuted,
		TextSize = 9,
		TextXAlignment = Left2
	})
    local v168 = t5
    local Create7 = v168.Create
    local Element = Default.Element
    local ElementTransparency = Default.ElementTransparency
    local uDim2_8 = UDim2.new(1, -28, 0.5, -11)
    local uDim2_9 = UDim2.new(0, 22, 0, 22)
    local DefaultFont3 = Default.Font
    local TextDark = Default.TextDark
    local t10 = {
		Name = "Close",
		Parent = v151,
		BackgroundColor3 = Element,
		BackgroundTransparency = ElementTransparency,
		Position = uDim2_8,
		Size = uDim2_9,
		Font = DefaultFont3,
		Text = "X",
		TextColor3 = TextDark,
		TextSize = 11,
		AutoButtonColor = false
	}
    local v177 = t5:Create("UICorner", {
		CornerRadius = UDim.new(0, 4)
	})
    local v178 = t5
    local Border3 = Default.Border
    local BorderTransparency3 = Default.BorderTransparency
    local v181 = Create7(v168, "TextButton", t10, {
		v177,
		v178:Create("UIStroke", {
			Color = Border3,
			Transparency = BorderTransparency3,
			Thickness = 1
		})
	})
    local v182 = t5:Create("UIStroke", {
		Color = Default.Accent,
		Thickness = 1.5,
		Transparency = 0
	})
    local v183 = t5
    local Create8 = v183.Create
    local Background2 = Default.Background
    local uDim2_10 = UDim2.new(0, 20, 0.5, -25)
    local uDim2_11 = UDim2.new(0, 50, 0, 50)
    local v188 = Create8(v183, "ImageButton", {
		Name = "ToggleUI",
		Parent = v118,
		BackgroundColor3 = Background2,
		Position = uDim2_10,
		Size = uDim2_11,
		Image = "rbxassetid://95686737781054",
		Visible = false
	}, {
		t5:Create("UICorner", {
			CornerRadius = UDim.new(1, 0)
		}),
		t5:Create("UIAspectRatioConstraint", {
			AspectRatio = 1
		}),
		v182
	})
    task.spawn(function()
        local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)

        TweenService:Create(v182, tweenInfo, {
			Color = Default.AccentGlow,
			Thickness = 2.5
		}):Play()
    end)
    v181.MouseButton1Click:Connect(function()
        t5:AnimateClick(v181)
        task.wait(0.08)
        v133.Visible = false
        v188.Visible = true
    end)
    v188.MouseButton1Click:Connect(function()
        t5:AnimateClick(v188)
        task.wait(0.08)
        v133.Visible = true
        v188.Visible = false
    end)
    t5:MakeDraggable(v133, v151, t6)
    t5:MakeDraggable(v188, v188, t6)
    local v189 = t5
    local Create9 = v189.Create
    local uDim2_12 = UDim2.new(0, 8, 0, 50)
    local uDim2_13 = UDim2.new(1, -16, 1, -58)
    local v193 = Create9(v189, "Frame", {
		Name = "ContentArea",
		Parent = v138,
		BackgroundTransparency = 1,
		Position = uDim2_12,
		Size = uDim2_13
	})
    local v194 = t5
    local Container2 = Default.Container
    local ContainerTransparency2 = Default.ContainerTransparency
    local uDim2_14 = UDim2.new(0, 100, 1, 0)
    local t11 = {
		Name = "TabContainer",
		Parent = v193,
		BackgroundColor3 = Container2,
		BackgroundTransparency = ContainerTransparency2,
		Size = uDim2_14
	}
    local v199 = t5
    local Create10 = v194.Create
    local v201 = v199:Create("UICorner", {
		CornerRadius = UDim.new(0, t6.CornerRadius)
	})
    local v202 = t5
    local Border4 = Default.Border
    local BorderTransparency4 = Default.BorderTransparency
    local v205 = Create10(v194, "Frame", t11, {
		v201,
		v202:Create("UIStroke", {
			Color = Border4,
			Transparency = BorderTransparency4,
			Thickness = 1
		})
	})
    local v206 = t5
    local uDim2_15 = UDim2.new(0, 4, 0, 4)
    local Create11 = v206.Create
    local uDim2_16 = UDim2.new(1, -8, 1, -8)
    local uDim2_17 = UDim2.new(0, 0, 0, 0)
    local AutomaticSizeY = Enum.AutomaticSize.Y
    local t12 = {
		Name = "TabList",
		Parent = v205,
		BackgroundTransparency = 1,
		Position = uDim2_15,
		Size = uDim2_16,
		ScrollBarThickness = 0,
		CanvasSize = uDim2_17,
		AutomaticCanvasSize = AutomaticSizeY
	}
    local v213 = t5
    local SortOrderLayoutOrder = Enum.SortOrder.LayoutOrder
    local uDim = UDim.new(0, 4)
    local v216 = Create11(v206, "ScrollingFrame", t12, { v213:Create("UIListLayout", {
		SortOrder = SortOrderLayoutOrder,
		Padding = uDim
	}) })
    local v217 = t5
    local Container3 = Default.Container
    local ContainerTransparency3 = Default.ContainerTransparency
    local uDim2_18 = UDim2.new(0, 106, 0, 0)
    local uDim2_19 = UDim2.new(1, -106, 1, 0)
    local t13 = {
		Name = "MainContent",
		Parent = v193,
		BackgroundColor3 = Container3,
		BackgroundTransparency = ContainerTransparency3,
		Position = uDim2_18,
		Size = uDim2_19,
		ClipsDescendants = true
	}
    local v223 = t5
    local Create12 = v217.Create
    local v225 = v223:Create("UICorner", {
		CornerRadius = UDim.new(0, t6.CornerRadius)
	})
    local v226 = t5
    local Border5 = Default.Border
    local BorderTransparency5 = Default.BorderTransparency
    local v229 = Create12(v217, "Frame", t13, {
		v225,
		v226:Create("UIStroke", {
			Color = Border5,
			Transparency = BorderTransparency5,
			Thickness = 1
		})
	})
    local u230 = v229
    function t7.CreateTab(_, p20)
        local t14 = {
			Name = p20
		}
        local v274 = t5
        local v275 = v216
        local Element2 = Default.Element
        local ElementTransparency2 = Default.ElementTransparency
        local uDim2_20 = UDim2.new(1, 0, 0, 30)
        local DefaultFont4 = Default.Font
        local TextDark2 = Default.TextDark
        local v281 = v274:Create("TextButton", {
			Name = p20,
			Parent = v275,
			BackgroundColor3 = Element2,
			BackgroundTransparency = ElementTransparency2,
			Size = uDim2_20,
			Font = DefaultFont4,
			Text = p20,
			TextColor3 = TextDark2,
			TextSize = 11,
			AutoButtonColor = false
		}, { t5:Create("UICorner", {
			CornerRadius = UDim.new(0, t6.ElementCornerRadius)
		}) })
        local v282 = t5
        local v283 = p20 .. "Content"
        local v284 = u230
        local uDim2_21 = UDim2.new(0, 8, 0, 8)
        local uDim2_22 = UDim2.new(1, -16, 1, -16)
        local Accent2 = Default.Accent
        local uDim2_23 = UDim2.new(0, 0, 0, 0)
        local AutomaticSizeY2 = Enum.AutomaticSize.Y
        local t15 = {
			Name = v283,
			Parent = v284,
			BackgroundTransparency = 1,
			Position = uDim2_21,
			Size = uDim2_22,
			ScrollBarThickness = 2,
			ScrollBarImageColor3 = Accent2,
			CanvasSize = uDim2_23,
			AutomaticCanvasSize = AutomaticSizeY2,
			Visible = false
		}
        local v291 = t5
        local Create13 = v282.Create
        local SortOrderLayoutOrder2 = Enum.SortOrder.LayoutOrder
        local uDim3 = UDim.new(0, 6)
        local v295 = Create13(v282, "ScrollingFrame", t15, { v291:Create("UIListLayout", {
			SortOrder = SortOrderLayoutOrder2,
			Padding = uDim3
		}) })

        v281.MouseButton1Click:Connect(function()
            t5:AnimateClick(v281)

            for _, v in pairs(t7.Tabs) do
                v.Button.BackgroundColor3 = Default.Element
                v.Button.TextColor3 = Default.TextDark
                v.Content.Visible = false
            end

            v281.BackgroundColor3 = Default.Accent
            v281.TextColor3 = Default.Text
            v295.Visible = true
        end)

        if #t7.Tabs == 0 then
            v281.BackgroundColor3 = Default.Accent
            v281.TextColor3 = Default.Text
            v295.Visible = true
        end

        t14.Button = v281
        t14.Content = v295
        table.insert(t7.Tabs, t14)

        function t14.CreateButton(_, p22, p23)
            local v326 = t5
            local v327 = v295
            local Element3 = Default.Element
            local ElementTransparency3 = Default.ElementTransparency
            local uDim2_24 = UDim2.new(1, 0, 0, 32)
            local DefaultFont5 = Default.Font
            local Create14 = v326.Create
            local DefaultText = Default.Text
            local t16 = {
				Parent = v327,
				BackgroundColor3 = Element3,
				BackgroundTransparency = ElementTransparency3,
				Size = uDim2_24,
				Font = DefaultFont5,
				Text = p22,
				TextColor3 = DefaultText,
				TextSize = 11,
				AutoButtonColor = false
			}
            local v335 = t5:Create("UICorner", {
				CornerRadius = UDim.new(0, t6.ElementCornerRadius)
			})
            local v336 = t5
            local Border6 = Default.Border
            local BorderTransparency6 = Default.BorderTransparency
            local v339 = Create14(v326, "TextButton", t16, {
				v335,
				v336:Create("UIStroke", {
					Color = Border6,
					Transparency = BorderTransparency6,
					Thickness = 1
				})
			})

            v339.MouseEnter:Connect(function()
                t5:Tween(v339, {
					BackgroundColor3 = Default.ElementHover
				}, 0.2)
            end)
            v339.MouseLeave:Connect(function()
                t5:Tween(v339, {
					BackgroundColor3 = Default.Element
				}, 0.2)
            end)
            v339.MouseButton1Click:Connect(function()
                t5:AnimateClick(v339)
                p23(v339)
            end)

            return v339
        end
        function t14.CreateToggle(_, p25, p26, p27)
            local u344 = p26 or false
            local v345 = t5
            local v346 = v295
            local v347 = u344

            if v347 then
                v347 = Default.Accent
            end

            if not v347 then
                v347 = Default.Element
            end

            local ElementTransparency4 = Default.ElementTransparency
            local uDim2_25 = UDim2.new(1, 0, 0, 32)
            local DefaultFont6 = Default.Font
            local v351 = u344

            if v351 then
                v351 = "ENABLED"
            end

            if not v351 then
                v351 = "DISABLED"
            end

            local v352 = p25 .. ": " .. v351
            local DefaultText = Default.Text
            local t17 = {
				Parent = v346,
				BackgroundColor3 = v347,
				BackgroundTransparency = ElementTransparency4,
				Size = uDim2_25,
				Font = DefaultFont6,
				Text = v352,
				TextColor3 = DefaultText,
				TextSize = 10,
				AutoButtonColor = false
			}
            local v355 = t5:Create("UICorner", {
				CornerRadius = UDim.new(0, t6.ElementCornerRadius)
			})
            local v356 = t5
            local Create15 = v345.Create
            local Border7 = Default.Border
            local BorderTransparency7 = Default.BorderTransparency
            local v360 = Create15(v345, "TextButton", t17, {
				v355,
				v356:Create("UIStroke", {
					Color = Border7,
					Transparency = BorderTransparency7,
					Thickness = 1
				})
			})

            v360.MouseButton1Click:Connect(function()
                t5:AnimateClick(v360)
                u344 = not u344

                local v396 = v360
                local v397 = u344

                if v397 then
                    v397 = Default.Accent
                end

                if not v397 then
                    v397 = Default.Element
                end

                v396.BackgroundColor3 = v397

                local v398 = v360
                local v399 = p25
                local v400 = u344 and "ENABLED"

                if not v400 then
                    v400 = "DISABLED"
                end

                v398.Text = v399 .. ": " .. v400
                p27(u344)
            end)

            return v360
        end
        function t14.CreateInput(_, p29, p30, p31)
            local v365 = t5
            local v366 = v295
            local Element4 = Default.Element
            local ElementTransparency5 = Default.ElementTransparency
            local uDim2_26 = UDim2.new(1, 0, 0, 32)
            local t18 = {
				Parent = v366,
				BackgroundColor3 = Element4,
				BackgroundTransparency = ElementTransparency5,
				Size = uDim2_26
			}
            local v371 = t5:Create("UICorner", {
				CornerRadius = UDim.new(0, t6.ElementCornerRadius)
			})
            local v372 = t5
            local v373 = Default
            local Create16 = v365.Create
            local Border8 = v373.Border
            local BorderTransparency8 = Default.BorderTransparency
            local v377 = Create16(v365, "Frame", t18, {
				v371,
				v372:Create("UIStroke", {
					Color = Border8,
					Transparency = BorderTransparency8,
					Thickness = 1
				})
			})
            local v378 = t5
            local uDim2_27 = UDim2.new(1, -16, 1, 0)
            local uDim2_28 = UDim2.new(0, 8, 0, 0)
            local DefaultFont7 = Default.Font

            if not p30 then
                p30 = ""
            end

            local DefaultText = Default.Text
            local Left3 = Enum.TextXAlignment.Left
            local v384 = v378:Create("TextBox", {
				Parent = v377,
				BackgroundTransparency = 1,
				Size = uDim2_27,
				Position = uDim2_28,
				Font = DefaultFont7,
				PlaceholderText = p29,
				Text = p30,
				TextColor3 = DefaultText,
				TextSize = 11,
				TextXAlignment = Left3
			})

            v384.FocusLost:Connect(function()
                p31(v384.Text)
            end)

            return v384
        end
        function t14.CreateLabel(_, p33)
            local v387 = t5
            local v388 = v295
            local uDim2_29 = UDim2.new(1, 0, 0, 18)
            local DefaultFont8 = Default.Font
            local AccentGlow = Default.AccentGlow
            local Create17 = v387.Create
            local Left4 = Enum.TextXAlignment.Left

            return (Create17(v387, "TextLabel", {
				Parent = v388,
				BackgroundTransparency = 1,
				Size = uDim2_29,
				Font = DefaultFont8,
				Text = p33,
				TextColor3 = AccentGlow,
				TextSize = 10,
				TextXAlignment = Left4
			}))
        end

        return t14
    end

    return t7
end
local v35 = t3:CreateWindow({
	Name = "rene baterbonia",
	Subtitle = "By renehubs",
	Version = "v2.0"
})
local v36 = v35:CreateTab("Server Hopper")
local v37 = v36:CreateLabel("Current Server: " .. #Players:GetPlayers() .. " player(s)")
local u38 = t1.MaxPlayers or 1
v36:CreateInput("Max Target Players", tostring(u38), function(p34)
    u38 = tonumber(p34) or 1
    t1.MaxPlayers = u38

    if t1.AutoSave then
        v12()
    end
end)
local u39 = t1.AutoDetectThreshold or 3
v36:CreateInput("Auto Hop Player Limit", tostring(u39), function(p35)
    u39 = tonumber(p35) or 3
    t1.AutoDetectThreshold = u39

    if t1.AutoSave then
        v12()
    end
end)
local u40
local function u41(p36)
    local PlaceId = game.PlaceId
    local JobId = game.JobId
    local v236 = p36 or u40

    if v236 then
        v236.Text = "SEARCHING..."
    end

    task.spawn(function()
        local s1 = ""
        local v297
        local g304
        local g305
        local result2
        for _ = 1, math.random(5, 12) do
            local v299 = "https://games.roblox.com/v1/games/" .. PlaceId .. ("/servers/Public?sortOrder=Desc&limit=100" .. (s1 ~= "") and "&cursor=" .. s1 or "")
            local u300 = v299
            local ok2, result3 = pcall(function()
                return game:HttpGet(u300)
            end)
            local v303 = result3
            repeat
                if g304 or not (ok2 and v303) then
                    g304 = false
                    g305 = true

                    break
                end

                local ok3

                ok3, result2 = pcall(function()
                    return HttpService:JSONDecode(v303)
                end)

                if ok3 then
                    ok3 = result2 and result2.nextPageCursor
                end

                if not ok3 then
                    g304 = true
                end
            until not g304
            if g305 then
                g305 = false

                break
            end
            s1 = result2.nextPageCursor
        end
        local v308 = PlaceId
        local v309 = s1 ~= "" and "&cursor=" .. s1
        if not v309 then
            v309 = ""
        end
        local v310 = "https://games.roblox.com/v1/games/" .. v308 .. "/servers/Public?sortOrder=Asc&limit=100" .. v309
        local ok4, result4 = pcall(function()
            return game:HttpGet(v310)
        end)
        local v313 = result4
        if ok4 and v313 then
            local ok5, result5 = pcall(function()
                return HttpService:JSONDecode(v313)
            end)

            if ok5 then
                ok5 = result5 and result5.data
            end

            if ok5 then
                local t19 = {}
                local _ipairs = ipairs
                for _, v319 in _ipairs(result5.data) do
                    local v320 = v319.id ~= JobId

                    if v320 then
                        v320 = v319.playing <= u38 and v319.playing > 0
                    end

                    if v320 then
                        table.insert(t19, v319)
                    end
                end
                if #t19 > 0 then
                    table.sort(t19, function(p37, p38)
                        return p37.playing < p38.playing
                    end)
                    v297 = t19[1]
                end
            end
        end
        if v297 then
            if v236 then
                v236.Text = "JOINING (" .. v297.playing .. ")..."
            end

            TeleportService:TeleportToPlaceInstance(PlaceId, v297.id, LocalPlayer)

            return
        end
        if v236 then
            v236.Text = "RETRYING..."
        end
        task.wait(0.5)
        u41(v236)
    end)
end
u40 = v36:CreateButton("HOP SERVER NOW", function()
    u41(u40)
end)
local AutoDetectActive = t1.AutoDetectActive
local function v43()
    local v237 = #Players:GetPlayers()

    v37.Text = "Current Server: " .. v237 .. " player(s)"

    if AutoDetectActive and v237 >= u39 then
        u41(u40)
    end
end
v36:CreateToggle("AUTO DETECT HOP", t1.AutoDetectActive, function(p39)
    AutoDetectActive = p39
    t1.AutoDetectActive = p39

    if t1.AutoSave then
        v12()
    end

    if AutoDetectActive then
        local v239 = #Players:GetPlayers()

        v37.Text = "Current Server: " .. v239 .. " player(s)"

        if AutoDetectActive and v239 >= u39 then
            u41(u40)
        end
    end
end)
Players.PlayerAdded:Connect(v43)
Players.PlayerRemoving:Connect(v43)
local AutoHopActive = t1.AutoHopActive
v36:CreateToggle("AUTO HOP", t1.AutoHopActive, function(p40)
    AutoHopActive = p40
    t1.AutoHopActive = p40

    if t1.AutoSave then
        v12()
    end

    if AutoHopActive then
        u41(u40)
    end
end)
local v45 = v35:CreateTab("AUTO")
v45:CreateLabel("Automated Controls")
v45:CreateToggle("AUTO TURN ON DETECT", t1.AutoDetectActive, function(p41)
    AutoDetectActive = p41
    t1.AutoDetectActive = p41

    if t1.AutoSave then
        v12()
    end

    if AutoDetectActive then
        local v242 = #Players:GetPlayers()

        v37.Text = "Current Server: " .. v242 .. " player(s)"

        if AutoDetectActive and v242 >= u39 then
            u41(u40)
        end
    end
end)
v45:CreateButton("FORCE ENABLE DETECT", function()
    t1.AutoDetectActive = true

    if t1.AutoSave then
        v12()
    end

    local v243 = #Players:GetPlayers()

    v37.Text = "Current Server: " .. v243 .. " player(s)"

    if AutoDetectActive and v243 >= u39 then
        u41(u40)
    end
end)
local v46 = v35:CreateTab("Scripts")
v46:CreateLabel("🟢 NO KEY REQUIRED")
v46:CreateButton("ON hub", function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/davizin713/ONhub/refs/heads/main/script.lua", true))()
    end)
end)
v46:CreateButton("Horizon", function()
    pcall(function()
        script_key = "Trial"
        loadstring(game:HttpGet("https://api.getpolsec.com/scripts/hosted/6582551b42d21c6b7eb55f1d76d8d50ce53cb35592093d6615b5e83437594dc0.lua"))()
    end)
end)
v46:CreateButton("Nasi hub", function()
    pcall(function()
        loadstring(game:HttpGet("https://www.nrlscript.com/raw/y9BUU6LkVW"))()
    end)
end)
v46:CreateButton("Lennon", function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lennonxscripts/lennonhubv2/refs/heads/main/stealaneggv2"))()
    end)
end)
v46:CreateButton("Miranda", function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/miirandahub/loader/refs/heads/main/stealaeggs"))()
    end)
end)
v46:CreateButton("Lkz", function()
    pcall(function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/65bf3459d87ba3ac46350e154b640929.lua"))()
    end)
end)
v46:CreateButton("Zeroin", function()
    pcall(function()
        loadstring(game:HttpGet("https://zeroinhub.com/api/script"))()
    end)
end)
v46:CreateButton("Decode", function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ItzYumi/Decode/refs/heads/main/DE%3ACODE.lua", true))()
    end)
end)
v46:CreateButton("Blxyo hub", function()
    pcall(function()
        loadstring(game:HttpGet("https://flowauth.net/v1/loaders/69d3463240384f3a73fbe32c178093a2.lua"))()
    end)
end)
v46:CreateButton("Hoshi hub", function()
    pcall(function()
        loadstring(game:HttpGet("https://hoshihub.site/loader.lua"))()
    end)
end)
v46:CreateButton("Sena hub", function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/senarblx/sena/refs/heads/main/loader"))()
    end)
end)
v46:CreateLabel("🔑 KEY REQUIRED")
v46:CreateButton("Bf", function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hanniii1/Loader/refs/heads/main/BFLoader.lua"))()
    end)
end)
v46:CreateButton("Fyy", function()
    pcall(function()
        loadstring(game:HttpGet("https://FyyCommunity.com"))()
    end)
end)
local v47 = v35:CreateTab("Owner")
v47:CreateLabel("Social Links")
local function v48(p42, p43, p44)
    if setclipboard then
        setclipboard(p42)
    else
        local _syn = syn

        if _syn then
            _syn = syn.write_clipboard
        end

        if _syn then
            syn.write_clipboard(p42)
        end
    end

    p43.Text = "COPIED!"
    task.wait(1.5)
    p43.Text = p44
end
v47:CreateButton("Discord", function(p46)
    v48("https://discord.gg/pzVJV34AH8", p46, "Discord")
end)
v47:CreateButton("OWNER: G5B", function(p47)
    v48("G5B", p47, "OWNER: G5B")
end)
v47:CreateButton("CEO: Morato", function(p47)
    v48("Morato", p47, "CEO: Morato")
end)
v47:CreateButton("CEO - Matthew", function(p48)
    v48("Matthew", p48, "CEO - Matthew")
end)
local v49 = v35:CreateTab("Config")
v49:CreateLabel("Configuration Manager")
v49:CreateButton("SAVE CONFIG", function(p49)
    v12()

    local p49Text = p49.Text

    p49.Text = "SAVED!"
    task.wait(1)
    p49.Text = p49Text
end)
v49:CreateToggle("AUTO-SAVE ON CHANGE", t1.AutoSave or false, function(p50)
    t1.AutoSave = p50
    v12()
end)
task.spawn(function()
    task.wait(1.5)

    if t1.AutoDetectActive then
        local v255 = #Players:GetPlayers()

        v37.Text = "Current Server: " .. v255 .. " player(s)"

        if AutoDetectActive and v255 >= u39 then
            u41(u40)
        end
    end

    if t1.AutoHopActive then
        u41(u40)
    end
end)