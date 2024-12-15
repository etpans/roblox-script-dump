mouse = game.Players.LocalPlayer:GetMouse()
animationdebounce = false
gotanim = false
animations = {
["Around Town"] = 3303391864;
["Top Rock"] = 3361276673;
Fashionable = 3333331310;
Robot = 3338025566;
Twirl = 3334968680;
Jacks = 3338066331;
T = 3338010159;
Shy = 3337978742;
Monkey = 3333499508;
["Borock's Rage"] = 3236842542;
["Ud'zal's Summoning"] = 3303161675;
["Hype Dance"] = 3695333486;
Godlike = 3337994105;
Swoosh = 3361481910;
Sneaky = 3334424322;
["Side to Side"] = 3333136415;
Greatest = 3338042785;
Louder = 3338083565;
}

function PlayAnim(id)
    animationdebounce = true
    local Anim = Instance.new("Animation")
    Anim.AnimationId = "rbxassetid://"..id
    local salute = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
    salute.Name = "FRICK"
    salute:Play(0)
    salute:AdjustSpeed(1)
    salute.Stopped:Connect(function()
        animationdebounce = false
    end)
end
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    gotanim = false
    lower = string.lower(msg)
    if lower == "/e t" then
        PlayAnim(animations["T"])
        gotanim = true
    end
    for i,v in pairs(animations) do
        if lower == string.sub(string.lower("/e "..tostring(i)), 1, #lower) and gotanim == false then
            gotanim = true
            PlayAnim(v)
        end
    end
    if gotanim == false and animationdebounce == false then
        if lower == "/e summon" or lower == "/e sum" then
            PlayAnim(animations["Ud'zal's Summoning"])
            gotanim = true
        end
        if lower == "/e rage" or lower == "/e rag" then
            PlayAnim(animations["Borock's Rage"])
            gotanim = true
        end
    end
end)

function animsbuttonfunction()
    print("------------------")
    for i,v in pairs(animations) do 
        print(tostring(i))
    end
    print("------------------")
end

animsbindable = Instance.new("BindableFunction")
animsbindable.OnInvoke = animsbuttonfunction

game.StarterGui:SetCore("SendNotification", {
    Title = "Done injecting!";
    Text = "Free Animations Script by Aidez!";
    Icon = "rbxassetid://847562022";
    Duration = 5;
})

game.StarterGui:SetCore("SendNotification", {
    Title = "How to use:";
    Text = "Say /e EMOTENAME to use that emote! (Shortened names work!)";
    Icon = "rbxassetid://2541869220";
    Duration = 8;
    Callback = animsbindable;
    Button1 = "Print emote names";
})