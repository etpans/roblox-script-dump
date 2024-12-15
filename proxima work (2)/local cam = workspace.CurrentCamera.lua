local cam = workspace.CurrentCamera

function DrawESP(part)
   local pos, vis = cam:WorldToScreenPoint(part.Position)
   
   local text = Drawing.new("Text")
   text.Text = "Nitrate"
   text.Color = part.Color
   text.Position = Vector2.new(pos.x, pos.y)
   text.Size = 18
   text.Outline = true
   text.Center = true
   text.Visible = true
   
   game:GetService("RunService").Stepped:connect(function()
       local descendant = part:IsDescendantOf(workspace)
       if not descendant and text ~= nil then
           text:Remove()
       end
       
       local pos, vis = cam:WorldToScreenPoint(part.Position)
       
       if part ~= nil then
           text.Position = Vector2.new(pos.x, pos.y)
       end

       if vis then
           text.Visible = true
       else
           text.Visible = false
       end
   end)
end

for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v.ClassName == "Model" then
        for i, v in pairs(v:GetChildren()) do
            if v.Name == "Meshes/rock" then
                if v.BrickColor == BrickColor.New("Institutional white") then
                    DrawESP(v)
                end
            end
        end
    end
end

game:GetService("Workspace").ChildAdded:connect(function(v)
   wait(0.5)
   if v.ClassName == "Model" then
        for i, v in pairs(v:GetChildren()) do
            if v.Name == "Meshes/rock" then
                if v.BrickColor == BrickColor.New("Institutional white") then
                    DrawESP(v)
                end
            end
        end
    end
end)