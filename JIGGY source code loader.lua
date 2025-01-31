local v0 = {};
local l_VFX_0 = require(game.ReplicatedStorage.Modules:WaitForChild("VFX"));
local l_UniversalTables_0 = require(game.ReplicatedStorage.Modules:WaitForChild("UniversalTables"));
local l_FunctionLibraryExtension_0 = require(game.ReplicatedStorage.Modules:WaitForChild("FunctionLibraryExtension"));
local l_ProjectileInflict_0 = game.ReplicatedStorage.Remotes.ProjectileInflict;
local l_VisualProjectile_0 = game.ReplicatedStorage.Remotes.VisualProjectile;
local l_FireProjectile_0 = game.ReplicatedStorage.Remotes.FireProjectile;
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_1 = l_ReplicatedStorage_0:WaitForChild("Players");
local _ = l_ReplicatedStorage_0:WaitForChild("Remotes");
local _ = game.ReplicatedStorage:WaitForChild("Modules");
local l_RangedWeapons_0 = l_ReplicatedStorage_0:WaitForChild("RangedWeapons");
local _ = l_ReplicatedStorage_0:WaitForChild("SFX");
local l_VFX_1 = game.ReplicatedStorage:WaitForChild("VFX");
local l_Debris_0 = game:GetService("Debris");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v18 = l_Players_1:WaitForChild(l_LocalPlayer_0.Name);
local l_Temp_0 = game.ReplicatedStorage.Temp;
local _ = l_UniversalTables_0.UniversalTable.GameSettings.RootScanHeight;
local v21 = l_UniversalTables_0.ReturnTable("GlobalIgnoreListProjectile");
local _ = {
    "LeftFoot", 
    "LeftHand", 
    "LeftLowerArm", 
    "LeftLowerLeg", 
    "LeftUpperArm", 
    "LeftUpperLeg", 
    "LowerTorso", 
    "RightFoot", 
    "RightHand", 
    "RightLowerArm", 
    "RightLowerLeg", 
    "RightUpperArm", 
    "RightUpperLeg", 
    "RightUpperLeg", 
    "UpperTorso", 
    "Head", 
    "FaceHitBox", 
    "HeadTopHitBox"
};
local function _(v23) --[[ Line: 62 ]] --[[ Name: isPlayer ]]
    return (l_Players_0:FindFirstChild(v23.Name));
end;
local function _(v25, v26) --[[ Line: 68 ]] --[[ Name: getRayClosestPoint ]]
    local v27 = v25.Origin - v26;
    local l_Direction_0 = v25.Direction;
    return v26 + (v27 - v27:Dot(l_Direction_0) / l_Direction_0:Dot(l_Direction_0) * l_Direction_0);
end;
local _ = function(v30, v31, v32) --[[ Line: 77 ]] --[[ Name: getAimHeight ]]
    local _ = v30.CFrame.p;
    local l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0 = l_FunctionLibraryExtension_0:GetEstimatedCameraPosition(l_LocalPlayer_0);
    local v35 = Ray.new(l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0, (v32 - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0).Unit * 7500);
    local v36 = v35.Origin - v31;
    local l_Direction_1 = v35.Direction;
    return (v31 + (v36 - v36:Dot(l_Direction_1) / l_Direction_1:Dot(l_Direction_1) * l_Direction_1)).Y;
end;
local function _(v39, v40, v41, v42) --[[ Line: 88 ]] --[[ Name: intersection_point ]]
    local v43 = (v40.Z - v39.Z) / (v40.X - v39.X);
    local v44 = (v42.Z - v41.Z) / (v42.X - v41.X);
    local v45 = v39.Z - v43 * v39.X;
    local v46 = (v41.Z - v44 * v41.X - v45) / (v43 - v44);
    local v47 = v43 * v46 + v45;
    return (Vector3.new(v46, v39.Y, v47));
end;
local function _(v49) --[[ Line: 98 ]] --[[ Name: Encrypt ]]
    local v50 = "";
    for v51 = 1, v49:len() do
        v50 = v50 .. string.char(v49:sub(v51, v51):byte() - 5);
    end;
    return v50;
end;
local function v61(v53, v54) --[[ Line: 109 ]] --[[ Name: devideNumberSequence ]]
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local l_Keypoints_0 = v53.Keypoints;
    for v60 = 1, #l_Keypoints_0 do
        if v60 == 1 then
            v55 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 2 then
            v56 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 3 then
            v57 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 4 then
            v58 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        end;
    end;
    return (NumberSequence.new({
        v55, 
        v56, 
        v57, 
        v58
    }));
end;
local function v73(v62, v63, v64, v65, v66, v67) --[[ Line: 139 ]] --[[ Name: RotCamera ]]
    if v66 then
        local v68 = math.min(1.5 / math.max(v67, 0), 90);
        local v69 = 0;
        local v70 = tick();
        while true do
            local v71 = v68 * (1 * (tick() - v70) * 60);
            local v72 = v69 + v71;
            v69 = v72 > 90 and 90 or v72;
            if v62.CoordinateFrame.lookVector.Y <= 0.98 then
                v62.CoordinateFrame = v62.CoordinateFrame * CFrame.Angles(v63 / (90 / v71), v64 / (90 / v71), v65 / (90 / v71));
                if v69 ~= 90 then
                    v70 = tick();
                    game:GetService("RunService").Stepped:wait();
                else
                    break;
                end;
            else
                break;
            end;
        end;
    else
        v62.CoordinateFrame = v62.CoordinateFrame * CFrame.Angles(v63, v64, v65);
    end;
end;
RecoilCamera = function(v74, v75, v76, _, _) --[[ Line: 162 ]] --[[ Name: RecoilCamera ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v80 = v75 * 0.004 / 3;
    local v81 = v76 * 0.004 / 3;
    local v82 = 0;
    local v83 = 0;
    if v74 then
        v82 = v74.y.Value * v80 * 2;
        v83 = v74.x.Value * v81 * 2;
    end;
    coroutine.wrap(function() --[[ Line: 181 ]]
        v73(l_CurrentCamera_0, v82, v83, 0, true, 0.06);
    end)();
end;
v0.CreateBullet = function(_, v85, v86, v87, _, v89, v90, v91, v92) --[[ Line: 191 ]] --[[ Name: CreateBullet ]]
    local l_Character_0 = l_LocalPlayer_0.Character;
    local l_HumanoidRootPart_0 = l_Character_0.HumanoidRootPart;
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    if l_Character_0:FindFirstChild(v85.Name) then
        local v96 = nil;
        local v97 = nil;
        if v87.Item.Attachments:FindFirstChild("Front") then
            v96 = v87.Item.Attachments.Front:GetChildren()[1].Barrel;
            v97 = v86.Attachments.Front:GetChildren()[1].Barrel;
        else
            v96 = v87.Item.Barrel;
            v97 = v86.Barrel;
        end;
        local l_ItemRoot_0 = v86.ItemRoot;
        local l_ItemProperties_0 = v85.ItemProperties;
        local l_l_RangedWeapons_0_FirstChild_0 = l_RangedWeapons_0:FindFirstChild(v85.Name);
        local l_SpecialProperties_0 = l_ItemProperties_0:FindFirstChild("SpecialProperties");
        local l_Attribute_0 = v18.Status.GameplayVariables:GetAttribute("EquipId");
        local l_FirstChild_0 = l_ReplicatedStorage_0.AmmoTypes:FindFirstChild(v89);
        local v104 = l_SpecialProperties_0 and l_SpecialProperties_0:GetAttribute("TracerColor") or l_l_RangedWeapons_0_FirstChild_0:GetAttribute("ProjectileColor");
        local _ = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("BulletMaterial");
        local l_l_FirstChild_0_Attribute_0 = l_FirstChild_0:GetAttribute("ProjectileDrop");
        local l_l_l_RangedWeapons_0_FirstChild_0_Attribute_1 = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("MuzzleEffect");
        local l_l_FirstChild_0_Attribute_1 = l_FirstChild_0:GetAttribute("Drag");
        local l_l_FirstChild_0_Attribute_2 = l_FirstChild_0:GetAttribute("MuzzleVelocity");
        local l_l_l_FirstChild_0_Attribute_2_0 = l_l_FirstChild_0_Attribute_2;
        local l_l_FirstChild_0_Attribute_3 = l_FirstChild_0:GetAttribute("Tracer");
        local _ = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("RecoilRecoveryTimeMod");
        local l_l_FirstChild_0_Attribute_4 = l_FirstChild_0:GetAttribute("AccuracyDeviation");
        local l_l_FirstChild_0_Attribute_5 = l_FirstChild_0:GetAttribute("Pellets");
        local l_l_FirstChild_0_Attribute_6 = l_FirstChild_0:GetAttribute("Damage");
        local l_l_FirstChild_0_Attribute_7 = l_FirstChild_0:GetAttribute("Arrow");
        local _ = l_FirstChild_0:GetAttribute("ProjectileWidth");
        local l_l_FirstChild_0_Attribute_9 = l_FirstChild_0:GetAttribute("ArmorPen");
        local l_l_l_FirstChild_0_Attribute_9_0 = l_l_FirstChild_0_Attribute_9;
        local v120 = nil;
        local v121 = nil;
        if v91 and l_l_RangedWeapons_0_FirstChild_0:FindFirstChild("RecoilPattern") then
            v120 = #l_l_RangedWeapons_0_FirstChild_0.RecoilPattern:GetChildren();
            v121 = if v91 == 1 then {
                x = {
                    Value = l_l_RangedWeapons_0_FirstChild_0.RecoilPattern["1"].x.Value
                }, 
                y = {
                    Value = l_l_RangedWeapons_0_FirstChild_0.RecoilPattern["1"].y.Value
                }
            } else l_l_RangedWeapons_0_FirstChild_0.RecoilPattern:FindFirstChild((tostring(v91)));
        else
            v121 = {
                x = {
                    Value = math.random(-5, 5) * 0.01
                }, 
                y = {
                    Value = math.random(5, 10) * 0.01
                }
            };
        end;
        local v122 = v18.Status.GameplayVariables:GetAttribute("Stance") == "Crouching";
        local v123 = l_ItemProperties_0.Tool:GetAttribute("MuzzleDevice") or "Default";
        local v124 = l_FirstChild_0:GetAttribute("RecoilStrength") * (l_HumanoidRootPart_0:GetAttribute("Recoil") or 1);
        local v125 = v122 and v124 * 0.9 or v124;
        local v126 = v122 and v124 * 0.9 or v124;
        local l_Attachments_0 = v85:FindFirstChild("Attachments");
        if l_Attachments_0 then
            local l_l_Attachments_0_Children_0 = l_Attachments_0:GetChildren();
            for v129 = 1, #l_l_Attachments_0_Children_0 do
                local l_StringValue_0 = l_l_Attachments_0_Children_0[v129]:FindFirstChildOfClass("StringValue");
                if l_StringValue_0 and l_StringValue_0.ItemProperties:FindFirstChild("Attachment") and (not l_StringValue_0.ItemProperties:GetAttribute("Durability") or l_StringValue_0.ItemProperties:GetAttribute("Durability") > 0) then
                    local l_Attachment_0 = l_StringValue_0.ItemProperties.Attachment;
                    local l_l_Attachment_0_Attribute_0 = l_Attachment_0:GetAttribute("Recoil");
                    if l_l_Attachment_0_Attribute_0 then
                        v125 = v125 + l_l_Attachment_0_Attribute_0 * l_Attachment_0:GetAttribute("HRecoilMod");
                        v126 = v126 + l_l_Attachment_0_Attribute_0 * l_Attachment_0:GetAttribute("VRecoilMod");
                    end;
                    local l_l_Attachment_0_Attribute_1 = l_Attachment_0:GetAttribute("MuzzleDevice");
                    if l_l_Attachment_0_Attribute_1 then
                        v123 = l_l_Attachment_0_Attribute_1;
                        if v87.Item.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension") then
                            v96 = v87.Item.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension");
                            v97 = v86.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension");
                        end;
                    end;
                end;
            end;
        end;
        if v123 == "Suppressor" then
            if tick() - v90 < 0.8 then
                l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSoundSupressed, l_ItemRoot_0.FireSoundSupressed.TimeLength, l_Temp_0);
            else
                l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSoundSupressed, l_ItemRoot_0.FireSoundSupressed.TimeLength, l_Temp_0);
            end;
        elseif tick() - v90 < 0.8 then
            l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSound, l_ItemRoot_0.FireSound.TimeLength, l_Temp_0);
        else
            l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSound, l_ItemRoot_0.FireSound.TimeLength, l_Temp_0);
        end;
        if l_l_l_RangedWeapons_0_FirstChild_0_Attribute_1 == true then
            local v134 = l_SpecialProperties_0 and l_SpecialProperties_0:GetAttribute("MuzzleEffect");
            local l_Children_0 = ((v134 and l_VFX_1.MuzzleEffects.Override:FindFirstChild(v134) or l_VFX_1.MuzzleEffects):FindFirstChild(v123) or l_VFX_1.MuzzleEffects:FindFirstChild(v123)):GetChildren();
            local v136 = l_Children_0[math.random(1, #l_Children_0)];
            local l_Children_1 = v136.Particles:GetChildren();
            if v136:FindFirstChild("MuzzleLight") then
                local v138 = v136.MuzzleLight:Clone();
                v138.Range = math.clamp(v138.Range + math.random(-2, 2) / 2, 0, 50);
                v138.Enabled = true;
                l_Debris_0:AddItem(v138, 0.1);
                v138.Parent = v96;
            end;
            for v139 = 1, #l_Children_1 do
                if l_Children_1[v139].className == "ParticleEmitter" then
                    local v140 = l_Children_1[v139]:Clone();
                    local v141 = v140:GetAttribute("EmitCount") or 1;
                    local v142 = math.clamp(l_l_FirstChild_0_Attribute_6 / 45 / 2.4, 0, 0.6);
                    if l_l_FirstChild_0_Attribute_5 then
                        v142 = math.clamp(l_l_FirstChild_0_Attribute_6 * l_l_FirstChild_0_Attribute_5 / 45 / 2.4, 0, 0.6);
                    end;
                    local v143 = math.clamp(v142, 1, 10);
                    v140.Lifetime = NumberRange.new(v140.Lifetime.Min * v143, v140.Lifetime.Max * v143);
                    v140.Size = v61(v140.Size, v142);
                    v140.Parent = v96;
                    v140:Emit(v141);
                    l_Debris_0:AddItem(v140, v140.Lifetime.Max);
                end;
            end;
        end;
        local _ = l_HumanoidRootPart_0.CFrame.p;
        local l_LookVector_0 = v92.CFrame.LookVector;
        local v146 = math.clamp(l_l_FirstChild_0_Attribute_2 / 2400, 0.7, 1.2);
        local v147 = 0;
        local v148 = "";
        local v149 = 0;
        local v150 = false;
        local function v211() --[[ Line: 369 ]] --[[ Name: fireBullet ]]
            local v151 = RaycastParams.new();
            v151.FilterType = Enum.RaycastFilterType.Exclude;
            local v152 = {
                l_Character_0, 
                v87, 
                v21
            };
            local v153 = {};
            v151.FilterDescendantsInstances = v152;
            v151.IgnoreWater = false;
            v151.CollisionGroup = "WeaponRay";
            local v154 = tick();
            local l_l_LookVector_0_0 = l_LookVector_0;
            local l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = l_FunctionLibraryExtension_0:GetEstimatedCameraPosition(l_LocalPlayer_0);
            local v157 = false;
            local v158 = Vector3.new();
            local v159 = 0;
            local v160 = l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_LookVector_0 * 1000;
            if l_l_FirstChild_0_Attribute_4 then
                local v161 = 6.283185307179586 * math.random();
                local v162 = math.random(-l_l_FirstChild_0_Attribute_4, l_l_FirstChild_0_Attribute_4);
                local v163 = v162 * math.cos(v161);
                local v164 = v162 * math.sin(v161);
                l_l_LookVector_0_0 = (v160 + Vector3.new(v163, math.random(-l_l_FirstChild_0_Attribute_4, l_l_FirstChild_0_Attribute_4), v164) - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1).Unit;
            end;
            v147 = v147 + 1;
            if v147 == 1 then
                v149 = math.random(-100000, 100000);
                v148 = tostring(game.Players.LocalPlayer.UserId);
                coroutine.wrap(function() --[[ Line: 445 ]]
                    if not l_FireProjectile_0:InvokeServer(l_l_LookVector_0_0, v149, tick()) then
                        script.Parent.Binds.AdjustBullets:Fire(l_Attribute_0, 1);
                    end;
                end)();
            elseif v147 > 1 then
                l_VisualProjectile_0:FireServer(l_l_LookVector_0_0, v149);
            end;
            if not l_l_FirstChild_0_Attribute_5 or not v150 and v147 > math.floor(l_l_FirstChild_0_Attribute_5 * 0.2) then
                v150 = true;
            end;
            local v165 = nil;
            local v166 = nil;
            if l_l_FirstChild_0_Attribute_3 then
                v165 = l_VFX_1.MuzzleEffects.Tracer:Clone();
                v165.Name = v148;
                v165.Color = v104;
                l_Debris_0:AddItem(v165, 10);
                v165.Position = Vector3.new(0, -100, 0, 0);
                v165.Parent = game.Workspace.NoCollision.Effects;
                local _ = l_HumanoidRootPart_0.AssemblyLinearVelocity;
                v166 = v96.Position;
            end;
            local v168 = {};
            local _ = {};
            local v170 = nil;
            local _ = 60;
            local _ = 0.008333333333333333;
            local v173 = 0;
            local v174 = 0;
            local _ = function(_) --[[ Line: 499 ]] --[[ Name: Stop ]]
                v170:Disconnect();
                if v165 then
                    if v165:FindFirstChild("Trail") then
                        wait(v165.Trail.Lifetime);
                    end;
                    v165:Destroy();
                end;
            end;
            local function v210(v177) --[[ Line: 521 ]] --[[ Name: onStep ]]
                v173 = v173 + v177;
                if v173 > 0.008333333333333333 then
                    v174 = v174 + v173;
                    local v178 = l_l_FirstChild_0_Attribute_2 * v173;
                    local v179 = workspace:Raycast(l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1, l_l_LookVector_0_0 * v178, v151);
                    local v180 = nil;
                    local v181 = nil;
                    local v182 = nil;
                    local v183 = nil;
                    if v179 then
                        v180 = v179.Instance;
                        v181 = v179.Position;
                        v182 = v179.Normal;
                        v183 = v179.Material;
                    else
                        v181 = l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_l_LookVector_0_0 * v178;
                    end;
                    local l_Magnitude_0 = (l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 - v181).Magnitude;
                    v159 = v159 + l_Magnitude_0;
                    if v165 then
                        local l_Magnitude_1 = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                        local v186 = math.clamp(l_CurrentCamera_1.FieldOfView / 70, 0.38, 1.1);
                        if v159 < 200 then
                            local _ = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                            local v188 = math.clamp(l_Magnitude_1 / 200, 0.1, 2.1) * v146 * v186;
                            local _ = (v166 - v181).Magnitude;
                            local l_Unit_0 = (v181 - v166).Unit;
                            v165.Size = Vector3.new(v188, v188, v188);
                            local v191 = v166 + l_LookVector_0 * v159;
                            v165.CFrame = CFrame.new(v191, l_Unit_0);
                        else
                            local _ = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                            local v193 = math.clamp(l_Magnitude_1 / 200, 0.1, 2.1) * v146 * v186;
                            v165.Size = Vector3.new(v193, v193, v193);
                            v165.CFrame = CFrame.new(v181, l_l_LookVector_0_0);
                        end;
                    end;
                    local v194 = "nil";
                    if v180 then
                        local v195 = math.floor(v181.X);
                        local v196 = math.floor(v181.Y);
                        local v197 = math.floor(v181.Z);
                        local v198 = math.floor(v182.X);
                        local v199 = math.floor(v182.Y);
                        local v200 = math.floor(v182.Z);
                        v194 = tostring(v195) .. tostring(v196) .. tostring(v197) .. tostring(v198) .. tostring(v199) .. tostring(v200);
                        if v153[v194] then
                            v181 = v181 - v182 * 0.1;
                        end;
                    end;
                    if v180 and not v153[v194] then
                        table.insert(v168, v173);
                        local l_l_FunctionLibraryExtension_0_DeepAncestor_0 = l_FunctionLibraryExtension_0:FindDeepAncestor(v180, "Model");
                        local _ = l_l_FunctionLibraryExtension_0_DeepAncestor_0;
                        if v180:FindFirstChild("RealParent") then
                            l_l_FunctionLibraryExtension_0_DeepAncestor_0 = v180.RealParent.Value;
                        end;
                        if v180:GetAttribute("PassThrough", 2) then
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180:GetAttribute("PassThrough", 1) and l_l_FirstChild_0_Attribute_7 == nil then
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180:GetAttribute("Glass") then
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180.Name == "Terrain" then
                            if v157 == false and v183 == Enum.Material.Water then
                                v157 = true;
                                l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 * 0.15;
                                v158 = v181;
                                v151.IgnoreWater = true;
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                                return;
                            else
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                                v170:Disconnect();
                                if v165 then
                                    if v165:FindFirstChild("Trail") then
                                        wait(v165.Trail.Lifetime);
                                    end;
                                    v165:Destroy();
                                    return;
                                end;
                            end;
                        elseif l_l_FunctionLibraryExtension_0_DeepAncestor_0:FindFirstChild("Humanoid") then
                            local v203 = v180.CFrame:ToObjectSpace(CFrame.new(v181));
                            if l_l_FirstChild_0_Attribute_2 / l_l_l_FirstChild_0_Attribute_2_0 > 0.1 and l_l_FirstChild_0_Attribute_2 < 3300 then
                                l_ProjectileInflict_0:FireServer(v180, v203, v149, tick());
                            end;
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            v170:Disconnect();
                            if v165 then
                                if v165:FindFirstChild("Trail") then
                                    wait(v165.Trail.Lifetime);
                                end;
                                v165:Destroy();
                                return;
                            end;
                        elseif l_l_FunctionLibraryExtension_0_DeepAncestor_0.ClassName == "Model" and l_l_FunctionLibraryExtension_0_DeepAncestor_0.PrimaryPart ~= nil and l_l_FunctionLibraryExtension_0_DeepAncestor_0.PrimaryPart:GetAttribute("Health") then
                            local v204 = v180.CFrame:ToObjectSpace(CFrame.new(v181));
                            l_ProjectileInflict_0:FireServer(v180, v204, v149, tick());
                            if l_l_FunctionLibraryExtension_0_DeepAncestor_0.Parent.Name ~= "SleepingPlayers" and v182 then
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            end;
                            v170:Disconnect();
                            if v165 then
                                if v165:FindFirstChild("Trail") then
                                    wait(v165.Trail.Lifetime);
                                end;
                                v165:Destroy();
                                return;
                            end;
                        else
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            local v205, v206, v207 = l_FunctionLibraryExtension_0:Penetration(v180, v181, l_l_LookVector_0_0, l_l_FirstChild_0_Attribute_9);
                            l_l_FirstChild_0_Attribute_9 = v205;
                            if l_l_FirstChild_0_Attribute_9 > 0 then
                                l_VFX_0.Impact(unpack(v207));
                                local v208 = l_l_FirstChild_0_Attribute_9 / l_l_l_FirstChild_0_Attribute_9_0;
                                l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 * math.clamp(v208, 0.5, 1);
                                l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = v206;
                                v153[v194] = true;
                                v151.FilterDescendantsInstances = v152;
                                return;
                            else
                                v170:Disconnect();
                                if v165 then
                                    if v165:FindFirstChild("Trail") then
                                        wait(v165.Trail.Lifetime);
                                    end;
                                    v165:Destroy();
                                    return;
                                end;
                            end;
                        end;
                    elseif v159 > 2500 or tick() - v154 > 60 then
                        v170:Disconnect();
                        if v165 then
                            if v165:FindFirstChild("Trail") then
                                wait(v165.Trail.Lifetime);
                            end;
                            v165:Destroy();
                            return;
                        end;
                    else
                        l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = v181;
                        l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 - l_l_FirstChild_0_Attribute_1 * l_l_FirstChild_0_Attribute_2 ^ 2 * v173 ^ 2;
                        local v209 = Vector3.new(0, l_l_FirstChild_0_Attribute_0 * v174 ^ 2, 0);
                        l_l_LookVector_0_0 = (l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_l_LookVector_0_0 * 10000 - v209 - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1).Unit;
                        table.insert(v168, v173);
                        v173 = 0;
                    end;
                end;
            end;
            v170 = l_RunService_0.RenderStepped:Connect(v210);
        end;
        if l_l_FirstChild_0_Attribute_5 ~= nil then
            for _ = 1, l_l_FirstChild_0_Attribute_5 do
                coroutine.wrap(v211)();
            end;
        else
            coroutine.wrap(v211)();
        end;
        return v125 / 200, v126 / 200, v123, v121;
    else
        return;
    end;
end;
return v0;
  local v0 = {};
local l_VFX_0 = require(game.ReplicatedStorage.Modules:WaitForChild("VFX"));
local l_UniversalTables_0 = require(game.ReplicatedStorage.Modules:WaitForChild("UniversalTables"));
local l_FunctionLibraryExtension_0 = require(game.ReplicatedStorage.Modules:WaitForChild("FunctionLibraryExtension"));
local l_ProjectileInflict_0 = game.ReplicatedStorage.Remotes.ProjectileInflict;
local l_VisualProjectile_0 = game.ReplicatedStorage.Remotes.VisualProjectile;
local l_FireProjectile_0 = game.ReplicatedStorage.Remotes.FireProjectile;
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_1 = l_ReplicatedStorage_0:WaitForChild("Players");
local _ = l_ReplicatedStorage_0:WaitForChild("Remotes");
local _ = game.ReplicatedStorage:WaitForChild("Modules");
local l_RangedWeapons_0 = l_ReplicatedStorage_0:WaitForChild("RangedWeapons");
local _ = l_ReplicatedStorage_0:WaitForChild("SFX");
local l_VFX_1 = game.ReplicatedStorage:WaitForChild("VFX");
local l_Debris_0 = game:GetService("Debris");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v18 = l_Players_1:WaitForChild(l_LocalPlayer_0.Name);
local l_Temp_0 = game.ReplicatedStorage.Temp;
local _ = l_UniversalTables_0.UniversalTable.GameSettings.RootScanHeight;
local v21 = l_UniversalTables_0.ReturnTable("GlobalIgnoreListProjectile");
local _ = {
    "LeftFoot", 
    "LeftHand", 
    "LeftLowerArm", 
    "LeftLowerLeg", 
    "LeftUpperArm", 
    "LeftUpperLeg", 
    "LowerTorso", 
    "RightFoot", 
    "RightHand", 
    "RightLowerArm", 
    "RightLowerLeg", 
    "RightUpperArm", 
    "RightUpperLeg", 
    "RightUpperLeg", 
    "UpperTorso", 
    "Head", 
    "FaceHitBox", 
    "HeadTopHitBox"
};
local function _(v23) --[[ Line: 62 ]] --[[ Name: isPlayer ]]
    return (l_Players_0:FindFirstChild(v23.Name));
end;
local function _(v25, v26) --[[ Line: 68 ]] --[[ Name: getRayClosestPoint ]]
    local v27 = v25.Origin - v26;
    local l_Direction_0 = v25.Direction;
    return v26 + (v27 - v27:Dot(l_Direction_0) / l_Direction_0:Dot(l_Direction_0) * l_Direction_0);
end;
local _ = function(v30, v31, v32) --[[ Line: 77 ]] --[[ Name: getAimHeight ]]
    local _ = v30.CFrame.p;
    local l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0 = l_FunctionLibraryExtension_0:GetEstimatedCameraPosition(l_LocalPlayer_0);
    local v35 = Ray.new(l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0, (v32 - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0).Unit * 7500);
    local v36 = v35.Origin - v31;
    local l_Direction_1 = v35.Direction;
    return (v31 + (v36 - v36:Dot(l_Direction_1) / l_Direction_1:Dot(l_Direction_1) * l_Direction_1)).Y;
end;
local function _(v39, v40, v41, v42) --[[ Line: 88 ]] --[[ Name: intersection_point ]]
    local v43 = (v40.Z - v39.Z) / (v40.X - v39.X);
    local v44 = (v42.Z - v41.Z) / (v42.X - v41.X);
    local v45 = v39.Z - v43 * v39.X;
    local v46 = (v41.Z - v44 * v41.X - v45) / (v43 - v44);
    local v47 = v43 * v46 + v45;
    return (Vector3.new(v46, v39.Y, v47));
end;
local function _(v49) --[[ Line: 98 ]] --[[ Name: Encrypt ]]
    local v50 = "";
    for v51 = 1, v49:len() do
        v50 = v50 .. string.char(v49:sub(v51, v51):byte() - 5);
    end;
    return v50;
end;
local function v61(v53, v54) --[[ Line: 109 ]] --[[ Name: devideNumberSequence ]]
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local l_Keypoints_0 = v53.Keypoints;
    for v60 = 1, #l_Keypoints_0 do
        if v60 == 1 then
            v55 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 2 then
            v56 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 3 then
            v57 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 4 then
            v58 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        end;
    end;
    return (NumberSequence.new({
        v55, 
        v56, 
        v57, 
        v58
    }));
end;
local function v73(v62, v63, v64, v65, v66, v67) --[[ Line: 139 ]] --[[ Name: RotCamera ]]
    if v66 then
        local v68 = math.min(1.5 / math.max(v67, 0), 90);
        local v69 = 0;
        local v70 = tick();
        while true do
            local v71 = v68 * (1 * (tick() - v70) * 60);
            local v72 = v69 + v71;
            v69 = v72 > 90 and 90 or v72;
            if v62.CoordinateFrame.lookVector.Y <= 0.98 then
                v62.CoordinateFrame = v62.CoordinateFrame * CFrame.Angles(v63 / (90 / v71), v64 / (90 / v71), v65 / (90 / v71));
                if v69 ~= 90 then
                    v70 = tick();
                    game:GetService("RunService").Stepped:wait();
                else
                    break;
                end;
            else
                break;
            end;
        end;
    else
        v62.CoordinateFrame = v62.CoordinateFrame * CFrame.Angles(v63, v64, v65);
    end;
end;
RecoilCamera = function(v74, v75, v76, _, _) --[[ Line: 162 ]] --[[ Name: RecoilCamera ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v80 = v75 * 0.004 / 3;
    local v81 = v76 * 0.004 / 3;
    local v82 = 0;
    local v83 = 0;
    if v74 then
        v82 = v74.y.Value * v80 * 2;
        v83 = v74.x.Value * v81 * 2;
    end;
    coroutine.wrap(function() --[[ Line: 181 ]]
        v73(l_CurrentCamera_0, v82, v83, 0, true, 0.06);
    end)();
end;
v0.CreateBullet = function(_, v85, v86, v87, _, v89, v90, v91, v92) --[[ Line: 191 ]] --[[ Name: CreateBullet ]]
    local l_Character_0 = l_LocalPlayer_0.Character;
    local l_HumanoidRootPart_0 = l_Character_0.HumanoidRootPart;
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    if l_Character_0:FindFirstChild(v85.Name) then
        local v96 = nil;
        local v97 = nil;
        if v87.Item.Attachments:FindFirstChild("Front") then
            v96 = v87.Item.Attachments.Front:GetChildren()[1].Barrel;
            v97 = v86.Attachments.Front:GetChildren()[1].Barrel;
        else
            v96 = v87.Item.Barrel;
            v97 = v86.Barrel;
        end;
        local l_ItemRoot_0 = v86.ItemRoot;
        local l_ItemProperties_0 = v85.ItemProperties;
        local l_l_RangedWeapons_0_FirstChild_0 = l_RangedWeapons_0:FindFirstChild(v85.Name);
        local l_SpecialProperties_0 = l_ItemProperties_0:FindFirstChild("SpecialProperties");
        local l_Attribute_0 = v18.Status.GameplayVariables:GetAttribute("EquipId");
        local l_FirstChild_0 = l_ReplicatedStorage_0.AmmoTypes:FindFirstChild(v89);
        local v104 = l_SpecialProperties_0 and l_SpecialProperties_0:GetAttribute("TracerColor") or l_l_RangedWeapons_0_FirstChild_0:GetAttribute("ProjectileColor");
        local _ = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("BulletMaterial");
        local l_l_FirstChild_0_Attribute_0 = l_FirstChild_0:GetAttribute("ProjectileDrop");
        local l_l_l_RangedWeapons_0_FirstChild_0_Attribute_1 = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("MuzzleEffect");
        local l_l_FirstChild_0_Attribute_1 = l_FirstChild_0:GetAttribute("Drag");
        local l_l_FirstChild_0_Attribute_2 = l_FirstChild_0:GetAttribute("MuzzleVelocity");
        local l_l_l_FirstChild_0_Attribute_2_0 = l_l_FirstChild_0_Attribute_2;
        local l_l_FirstChild_0_Attribute_3 = l_FirstChild_0:GetAttribute("Tracer");
        local _ = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("RecoilRecoveryTimeMod");
        local l_l_FirstChild_0_Attribute_4 = l_FirstChild_0:GetAttribute("AccuracyDeviation");
        local l_l_FirstChild_0_Attribute_5 = l_FirstChild_0:GetAttribute("Pellets");
        local l_l_FirstChild_0_Attribute_6 = l_FirstChild_0:GetAttribute("Damage");
        local l_l_FirstChild_0_Attribute_7 = l_FirstChild_0:GetAttribute("Arrow");
        local _ = l_FirstChild_0:GetAttribute("ProjectileWidth");
        local l_l_FirstChild_0_Attribute_9 = l_FirstChild_0:GetAttribute("ArmorPen");
        local l_l_l_FirstChild_0_Attribute_9_0 = l_l_FirstChild_0_Attribute_9;
        local v120 = nil;
        local v121 = nil;
        if v91 and l_l_RangedWeapons_0_FirstChild_0:FindFirstChild("RecoilPattern") then
            v120 = #l_l_RangedWeapons_0_FirstChild_0.RecoilPattern:GetChildren();
            v121 = if v91 == 1 then {
                x = {
                    Value = l_l_RangedWeapons_0_FirstChild_0.RecoilPattern["1"].x.Value
                }, 
                y = {
                    Value = l_l_RangedWeapons_0_FirstChild_0.RecoilPattern["1"].y.Value
                }
            } else l_l_RangedWeapons_0_FirstChild_0.RecoilPattern:FindFirstChild((tostring(v91)));
        else
            v121 = {
                x = {
                    Value = math.random(-5, 5) * 0.01
                }, 
                y = {
                    Value = math.random(5, 10) * 0.01
                }
            };
        end;
        local v122 = v18.Status.GameplayVariables:GetAttribute("Stance") == "Crouching";
        local v123 = l_ItemProperties_0.Tool:GetAttribute("MuzzleDevice") or "Default";
        local v124 = l_FirstChild_0:GetAttribute("RecoilStrength") * (l_HumanoidRootPart_0:GetAttribute("Recoil") or 1);
        local v125 = v122 and v124 * 0.9 or v124;
        local v126 = v122 and v124 * 0.9 or v124;
        local l_Attachments_0 = v85:FindFirstChild("Attachments");
        if l_Attachments_0 then
            local l_l_Attachments_0_Children_0 = l_Attachments_0:GetChildren();
            for v129 = 1, #l_l_Attachments_0_Children_0 do
                local l_StringValue_0 = l_l_Attachments_0_Children_0[v129]:FindFirstChildOfClass("StringValue");
                if l_StringValue_0 and l_StringValue_0.ItemProperties:FindFirstChild("Attachment") and (not l_StringValue_0.ItemProperties:GetAttribute("Durability") or l_StringValue_0.ItemProperties:GetAttribute("Durability") > 0) then
                    local l_Attachment_0 = l_StringValue_0.ItemProperties.Attachment;
                    local l_l_Attachment_0_Attribute_0 = l_Attachment_0:GetAttribute("Recoil");
                    if l_l_Attachment_0_Attribute_0 then
                        v125 = v125 + l_l_Attachment_0_Attribute_0 * l_Attachment_0:GetAttribute("HRecoilMod");
                        v126 = v126 + l_l_Attachment_0_Attribute_0 * l_Attachment_0:GetAttribute("VRecoilMod");
                    end;
                    local l_l_Attachment_0_Attribute_1 = l_Attachment_0:GetAttribute("MuzzleDevice");
                    if l_l_Attachment_0_Attribute_1 then
                        v123 = l_l_Attachment_0_Attribute_1;
                        if v87.Item.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension") then
                            v96 = v87.Item.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension");
                            v97 = v86.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension");
                        end;
                    end;
                end;
            end;
        end;
        if v123 == "Suppressor" then
            if tick() - v90 < 0.8 then
                l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSoundSupressed, l_ItemRoot_0.FireSoundSupressed.TimeLength, l_Temp_0);
            else
                l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSoundSupressed, l_ItemRoot_0.FireSoundSupressed.TimeLength, l_Temp_0);
            end;
        elseif tick() - v90 < 0.8 then
            l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSound, l_ItemRoot_0.FireSound.TimeLength, l_Temp_0);
        else
            l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSound, l_ItemRoot_0.FireSound.TimeLength, l_Temp_0);
        end;
        if l_l_l_RangedWeapons_0_FirstChild_0_Attribute_1 == true then
            local v134 = l_SpecialProperties_0 and l_SpecialProperties_0:GetAttribute("MuzzleEffect");
            local l_Children_0 = ((v134 and l_VFX_1.MuzzleEffects.Override:FindFirstChild(v134) or l_VFX_1.MuzzleEffects):FindFirstChild(v123) or l_VFX_1.MuzzleEffects:FindFirstChild(v123)):GetChildren();
            local v136 = l_Children_0[math.random(1, #l_Children_0)];
            local l_Children_1 = v136.Particles:GetChildren();
            if v136:FindFirstChild("MuzzleLight") then
                local v138 = v136.MuzzleLight:Clone();
                v138.Range = math.clamp(v138.Range + math.random(-2, 2) / 2, 0, 50);
                v138.Enabled = true;
                l_Debris_0:AddItem(v138, 0.1);
                v138.Parent = v96;
            end;
            for v139 = 1, #l_Children_1 do
                if l_Children_1[v139].className == "ParticleEmitter" then
                    local v140 = l_Children_1[v139]:Clone();
                    local v141 = v140:GetAttribute("EmitCount") or 1;
                    local v142 = math.clamp(l_l_FirstChild_0_Attribute_6 / 45 / 2.4, 0, 0.6);
                    if l_l_FirstChild_0_Attribute_5 then
                        v142 = math.clamp(l_l_FirstChild_0_Attribute_6 * l_l_FirstChild_0_Attribute_5 / 45 / 2.4, 0, 0.6);
                    end;
                    local v143 = math.clamp(v142, 1, 10);
                    v140.Lifetime = NumberRange.new(v140.Lifetime.Min * v143, v140.Lifetime.Max * v143);
                    v140.Size = v61(v140.Size, v142);
                    v140.Parent = v96;
                    v140:Emit(v141);
                    l_Debris_0:AddItem(v140, v140.Lifetime.Max);
                end;
            end;
        end;
        local _ = l_HumanoidRootPart_0.CFrame.p;
        local l_LookVector_0 = v92.CFrame.LookVector;
        local v146 = math.clamp(l_l_FirstChild_0_Attribute_2 / 2400, 0.7, 1.2);
        local v147 = 0;
        local v148 = "";
        local v149 = 0;
        local v150 = false;
        local function v211() --[[ Line: 369 ]] --[[ Name: fireBullet ]]
            local v151 = RaycastParams.new();
            v151.FilterType = Enum.RaycastFilterType.Exclude;
            local v152 = {
                l_Character_0, 
                v87, 
                v21
            };
            local v153 = {};
            v151.FilterDescendantsInstances = v152;
            v151.IgnoreWater = false;
            v151.CollisionGroup = "WeaponRay";
            local v154 = tick();
            local l_l_LookVector_0_0 = l_LookVector_0;
            local l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = l_FunctionLibraryExtension_0:GetEstimatedCameraPosition(l_LocalPlayer_0);
            local v157 = false;
            local v158 = Vector3.new();
            local v159 = 0;
            local v160 = l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_LookVector_0 * 1000;
            if l_l_FirstChild_0_Attribute_4 then
                local v161 = 6.283185307179586 * math.random();
                local v162 = math.random(-l_l_FirstChild_0_Attribute_4, l_l_FirstChild_0_Attribute_4);
                local v163 = v162 * math.cos(v161);
                local v164 = v162 * math.sin(v161);
                l_l_LookVector_0_0 = (v160 + Vector3.new(v163, math.random(-l_l_FirstChild_0_Attribute_4, l_l_FirstChild_0_Attribute_4), v164) - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1).Unit;
            end;
            v147 = v147 + 1;
            if v147 == 1 then
                v149 = math.random(-100000, 100000);
                v148 = tostring(game.Players.LocalPlayer.UserId);
                coroutine.wrap(function() --[[ Line: 445 ]]
                    if not l_FireProjectile_0:InvokeServer(l_l_LookVector_0_0, v149, tick()) then
                        script.Parent.Binds.AdjustBullets:Fire(l_Attribute_0, 1);
                    end;
                end)();
            elseif v147 > 1 then
                l_VisualProjectile_0:FireServer(l_l_LookVector_0_0, v149);
            end;
            if not l_l_FirstChild_0_Attribute_5 or not v150 and v147 > math.floor(l_l_FirstChild_0_Attribute_5 * 0.2) then
                v150 = true;
            end;
            local v165 = nil;
            local v166 = nil;
            if l_l_FirstChild_0_Attribute_3 then
                v165 = l_VFX_1.MuzzleEffects.Tracer:Clone();
                v165.Name = v148;
                v165.Color = v104;
                l_Debris_0:AddItem(v165, 10);
                v165.Position = Vector3.new(0, -100, 0, 0);
                v165.Parent = game.Workspace.NoCollision.Effects;
                local _ = l_HumanoidRootPart_0.AssemblyLinearVelocity;
                v166 = v96.Position;
            end;
            local v168 = {};
            local _ = {};
            local v170 = nil;
            local _ = 60;
            local _ = 0.008333333333333333;
            local v173 = 0;
            local v174 = 0;
            local _ = function(_) --[[ Line: 499 ]] --[[ Name: Stop ]]
                v170:Disconnect();
                if v165 then
                    if v165:FindFirstChild("Trail") then
                        wait(v165.Trail.Lifetime);
                    end;
                    v165:Destroy();
                end;
            end;
            local function v210(v177) --[[ Line: 521 ]] --[[ Name: onStep ]]
                v173 = v173 + v177;
                if v173 > 0.008333333333333333 then
                    v174 = v174 + v173;
                    local v178 = l_l_FirstChild_0_Attribute_2 * v173;
                    local v179 = workspace:Raycast(l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1, l_l_LookVector_0_0 * v178, v151);
                    local v180 = nil;
                    local v181 = nil;
                    local v182 = nil;
                    local v183 = nil;
                    if v179 then
                        v180 = v179.Instance;
                        v181 = v179.Position;
                        v182 = v179.Normal;
                        v183 = v179.Material;
                    else
                        v181 = l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_l_LookVector_0_0 * v178;
                    end;
                    local l_Magnitude_0 = (l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 - v181).Magnitude;
                    v159 = v159 + l_Magnitude_0;
                    if v165 then
                        local l_Magnitude_1 = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                        local v186 = math.clamp(l_CurrentCamera_1.FieldOfView / 70, 0.38, 1.1);
                        if v159 < 200 then
                            local _ = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                            local v188 = math.clamp(l_Magnitude_1 / 200, 0.1, 2.1) * v146 * v186;
                            local _ = (v166 - v181).Magnitude;
                            local l_Unit_0 = (v181 - v166).Unit;
                            v165.Size = Vector3.new(v188, v188, v188);
                            local v191 = v166 + l_LookVector_0 * v159;
                            v165.CFrame = CFrame.new(v191, l_Unit_0);
                        else
                            local _ = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                            local v193 = math.clamp(l_Magnitude_1 / 200, 0.1, 2.1) * v146 * v186;
                            v165.Size = Vector3.new(v193, v193, v193);
                            v165.CFrame = CFrame.new(v181, l_l_LookVector_0_0);
                        end;
                    end;
                    local v194 = "nil";
                    if v180 then
                        local v195 = math.floor(v181.X);
                        local v196 = math.floor(v181.Y);
                        local v197 = math.floor(v181.Z);
                        local v198 = math.floor(v182.X);
                        local v199 = math.floor(v182.Y);
                        local v200 = math.floor(v182.Z);
                        v194 = tostring(v195) .. tostring(v196) .. tostring(v197) .. tostring(v198) .. tostring(v199) .. tostring(v200);
                        if v153[v194] then
                            v181 = v181 - v182 * 0.1;
                        end;
                    end;
                    if v180 and not v153[v194] then
                        table.insert(v168, v173);
                        local l_l_FunctionLibraryExtension_0_DeepAncestor_0 = l_FunctionLibraryExtension_0:FindDeepAncestor(v180, "Model");
                        local _ = l_l_FunctionLibraryExtension_0_DeepAncestor_0;
                        if v180:FindFirstChild("RealParent") then
                            l_l_FunctionLibraryExtension_0_DeepAncestor_0 = v180.RealParent.Value;
                        end;
                        if v180:GetAttribute("PassThrough", 2) then
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180:GetAttribute("PassThrough", 1) and l_l_FirstChild_0_Attribute_7 == nil then
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180:GetAttribute("Glass") then
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180.Name == "Terrain" then
                            if v157 == false and v183 == Enum.Material.Water then
                                v157 = true;
                                l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 * 0.15;
                                v158 = v181;
                                v151.IgnoreWater = true;
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                                return;
                            else
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                                v170:Disconnect();
                                if v165 then
                                    if v165:FindFirstChild("Trail") then
                                        wait(v165.Trail.Lifetime);
                                    end;
                                    v165:Destroy();
                                    return;
                                end;
                            end;
                        elseif l_l_FunctionLibraryExtension_0_DeepAncestor_0:FindFirstChild("Humanoid") then
                            local v203 = v180.CFrame:ToObjectSpace(CFrame.new(v181));
                            if l_l_FirstChild_0_Attribute_2 / l_l_l_FirstChild_0_Attribute_2_0 > 0.1 and l_l_FirstChild_0_Attribute_2 < 3300 then
                                l_ProjectileInflict_0:FireServer(v180, v203, v149, tick());
                            end;
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            v170:Disconnect();
                            if v165 then
                                if v165:FindFirstChild("Trail") then
                                    wait(v165.Trail.Lifetime);
                                end;
                                v165:Destroy();
                                return;
                            end;
                        elseif l_l_FunctionLibraryExtension_0_DeepAncestor_0.ClassName == "Model" and l_l_FunctionLibraryExtension_0_DeepAncestor_0.PrimaryPart ~= nil and l_l_FunctionLibraryExtension_0_DeepAncestor_0.PrimaryPart:GetAttribute("Health") then
                            local v204 = v180.CFrame:ToObjectSpace(CFrame.new(v181));
                            l_ProjectileInflict_0:FireServer(v180, v204, v149, tick());
                            if l_l_FunctionLibraryExtension_0_DeepAncestor_0.Parent.Name ~= "SleepingPlayers" and v182 then
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            end;
                            v170:Disconnect();
                            if v165 then
                                if v165:FindFirstChild("Trail") then
                                    wait(v165.Trail.Lifetime);
                                end;
                                v165:Destroy();
                                return;
                            end;
                        else
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            local v205, v206, v207 = l_FunctionLibraryExtension_0:Penetration(v180, v181, l_l_LookVector_0_0, l_l_FirstChild_0_Attribute_9);
                            l_l_FirstChild_0_Attribute_9 = v205;
                            if l_l_FirstChild_0_Attribute_9 > 0 then
                                l_VFX_0.Impact(unpack(v207));
                                local v208 = l_l_FirstChild_0_Attribute_9 / l_l_l_FirstChild_0_Attribute_9_0;
                                l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 * math.clamp(v208, 0.5, 1);
                                l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = v206;
                                v153[v194] = true;
                                v151.FilterDescendantsInstances = v152;
                                return;
                            else
                                v170:Disconnect();
                                if v165 then
                                    if v165:FindFirstChild("Trail") then
                                        wait(v165.Trail.Lifetime);
                                    end;
                                    v165:Destroy();
                                    return;
                                end;
                            end;
                        end;
                    elseif v159 > 2500 or tick() - v154 > 60 then
                        v170:Disconnect();
                        if v165 then
                            if v165:FindFirstChild("Trail") then
                                wait(v165.Trail.Lifetime);
                            end;
                            v165:Destroy();
                            return;
                        end;
                    else
                        l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = v181;
                        l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 - l_l_FirstChild_0_Attribute_1 * l_l_FirstChild_0_Attribute_2 ^ 2 * v173 ^ 2;
                        local v209 = Vector3.new(0, l_l_FirstChild_0_Attribute_0 * v174 ^ 2, 0);
                        l_l_LookVector_0_0 = (l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_l_LookVector_0_0 * 10000 - v209 - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1).Unit;
                        table.insert(v168, v173);
                        v173 = 0;
                    end;
                end;
            end;
            v170 = l_RunService_0.RenderStepped:Connect(v210);
        end;
        if l_l_FirstChild_0_Attribute_5 ~= nil then
            for _ = 1, l_l_FirstChild_0_Attribute_5 do
                coroutine.wrap(v211)();
            end;
        else
            coroutine.wrap(v211)();
        end;
        return v125 / 200, v126 / 200, v123, v121;
    else
        return;
    end;
end;
return v0;
    local v0 = {};
local l_VFX_0 = require(game.ReplicatedStorage.Modules:WaitForChild("VFX"));
local l_UniversalTables_0 = require(game.ReplicatedStorage.Modules:WaitForChild("UniversalTables"));
local l_FunctionLibraryExtension_0 = require(game.ReplicatedStorage.Modules:WaitForChild("FunctionLibraryExtension"));
local l_ProjectileInflict_0 = game.ReplicatedStorage.Remotes.ProjectileInflict;
local l_VisualProjectile_0 = game.ReplicatedStorage.Remotes.VisualProjectile;
local l_FireProjectile_0 = game.ReplicatedStorage.Remotes.FireProjectile;
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_1 = l_ReplicatedStorage_0:WaitForChild("Players");
local _ = l_ReplicatedStorage_0:WaitForChild("Remotes");
local _ = game.ReplicatedStorage:WaitForChild("Modules");
local l_RangedWeapons_0 = l_ReplicatedStorage_0:WaitForChild("RangedWeapons");
local _ = l_ReplicatedStorage_0:WaitForChild("SFX");
local l_VFX_1 = game.ReplicatedStorage:WaitForChild("VFX");
local l_Debris_0 = game:GetService("Debris");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v18 = l_Players_1:WaitForChild(l_LocalPlayer_0.Name);
local l_Temp_0 = game.ReplicatedStorage.Temp;
local _ = l_UniversalTables_0.UniversalTable.GameSettings.RootScanHeight;
local v21 = l_UniversalTables_0.ReturnTable("GlobalIgnoreListProjectile");
local _ = {
    "LeftFoot", 
    "LeftHand", 
    "LeftLowerArm", 
    "LeftLowerLeg", 
    "LeftUpperArm", 
    "LeftUpperLeg", 
    "LowerTorso", 
    "RightFoot", 
    "RightHand", 
    "RightLowerArm", 
    "RightLowerLeg", 
    "RightUpperArm", 
    "RightUpperLeg", 
    "RightUpperLeg", 
    "UpperTorso", 
    "Head", 
    "FaceHitBox", 
    "HeadTopHitBox"
};
local function _(v23) --[[ Line: 62 ]] --[[ Name: isPlayer ]]
    return (l_Players_0:FindFirstChild(v23.Name));
end;
local function _(v25, v26) --[[ Line: 68 ]] --[[ Name: getRayClosestPoint ]]
    local v27 = v25.Origin - v26;
    local l_Direction_0 = v25.Direction;
    return v26 + (v27 - v27:Dot(l_Direction_0) / l_Direction_0:Dot(l_Direction_0) * l_Direction_0);
end;
local _ = function(v30, v31, v32) --[[ Line: 77 ]] --[[ Name: getAimHeight ]]
    local _ = v30.CFrame.p;
    local l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0 = l_FunctionLibraryExtension_0:GetEstimatedCameraPosition(l_LocalPlayer_0);
    local v35 = Ray.new(l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0, (v32 - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0).Unit * 7500);
    local v36 = v35.Origin - v31;
    local l_Direction_1 = v35.Direction;
    return (v31 + (v36 - v36:Dot(l_Direction_1) / l_Direction_1:Dot(l_Direction_1) * l_Direction_1)).Y;
end;
local function _(v39, v40, v41, v42) --[[ Line: 88 ]] --[[ Name: intersection_point ]]
    local v43 = (v40.Z - v39.Z) / (v40.X - v39.X);
    local v44 = (v42.Z - v41.Z) / (v42.X - v41.X);
    local v45 = v39.Z - v43 * v39.X;
    local v46 = (v41.Z - v44 * v41.X - v45) / (v43 - v44);
    local v47 = v43 * v46 + v45;
    return (Vector3.new(v46, v39.Y, v47));
end;
local function _(v49) --[[ Line: 98 ]] --[[ Name: Encrypt ]]
    local v50 = "";
    for v51 = 1, v49:len() do
        v50 = v50 .. string.char(v49:sub(v51, v51):byte() - 5);
    end;
    return v50;
end;
local function v61(v53, v54) --[[ Line: 109 ]] --[[ Name: devideNumberSequence ]]
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local l_Keypoints_0 = v53.Keypoints;
    for v60 = 1, #l_Keypoints_0 do
        if v60 == 1 then
            v55 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 2 then
            v56 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 3 then
            v57 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 4 then
            v58 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        end;
    end;
    return (NumberSequence.new({
        v55, 
        v56, 
        v57, 
        v58
    }));
end;
local function v73(v62, v63, v64, v65, v66, v67) --[[ Line: 139 ]] --[[ Name: RotCamera ]]
    if v66 then
        local v68 = math.min(1.5 / math.max(v67, 0), 90);
        local v69 = 0;
        local v70 = tick();
        while true do
            local v71 = v68 * (1 * (tick() - v70) * 60);
            local v72 = v69 + v71;
            v69 = v72 > 90 and 90 or v72;
            if v62.CoordinateFrame.lookVector.Y <= 0.98 then
                v62.CoordinateFrame = v62.CoordinateFrame * CFrame.Angles(v63 / (90 / v71), v64 / (90 / v71), v65 / (90 / v71));
                if v69 ~= 90 then
                    v70 = tick();
                    game:GetService("RunService").Stepped:wait();
                else
                    break;
                end;
            else
                break;
            end;
        end;
    else
        v62.CoordinateFrame = v62.CoordinateFrame * CFrame.Angles(v63, v64, v65);
    end;
end;
RecoilCamera = function(v74, v75, v76, _, _) --[[ Line: 162 ]] --[[ Name: RecoilCamera ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v80 = v75 * 0.004 / 3;
    local v81 = v76 * 0.004 / 3;
    local v82 = 0;
    local v83 = 0;
    if v74 then
        v82 = v74.y.Value * v80 * 2;
        v83 = v74.x.Value * v81 * 2;
    end;
    coroutine.wrap(function() --[[ Line: 181 ]]
        v73(l_CurrentCamera_0, v82, v83, 0, true, 0.06);
    end)();
end;
v0.CreateBullet = function(_, v85, v86, v87, _, v89, v90, v91, v92) --[[ Line: 191 ]] --[[ Name: CreateBullet ]]
    local l_Character_0 = l_LocalPlayer_0.Character;
    local l_HumanoidRootPart_0 = l_Character_0.HumanoidRootPart;
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    if l_Character_0:FindFirstChild(v85.Name) then
        local v96 = nil;
        local v97 = nil;
        if v87.Item.Attachments:FindFirstChild("Front") then
            v96 = v87.Item.Attachments.Front:GetChildren()[1].Barrel;
            v97 = v86.Attachments.Front:GetChildren()[1].Barrel;
        else
            v96 = v87.Item.Barrel;
            v97 = v86.Barrel;
        end;
        local l_ItemRoot_0 = v86.ItemRoot;
        local l_ItemProperties_0 = v85.ItemProperties;
        local l_l_RangedWeapons_0_FirstChild_0 = l_RangedWeapons_0:FindFirstChild(v85.Name);
        local l_SpecialProperties_0 = l_ItemProperties_0:FindFirstChild("SpecialProperties");
        local l_Attribute_0 = v18.Status.GameplayVariables:GetAttribute("EquipId");
        local l_FirstChild_0 = l_ReplicatedStorage_0.AmmoTypes:FindFirstChild(v89);
        local v104 = l_SpecialProperties_0 and l_SpecialProperties_0:GetAttribute("TracerColor") or l_l_RangedWeapons_0_FirstChild_0:GetAttribute("ProjectileColor");
        local _ = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("BulletMaterial");
        local l_l_FirstChild_0_Attribute_0 = l_FirstChild_0:GetAttribute("ProjectileDrop");
        local l_l_l_RangedWeapons_0_FirstChild_0_Attribute_1 = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("MuzzleEffect");
        local l_l_FirstChild_0_Attribute_1 = l_FirstChild_0:GetAttribute("Drag");
        local l_l_FirstChild_0_Attribute_2 = l_FirstChild_0:GetAttribute("MuzzleVelocity");
        local l_l_l_FirstChild_0_Attribute_2_0 = l_l_FirstChild_0_Attribute_2;
        local l_l_FirstChild_0_Attribute_3 = l_FirstChild_0:GetAttribute("Tracer");
        local _ = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("RecoilRecoveryTimeMod");
        local l_l_FirstChild_0_Attribute_4 = l_FirstChild_0:GetAttribute("AccuracyDeviation");
        local l_l_FirstChild_0_Attribute_5 = l_FirstChild_0:GetAttribute("Pellets");
        local l_l_FirstChild_0_Attribute_6 = l_FirstChild_0:GetAttribute("Damage");
        local l_l_FirstChild_0_Attribute_7 = l_FirstChild_0:GetAttribute("Arrow");
        local _ = l_FirstChild_0:GetAttribute("ProjectileWidth");
        local l_l_FirstChild_0_Attribute_9 = l_FirstChild_0:GetAttribute("ArmorPen");
        local l_l_l_FirstChild_0_Attribute_9_0 = l_l_FirstChild_0_Attribute_9;
        local v120 = nil;
        local v121 = nil;
        if v91 and l_l_RangedWeapons_0_FirstChild_0:FindFirstChild("RecoilPattern") then
            v120 = #l_l_RangedWeapons_0_FirstChild_0.RecoilPattern:GetChildren();
            v121 = if v91 == 1 then {
                x = {
                    Value = l_l_RangedWeapons_0_FirstChild_0.RecoilPattern["1"].x.Value
                }, 
                y = {
                    Value = l_l_RangedWeapons_0_FirstChild_0.RecoilPattern["1"].y.Value
                }
            } else l_l_RangedWeapons_0_FirstChild_0.RecoilPattern:FindFirstChild((tostring(v91)));
        else
            v121 = {
                x = {
                    Value = math.random(-5, 5) * 0.01
                }, 
                y = {
                    Value = math.random(5, 10) * 0.01
                }
            };
        end;
        local v122 = v18.Status.GameplayVariables:GetAttribute("Stance") == "Crouching";
        local v123 = l_ItemProperties_0.Tool:GetAttribute("MuzzleDevice") or "Default";
        local v124 = l_FirstChild_0:GetAttribute("RecoilStrength") * (l_HumanoidRootPart_0:GetAttribute("Recoil") or 1);
        local v125 = v122 and v124 * 0.9 or v124;
        local v126 = v122 and v124 * 0.9 or v124;
        local l_Attachments_0 = v85:FindFirstChild("Attachments");
        if l_Attachments_0 then
            local l_l_Attachments_0_Children_0 = l_Attachments_0:GetChildren();
            for v129 = 1, #l_l_Attachments_0_Children_0 do
                local l_StringValue_0 = l_l_Attachments_0_Children_0[v129]:FindFirstChildOfClass("StringValue");
                if l_StringValue_0 and l_StringValue_0.ItemProperties:FindFirstChild("Attachment") and (not l_StringValue_0.ItemProperties:GetAttribute("Durability") or l_StringValue_0.ItemProperties:GetAttribute("Durability") > 0) then
                    local l_Attachment_0 = l_StringValue_0.ItemProperties.Attachment;
                    local l_l_Attachment_0_Attribute_0 = l_Attachment_0:GetAttribute("Recoil");
                    if l_l_Attachment_0_Attribute_0 then
                        v125 = v125 + l_l_Attachment_0_Attribute_0 * l_Attachment_0:GetAttribute("HRecoilMod");
                        v126 = v126 + l_l_Attachment_0_Attribute_0 * l_Attachment_0:GetAttribute("VRecoilMod");
                    end;
                    local l_l_Attachment_0_Attribute_1 = l_Attachment_0:GetAttribute("MuzzleDevice");
                    if l_l_Attachment_0_Attribute_1 then
                        v123 = l_l_Attachment_0_Attribute_1;
                        if v87.Item.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension") then
                            v96 = v87.Item.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension");
                            v97 = v86.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension");
                        end;
                    end;
                end;
            end;
        end;
        if v123 == "Suppressor" then
            if tick() - v90 < 0.8 then
                l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSoundSupressed, l_ItemRoot_0.FireSoundSupressed.TimeLength, l_Temp_0);
            else
                l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSoundSupressed, l_ItemRoot_0.FireSoundSupressed.TimeLength, l_Temp_0);
            end;
        elseif tick() - v90 < 0.8 then
            l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSound, l_ItemRoot_0.FireSound.TimeLength, l_Temp_0);
        else
            l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSound, l_ItemRoot_0.FireSound.TimeLength, l_Temp_0);
        end;
        if l_l_l_RangedWeapons_0_FirstChild_0_Attribute_1 == true then
            local v134 = l_SpecialProperties_0 and l_SpecialProperties_0:GetAttribute("MuzzleEffect");
            local l_Children_0 = ((v134 and l_VFX_1.MuzzleEffects.Override:FindFirstChild(v134) or l_VFX_1.MuzzleEffects):FindFirstChild(v123) or l_VFX_1.MuzzleEffects:FindFirstChild(v123)):GetChildren();
            local v136 = l_Children_0[math.random(1, #l_Children_0)];
            local l_Children_1 = v136.Particles:GetChildren();
            if v136:FindFirstChild("MuzzleLight") then
                local v138 = v136.MuzzleLight:Clone();
                v138.Range = math.clamp(v138.Range + math.random(-2, 2) / 2, 0, 50);
                v138.Enabled = true;
                l_Debris_0:AddItem(v138, 0.1);
                v138.Parent = v96;
            end;
            for v139 = 1, #l_Children_1 do
                if l_Children_1[v139].className == "ParticleEmitter" then
                    local v140 = l_Children_1[v139]:Clone();
                    local v141 = v140:GetAttribute("EmitCount") or 1;
                    local v142 = math.clamp(l_l_FirstChild_0_Attribute_6 / 45 / 2.4, 0, 0.6);
                    if l_l_FirstChild_0_Attribute_5 then
                        v142 = math.clamp(l_l_FirstChild_0_Attribute_6 * l_l_FirstChild_0_Attribute_5 / 45 / 2.4, 0, 0.6);
                    end;
                    local v143 = math.clamp(v142, 1, 10);
                    v140.Lifetime = NumberRange.new(v140.Lifetime.Min * v143, v140.Lifetime.Max * v143);
                    v140.Size = v61(v140.Size, v142);
                    v140.Parent = v96;
                    v140:Emit(v141);
                    l_Debris_0:AddItem(v140, v140.Lifetime.Max);
                end;
            end;
        end;
        local _ = l_HumanoidRootPart_0.CFrame.p;
        local l_LookVector_0 = v92.CFrame.LookVector;
        local v146 = math.clamp(l_l_FirstChild_0_Attribute_2 / 2400, 0.7, 1.2);
        local v147 = 0;
        local v148 = "";
        local v149 = 0;
        local v150 = false;
        local function v211() --[[ Line: 369 ]] --[[ Name: fireBullet ]]
            local v151 = RaycastParams.new();
            v151.FilterType = Enum.RaycastFilterType.Exclude;
            local v152 = {
                l_Character_0, 
                v87, 
                v21
            };
            local v153 = {};
            v151.FilterDescendantsInstances = v152;
            v151.IgnoreWater = false;
            v151.CollisionGroup = "WeaponRay";
            local v154 = tick();
            local l_l_LookVector_0_0 = l_LookVector_0;
            local l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = l_FunctionLibraryExtension_0:GetEstimatedCameraPosition(l_LocalPlayer_0);
            local v157 = false;
            local v158 = Vector3.new();
            local v159 = 0;
            local v160 = l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_LookVector_0 * 1000;
            if l_l_FirstChild_0_Attribute_4 then
                local v161 = 6.283185307179586 * math.random();
                local v162 = math.random(-l_l_FirstChild_0_Attribute_4, l_l_FirstChild_0_Attribute_4);
                local v163 = v162 * math.cos(v161);
                local v164 = v162 * math.sin(v161);
                l_l_LookVector_0_0 = (v160 + Vector3.new(v163, math.random(-l_l_FirstChild_0_Attribute_4, l_l_FirstChild_0_Attribute_4), v164) - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1).Unit;
            end;
            v147 = v147 + 1;
            if v147 == 1 then
                v149 = math.random(-100000, 100000);
                v148 = tostring(game.Players.LocalPlayer.UserId);
                coroutine.wrap(function() --[[ Line: 445 ]]
                    if not l_FireProjectile_0:InvokeServer(l_l_LookVector_0_0, v149, tick()) then
                        script.Parent.Binds.AdjustBullets:Fire(l_Attribute_0, 1);
                    end;
                end)();
            elseif v147 > 1 then
                l_VisualProjectile_0:FireServer(l_l_LookVector_0_0, v149);
            end;
            if not l_l_FirstChild_0_Attribute_5 or not v150 and v147 > math.floor(l_l_FirstChild_0_Attribute_5 * 0.2) then
                v150 = true;
            end;
            local v165 = nil;
            local v166 = nil;
            if l_l_FirstChild_0_Attribute_3 then
                v165 = l_VFX_1.MuzzleEffects.Tracer:Clone();
                v165.Name = v148;
                v165.Color = v104;
                l_Debris_0:AddItem(v165, 10);
                v165.Position = Vector3.new(0, -100, 0, 0);
                v165.Parent = game.Workspace.NoCollision.Effects;
                local _ = l_HumanoidRootPart_0.AssemblyLinearVelocity;
                v166 = v96.Position;
            end;
            local v168 = {};
            local _ = {};
            local v170 = nil;
            local _ = 60;
            local _ = 0.008333333333333333;
            local v173 = 0;
            local v174 = 0;
            local _ = function(_) --[[ Line: 499 ]] --[[ Name: Stop ]]
                v170:Disconnect();
                if v165 then
                    if v165:FindFirstChild("Trail") then
                        wait(v165.Trail.Lifetime);
                    end;
                    v165:Destroy();
                end;
            end;
            local function v210(v177) --[[ Line: 521 ]] --[[ Name: onStep ]]
                v173 = v173 + v177;
                if v173 > 0.008333333333333333 then
                    v174 = v174 + v173;
                    local v178 = l_l_FirstChild_0_Attribute_2 * v173;
                    local v179 = workspace:Raycast(l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1, l_l_LookVector_0_0 * v178, v151);
                    local v180 = nil;
                    local v181 = nil;
                    local v182 = nil;
                    local v183 = nil;
                    if v179 then
                        v180 = v179.Instance;
                        v181 = v179.Position;
                        v182 = v179.Normal;
                        v183 = v179.Material;
                    else
                        v181 = l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_l_LookVector_0_0 * v178;
                    end;
                    local l_Magnitude_0 = (l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 - v181).Magnitude;
                    v159 = v159 + l_Magnitude_0;
                    if v165 then
                        local l_Magnitude_1 = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                        local v186 = math.clamp(l_CurrentCamera_1.FieldOfView / 70, 0.38, 1.1);
                        if v159 < 200 then
                            local _ = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                            local v188 = math.clamp(l_Magnitude_1 / 200, 0.1, 2.1) * v146 * v186;
                            local _ = (v166 - v181).Magnitude;
                            local l_Unit_0 = (v181 - v166).Unit;
                            v165.Size = Vector3.new(v188, v188, v188);
                            local v191 = v166 + l_LookVector_0 * v159;
                            v165.CFrame = CFrame.new(v191, l_Unit_0);
                        else
                            local _ = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                            local v193 = math.clamp(l_Magnitude_1 / 200, 0.1, 2.1) * v146 * v186;
                            v165.Size = Vector3.new(v193, v193, v193);
                            v165.CFrame = CFrame.new(v181, l_l_LookVector_0_0);
                        end;
                    end;
                    local v194 = "nil";
                    if v180 then
                        local v195 = math.floor(v181.X);
                        local v196 = math.floor(v181.Y);
                        local v197 = math.floor(v181.Z);
                        local v198 = math.floor(v182.X);
                        local v199 = math.floor(v182.Y);
                        local v200 = math.floor(v182.Z);
                        v194 = tostring(v195) .. tostring(v196) .. tostring(v197) .. tostring(v198) .. tostring(v199) .. tostring(v200);
                        if v153[v194] then
                            v181 = v181 - v182 * 0.1;
                        end;
                    end;
                    if v180 and not v153[v194] then
                        table.insert(v168, v173);
                        local l_l_FunctionLibraryExtension_0_DeepAncestor_0 = l_FunctionLibraryExtension_0:FindDeepAncestor(v180, "Model");
                        local _ = l_l_FunctionLibraryExtension_0_DeepAncestor_0;
                        if v180:FindFirstChild("RealParent") then
                            l_l_FunctionLibraryExtension_0_DeepAncestor_0 = v180.RealParent.Value;
                        end;
                        if v180:GetAttribute("PassThrough", 2) then
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180:GetAttribute("PassThrough", 1) and l_l_FirstChild_0_Attribute_7 == nil then
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180:GetAttribute("Glass") then
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180.Name == "Terrain" then
                            if v157 == false and v183 == Enum.Material.Water then
                                v157 = true;
                                l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 * 0.15;
                                v158 = v181;
                                v151.IgnoreWater = true;
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                                return;
                            else
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                                v170:Disconnect();
                                if v165 then
                                    if v165:FindFirstChild("Trail") then
                                        wait(v165.Trail.Lifetime);
                                    end;
                                    v165:Destroy();
                                    return;
                                end;
                            end;
                        elseif l_l_FunctionLibraryExtension_0_DeepAncestor_0:FindFirstChild("Humanoid") then
                            local v203 = v180.CFrame:ToObjectSpace(CFrame.new(v181));
                            if l_l_FirstChild_0_Attribute_2 / l_l_l_FirstChild_0_Attribute_2_0 > 0.1 and l_l_FirstChild_0_Attribute_2 < 3300 then
                                l_ProjectileInflict_0:FireServer(v180, v203, v149, tick());
                            end;
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            v170:Disconnect();
                            if v165 then
                                if v165:FindFirstChild("Trail") then
                                    wait(v165.Trail.Lifetime);
                                end;
                                v165:Destroy();
                                return;
                            end;
                        elseif l_l_FunctionLibraryExtension_0_DeepAncestor_0.ClassName == "Model" and l_l_FunctionLibraryExtension_0_DeepAncestor_0.PrimaryPart ~= nil and l_l_FunctionLibraryExtension_0_DeepAncestor_0.PrimaryPart:GetAttribute("Health") then
                            local v204 = v180.CFrame:ToObjectSpace(CFrame.new(v181));
                            l_ProjectileInflict_0:FireServer(v180, v204, v149, tick());
                            if l_l_FunctionLibraryExtension_0_DeepAncestor_0.Parent.Name ~= "SleepingPlayers" and v182 then
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            end;
                            v170:Disconnect();
                            if v165 then
                                if v165:FindFirstChild("Trail") then
                                    wait(v165.Trail.Lifetime);
                                end;
                                v165:Destroy();
                                return;
                            end;
                        else
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            local v205, v206, v207 = l_FunctionLibraryExtension_0:Penetration(v180, v181, l_l_LookVector_0_0, l_l_FirstChild_0_Attribute_9);
                            l_l_FirstChild_0_Attribute_9 = v205;
                            if l_l_FirstChild_0_Attribute_9 > 0 then
                                l_VFX_0.Impact(unpack(v207));
                                local v208 = l_l_FirstChild_0_Attribute_9 / l_l_l_FirstChild_0_Attribute_9_0;
                                l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 * math.clamp(v208, 0.5, 1);
                                l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = v206;
                                v153[v194] = true;
                                v151.FilterDescendantsInstances = v152;
                                return;
                            else
                                v170:Disconnect();
                                if v165 then
                                    if v165:FindFirstChild("Trail") then
                                        wait(v165.Trail.Lifetime);
                                    end;
                                    v165:Destroy();
                                    return;
                                end;
                            end;
                        end;
                    elseif v159 > 2500 or tick() - v154 > 60 then
                        v170:Disconnect();
                        if v165 then
                            if v165:FindFirstChild("Trail") then
                                wait(v165.Trail.Lifetime);
                            end;
                            v165:Destroy();
                            return;
                        end;
                    else
                        l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = v181;
                        l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 - l_l_FirstChild_0_Attribute_1 * l_l_FirstChild_0_Attribute_2 ^ 2 * v173 ^ 2;
                        local v209 = Vector3.new(0, l_l_FirstChild_0_Attribute_0 * v174 ^ 2, 0);
                        l_l_LookVector_0_0 = (l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_l_LookVector_0_0 * 10000 - v209 - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1).Unit;
                        table.insert(v168, v173);
                        v173 = 0;
                    end;
                end;
            end;
            v170 = l_RunService_0.RenderStepped:Connect(v210);
        end;
        if l_l_FirstChild_0_Attribute_5 ~= nil then
            for _ = 1, l_l_FirstChild_0_Attribute_5 do
                coroutine.wrap(v211)();
            end;
        else
            coroutine.wrap(v211)();
        end;
        return v125 / 200, v126 / 200, v123, v121;
    else
        return;
    end;
end;
return v0;
      local v0 = {};
local l_VFX_0 = require(game.ReplicatedStorage.Modules:WaitForChild("VFX"));
local l_UniversalTables_0 = require(game.ReplicatedStorage.Modules:WaitForChild("UniversalTables"));
local l_FunctionLibraryExtension_0 = require(game.ReplicatedStorage.Modules:WaitForChild("FunctionLibraryExtension"));
local l_ProjectileInflict_0 = game.ReplicatedStorage.Remotes.ProjectileInflict;
local l_VisualProjectile_0 = game.ReplicatedStorage.Remotes.VisualProjectile;
local l_FireProjectile_0 = game.ReplicatedStorage.Remotes.FireProjectile;
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_1 = l_ReplicatedStorage_0:WaitForChild("Players");
local _ = l_ReplicatedStorage_0:WaitForChild("Remotes");
local _ = game.ReplicatedStorage:WaitForChild("Modules");
local l_RangedWeapons_0 = l_ReplicatedStorage_0:WaitForChild("RangedWeapons");
local _ = l_ReplicatedStorage_0:WaitForChild("SFX");
local l_VFX_1 = game.ReplicatedStorage:WaitForChild("VFX");
local l_Debris_0 = game:GetService("Debris");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v18 = l_Players_1:WaitForChild(l_LocalPlayer_0.Name);
local l_Temp_0 = game.ReplicatedStorage.Temp;
local _ = l_UniversalTables_0.UniversalTable.GameSettings.RootScanHeight;
local v21 = l_UniversalTables_0.ReturnTable("GlobalIgnoreListProjectile");
local _ = {
    "LeftFoot", 
    "LeftHand", 
    "LeftLowerArm", 
    "LeftLowerLeg", 
    "LeftUpperArm", 
    "LeftUpperLeg", 
    "LowerTorso", 
    "RightFoot", 
    "RightHand", 
    "RightLowerArm", 
    "RightLowerLeg", 
    "RightUpperArm", 
    "RightUpperLeg", 
    "RightUpperLeg", 
    "UpperTorso", 
    "Head", 
    "FaceHitBox", 
    "HeadTopHitBox"
};
local function _(v23) --[[ Line: 62 ]] --[[ Name: isPlayer ]]
    return (l_Players_0:FindFirstChild(v23.Name));
end;
local function _(v25, v26) --[[ Line: 68 ]] --[[ Name: getRayClosestPoint ]]
    local v27 = v25.Origin - v26;
    local l_Direction_0 = v25.Direction;
    return v26 + (v27 - v27:Dot(l_Direction_0) / l_Direction_0:Dot(l_Direction_0) * l_Direction_0);
end;
local _ = function(v30, v31, v32) --[[ Line: 77 ]] --[[ Name: getAimHeight ]]
    local _ = v30.CFrame.p;
    local l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0 = l_FunctionLibraryExtension_0:GetEstimatedCameraPosition(l_LocalPlayer_0);
    local v35 = Ray.new(l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0, (v32 - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0).Unit * 7500);
    local v36 = v35.Origin - v31;
    local l_Direction_1 = v35.Direction;
    return (v31 + (v36 - v36:Dot(l_Direction_1) / l_Direction_1:Dot(l_Direction_1) * l_Direction_1)).Y;
end;
local function _(v39, v40, v41, v42) --[[ Line: 88 ]] --[[ Name: intersection_point ]]
    local v43 = (v40.Z - v39.Z) / (v40.X - v39.X);
    local v44 = (v42.Z - v41.Z) / (v42.X - v41.X);
    local v45 = v39.Z - v43 * v39.X;
    local v46 = (v41.Z - v44 * v41.X - v45) / (v43 - v44);
    local v47 = v43 * v46 + v45;
    return (Vector3.new(v46, v39.Y, v47));
end;
local function _(v49) --[[ Line: 98 ]] --[[ Name: Encrypt ]]
    local v50 = "";
    for v51 = 1, v49:len() do
        v50 = v50 .. string.char(v49:sub(v51, v51):byte() - 5);
    end;
    return v50;
end;
local function v61(v53, v54) --[[ Line: 109 ]] --[[ Name: devideNumberSequence ]]
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local l_Keypoints_0 = v53.Keypoints;
    for v60 = 1, #l_Keypoints_0 do
        if v60 == 1 then
            v55 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 2 then
            v56 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 3 then
            v57 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 4 then
            v58 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        end;
    end;
    return (NumberSequence.new({
        v55, 
        v56, 
        v57, 
        v58
    }));
end;
local function v73(v62, v63, v64, v65, v66, v67) --[[ Line: 139 ]] --[[ Name: RotCamera ]]
    if v66 then
        local v68 = math.min(1.5 / math.max(v67, 0), 90);
        local v69 = 0;
        local v70 = tick();
        while true do
            local v71 = v68 * (1 * (tick() - v70) * 60);
            local v72 = v69 + v71;
            v69 = v72 > 90 and 90 or v72;
            if v62.CoordinateFrame.lookVector.Y <= 0.98 then
                v62.CoordinateFrame = v62.CoordinateFrame * CFrame.Angles(v63 / (90 / v71), v64 / (90 / v71), v65 / (90 / v71));
                if v69 ~= 90 then
                    v70 = tick();
                    game:GetService("RunService").Stepped:wait();
                else
                    break;
                end;
            else
                break;
            end;
        end;
    else
        v62.CoordinateFrame = v62.CoordinateFrame * CFrame.Angles(v63, v64, v65);
    end;
end;
RecoilCamera = function(v74, v75, v76, _, _) --[[ Line: 162 ]] --[[ Name: RecoilCamera ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v80 = v75 * 0.004 / 3;
    local v81 = v76 * 0.004 / 3;
    local v82 = 0;
    local v83 = 0;
    if v74 then
        v82 = v74.y.Value * v80 * 2;
        v83 = v74.x.Value * v81 * 2;
    end;
    coroutine.wrap(function() --[[ Line: 181 ]]
        v73(l_CurrentCamera_0, v82, v83, 0, true, 0.06);
    end)();
end;
v0.CreateBullet = function(_, v85, v86, v87, _, v89, v90, v91, v92) --[[ Line: 191 ]] --[[ Name: CreateBullet ]]
    local l_Character_0 = l_LocalPlayer_0.Character;
    local l_HumanoidRootPart_0 = l_Character_0.HumanoidRootPart;
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    if l_Character_0:FindFirstChild(v85.Name) then
        local v96 = nil;
        local v97 = nil;
        if v87.Item.Attachments:FindFirstChild("Front") then
            v96 = v87.Item.Attachments.Front:GetChildren()[1].Barrel;
            v97 = v86.Attachments.Front:GetChildren()[1].Barrel;
        else
            v96 = v87.Item.Barrel;
            v97 = v86.Barrel;
        end;
        local l_ItemRoot_0 = v86.ItemRoot;
        local l_ItemProperties_0 = v85.ItemProperties;
        local l_l_RangedWeapons_0_FirstChild_0 = l_RangedWeapons_0:FindFirstChild(v85.Name);
        local l_SpecialProperties_0 = l_ItemProperties_0:FindFirstChild("SpecialProperties");
        local l_Attribute_0 = v18.Status.GameplayVariables:GetAttribute("EquipId");
        local l_FirstChild_0 = l_ReplicatedStorage_0.AmmoTypes:FindFirstChild(v89);
        local v104 = l_SpecialProperties_0 and l_SpecialProperties_0:GetAttribute("TracerColor") or l_l_RangedWeapons_0_FirstChild_0:GetAttribute("ProjectileColor");
        local _ = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("BulletMaterial");
        local l_l_FirstChild_0_Attribute_0 = l_FirstChild_0:GetAttribute("ProjectileDrop");
        local l_l_l_RangedWeapons_0_FirstChild_0_Attribute_1 = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("MuzzleEffect");
        local l_l_FirstChild_0_Attribute_1 = l_FirstChild_0:GetAttribute("Drag");
        local l_l_FirstChild_0_Attribute_2 = l_FirstChild_0:GetAttribute("MuzzleVelocity");
        local l_l_l_FirstChild_0_Attribute_2_0 = l_l_FirstChild_0_Attribute_2;
        local l_l_FirstChild_0_Attribute_3 = l_FirstChild_0:GetAttribute("Tracer");
        local _ = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("RecoilRecoveryTimeMod");
        local l_l_FirstChild_0_Attribute_4 = l_FirstChild_0:GetAttribute("AccuracyDeviation");
        local l_l_FirstChild_0_Attribute_5 = l_FirstChild_0:GetAttribute("Pellets");
        local l_l_FirstChild_0_Attribute_6 = l_FirstChild_0:GetAttribute("Damage");
        local l_l_FirstChild_0_Attribute_7 = l_FirstChild_0:GetAttribute("Arrow");
        local _ = l_FirstChild_0:GetAttribute("ProjectileWidth");
        local l_l_FirstChild_0_Attribute_9 = l_FirstChild_0:GetAttribute("ArmorPen");
        local l_l_l_FirstChild_0_Attribute_9_0 = l_l_FirstChild_0_Attribute_9;
        local v120 = nil;
        local v121 = nil;
        if v91 and l_l_RangedWeapons_0_FirstChild_0:FindFirstChild("RecoilPattern") then
            v120 = #l_l_RangedWeapons_0_FirstChild_0.RecoilPattern:GetChildren();
            v121 = if v91 == 1 then {
                x = {
                    Value = l_l_RangedWeapons_0_FirstChild_0.RecoilPattern["1"].x.Value
                }, 
                y = {
                    Value = l_l_RangedWeapons_0_FirstChild_0.RecoilPattern["1"].y.Value
                }
            } else l_l_RangedWeapons_0_FirstChild_0.RecoilPattern:FindFirstChild((tostring(v91)));
        else
            v121 = {
                x = {
                    Value = math.random(-5, 5) * 0.01
                }, 
                y = {
                    Value = math.random(5, 10) * 0.01
                }
            };
        end;
        local v122 = v18.Status.GameplayVariables:GetAttribute("Stance") == "Crouching";
        local v123 = l_ItemProperties_0.Tool:GetAttribute("MuzzleDevice") or "Default";
        local v124 = l_FirstChild_0:GetAttribute("RecoilStrength") * (l_HumanoidRootPart_0:GetAttribute("Recoil") or 1);
        local v125 = v122 and v124 * 0.9 or v124;
        local v126 = v122 and v124 * 0.9 or v124;
        local l_Attachments_0 = v85:FindFirstChild("Attachments");
        if l_Attachments_0 then
            local l_l_Attachments_0_Children_0 = l_Attachments_0:GetChildren();
            for v129 = 1, #l_l_Attachments_0_Children_0 do
                local l_StringValue_0 = l_l_Attachments_0_Children_0[v129]:FindFirstChildOfClass("StringValue");
                if l_StringValue_0 and l_StringValue_0.ItemProperties:FindFirstChild("Attachment") and (not l_StringValue_0.ItemProperties:GetAttribute("Durability") or l_StringValue_0.ItemProperties:GetAttribute("Durability") > 0) then
                    local l_Attachment_0 = l_StringValue_0.ItemProperties.Attachment;
                    local l_l_Attachment_0_Attribute_0 = l_Attachment_0:GetAttribute("Recoil");
                    if l_l_Attachment_0_Attribute_0 then
                        v125 = v125 + l_l_Attachment_0_Attribute_0 * l_Attachment_0:GetAttribute("HRecoilMod");
                        v126 = v126 + l_l_Attachment_0_Attribute_0 * l_Attachment_0:GetAttribute("VRecoilMod");
                    end;
                    local l_l_Attachment_0_Attribute_1 = l_Attachment_0:GetAttribute("MuzzleDevice");
                    if l_l_Attachment_0_Attribute_1 then
                        v123 = l_l_Attachment_0_Attribute_1;
                        if v87.Item.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension") then
                            v96 = v87.Item.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension");
                            v97 = v86.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension");
                        end;
                    end;
                end;
            end;
        end;
        if v123 == "Suppressor" then
            if tick() - v90 < 0.8 then
                l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSoundSupressed, l_ItemRoot_0.FireSoundSupressed.TimeLength, l_Temp_0);
            else
                l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSoundSupressed, l_ItemRoot_0.FireSoundSupressed.TimeLength, l_Temp_0);
            end;
        elseif tick() - v90 < 0.8 then
            l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSound, l_ItemRoot_0.FireSound.TimeLength, l_Temp_0);
        else
            l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSound, l_ItemRoot_0.FireSound.TimeLength, l_Temp_0);
        end;
        if l_l_l_RangedWeapons_0_FirstChild_0_Attribute_1 == true then
            local v134 = l_SpecialProperties_0 and l_SpecialProperties_0:GetAttribute("MuzzleEffect");
            local l_Children_0 = ((v134 and l_VFX_1.MuzzleEffects.Override:FindFirstChild(v134) or l_VFX_1.MuzzleEffects):FindFirstChild(v123) or l_VFX_1.MuzzleEffects:FindFirstChild(v123)):GetChildren();
            local v136 = l_Children_0[math.random(1, #l_Children_0)];
            local l_Children_1 = v136.Particles:GetChildren();
            if v136:FindFirstChild("MuzzleLight") then
                local v138 = v136.MuzzleLight:Clone();
                v138.Range = math.clamp(v138.Range + math.random(-2, 2) / 2, 0, 50);
                v138.Enabled = true;
                l_Debris_0:AddItem(v138, 0.1);
                v138.Parent = v96;
            end;
            for v139 = 1, #l_Children_1 do
                if l_Children_1[v139].className == "ParticleEmitter" then
                    local v140 = l_Children_1[v139]:Clone();
                    local v141 = v140:GetAttribute("EmitCount") or 1;
                    local v142 = math.clamp(l_l_FirstChild_0_Attribute_6 / 45 / 2.4, 0, 0.6);
                    if l_l_FirstChild_0_Attribute_5 then
                        v142 = math.clamp(l_l_FirstChild_0_Attribute_6 * l_l_FirstChild_0_Attribute_5 / 45 / 2.4, 0, 0.6);
                    end;
                    local v143 = math.clamp(v142, 1, 10);
                    v140.Lifetime = NumberRange.new(v140.Lifetime.Min * v143, v140.Lifetime.Max * v143);
                    v140.Size = v61(v140.Size, v142);
                    v140.Parent = v96;
                    v140:Emit(v141);
                    l_Debris_0:AddItem(v140, v140.Lifetime.Max);
                end;
            end;
        end;
        local _ = l_HumanoidRootPart_0.CFrame.p;
        local l_LookVector_0 = v92.CFrame.LookVector;
        local v146 = math.clamp(l_l_FirstChild_0_Attribute_2 / 2400, 0.7, 1.2);
        local v147 = 0;
        local v148 = "";
        local v149 = 0;
        local v150 = false;
        local function v211() --[[ Line: 369 ]] --[[ Name: fireBullet ]]
            local v151 = RaycastParams.new();
            v151.FilterType = Enum.RaycastFilterType.Exclude;
            local v152 = {
                l_Character_0, 
                v87, 
                v21
            };
            local v153 = {};
            v151.FilterDescendantsInstances = v152;
            v151.IgnoreWater = false;
            v151.CollisionGroup = "WeaponRay";
            local v154 = tick();
            local l_l_LookVector_0_0 = l_LookVector_0;
            local l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = l_FunctionLibraryExtension_0:GetEstimatedCameraPosition(l_LocalPlayer_0);
            local v157 = false;
            local v158 = Vector3.new();
            local v159 = 0;
            local v160 = l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_LookVector_0 * 1000;
            if l_l_FirstChild_0_Attribute_4 then
                local v161 = 6.283185307179586 * math.random();
                local v162 = math.random(-l_l_FirstChild_0_Attribute_4, l_l_FirstChild_0_Attribute_4);
                local v163 = v162 * math.cos(v161);
                local v164 = v162 * math.sin(v161);
                l_l_LookVector_0_0 = (v160 + Vector3.new(v163, math.random(-l_l_FirstChild_0_Attribute_4, l_l_FirstChild_0_Attribute_4), v164) - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1).Unit;
            end;
            v147 = v147 + 1;
            if v147 == 1 then
                v149 = math.random(-100000, 100000);
                v148 = tostring(game.Players.LocalPlayer.UserId);
                coroutine.wrap(function() --[[ Line: 445 ]]
                    if not l_FireProjectile_0:InvokeServer(l_l_LookVector_0_0, v149, tick()) then
                        script.Parent.Binds.AdjustBullets:Fire(l_Attribute_0, 1);
                    end;
                end)();
            elseif v147 > 1 then
                l_VisualProjectile_0:FireServer(l_l_LookVector_0_0, v149);
            end;
            if not l_l_FirstChild_0_Attribute_5 or not v150 and v147 > math.floor(l_l_FirstChild_0_Attribute_5 * 0.2) then
                v150 = true;
            end;
            local v165 = nil;
            local v166 = nil;
            if l_l_FirstChild_0_Attribute_3 then
                v165 = l_VFX_1.MuzzleEffects.Tracer:Clone();
                v165.Name = v148;
                v165.Color = v104;
                l_Debris_0:AddItem(v165, 10);
                v165.Position = Vector3.new(0, -100, 0, 0);
                v165.Parent = game.Workspace.NoCollision.Effects;
                local _ = l_HumanoidRootPart_0.AssemblyLinearVelocity;
                v166 = v96.Position;
            end;
            local v168 = {};
            local _ = {};
            local v170 = nil;
            local _ = 60;
            local _ = 0.008333333333333333;
            local v173 = 0;
            local v174 = 0;
            local _ = function(_) --[[ Line: 499 ]] --[[ Name: Stop ]]
                v170:Disconnect();
                if v165 then
                    if v165:FindFirstChild("Trail") then
                        wait(v165.Trail.Lifetime);
                    end;
                    v165:Destroy();
                end;
            end;
            local function v210(v177) --[[ Line: 521 ]] --[[ Name: onStep ]]
                v173 = v173 + v177;
                if v173 > 0.008333333333333333 then
                    v174 = v174 + v173;
                    local v178 = l_l_FirstChild_0_Attribute_2 * v173;
                    local v179 = workspace:Raycast(l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1, l_l_LookVector_0_0 * v178, v151);
                    local v180 = nil;
                    local v181 = nil;
                    local v182 = nil;
                    local v183 = nil;
                    if v179 then
                        v180 = v179.Instance;
                        v181 = v179.Position;
                        v182 = v179.Normal;
                        v183 = v179.Material;
                    else
                        v181 = l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_l_LookVector_0_0 * v178;
                    end;
                    local l_Magnitude_0 = (l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 - v181).Magnitude;
                    v159 = v159 + l_Magnitude_0;
                    if v165 then
                        local l_Magnitude_1 = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                        local v186 = math.clamp(l_CurrentCamera_1.FieldOfView / 70, 0.38, 1.1);
                        if v159 < 200 then
                            local _ = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                            local v188 = math.clamp(l_Magnitude_1 / 200, 0.1, 2.1) * v146 * v186;
                            local _ = (v166 - v181).Magnitude;
                            local l_Unit_0 = (v181 - v166).Unit;
                            v165.Size = Vector3.new(v188, v188, v188);
                            local v191 = v166 + l_LookVector_0 * v159;
                            v165.CFrame = CFrame.new(v191, l_Unit_0);
                        else
                            local _ = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                            local v193 = math.clamp(l_Magnitude_1 / 200, 0.1, 2.1) * v146 * v186;
                            v165.Size = Vector3.new(v193, v193, v193);
                            v165.CFrame = CFrame.new(v181, l_l_LookVector_0_0);
                        end;
                    end;
                    local v194 = "nil";
                    if v180 then
                        local v195 = math.floor(v181.X);
                        local v196 = math.floor(v181.Y);
                        local v197 = math.floor(v181.Z);
                        local v198 = math.floor(v182.X);
                        local v199 = math.floor(v182.Y);
                        local v200 = math.floor(v182.Z);
                        v194 = tostring(v195) .. tostring(v196) .. tostring(v197) .. tostring(v198) .. tostring(v199) .. tostring(v200);
                        if v153[v194] then
                            v181 = v181 - v182 * 0.1;
                        end;
                    end;
                    if v180 and not v153[v194] then
                        table.insert(v168, v173);
                        local l_l_FunctionLibraryExtension_0_DeepAncestor_0 = l_FunctionLibraryExtension_0:FindDeepAncestor(v180, "Model");
                        local _ = l_l_FunctionLibraryExtension_0_DeepAncestor_0;
                        if v180:FindFirstChild("RealParent") then
                            l_l_FunctionLibraryExtension_0_DeepAncestor_0 = v180.RealParent.Value;
                        end;
                        if v180:GetAttribute("PassThrough", 2) then
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180:GetAttribute("PassThrough", 1) and l_l_FirstChild_0_Attribute_7 == nil then
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180:GetAttribute("Glass") then
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180.Name == "Terrain" then
                            if v157 == false and v183 == Enum.Material.Water then
                                v157 = true;
                                l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 * 0.15;
                                v158 = v181;
                                v151.IgnoreWater = true;
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                                return;
                            else
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                                v170:Disconnect();
                                if v165 then
                                    if v165:FindFirstChild("Trail") then
                                        wait(v165.Trail.Lifetime);
                                    end;
                                    v165:Destroy();
                                    return;
                                end;
                            end;
                        elseif l_l_FunctionLibraryExtension_0_DeepAncestor_0:FindFirstChild("Humanoid") then
                            local v203 = v180.CFrame:ToObjectSpace(CFrame.new(v181));
                            if l_l_FirstChild_0_Attribute_2 / l_l_l_FirstChild_0_Attribute_2_0 > 0.1 and l_l_FirstChild_0_Attribute_2 < 3300 then
                                l_ProjectileInflict_0:FireServer(v180, v203, v149, tick());
                            end;
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            v170:Disconnect();
                            if v165 then
                                if v165:FindFirstChild("Trail") then
                                    wait(v165.Trail.Lifetime);
                                end;
                                v165:Destroy();
                                return;
                            end;
                        elseif l_l_FunctionLibraryExtension_0_DeepAncestor_0.ClassName == "Model" and l_l_FunctionLibraryExtension_0_DeepAncestor_0.PrimaryPart ~= nil and l_l_FunctionLibraryExtension_0_DeepAncestor_0.PrimaryPart:GetAttribute("Health") then
                            local v204 = v180.CFrame:ToObjectSpace(CFrame.new(v181));
                            l_ProjectileInflict_0:FireServer(v180, v204, v149, tick());
                            if l_l_FunctionLibraryExtension_0_DeepAncestor_0.Parent.Name ~= "SleepingPlayers" and v182 then
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            end;
                            v170:Disconnect();
                            if v165 then
                                if v165:FindFirstChild("Trail") then
                                    wait(v165.Trail.Lifetime);
                                end;
                                v165:Destroy();
                                return;
                            end;
                        else
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            local v205, v206, v207 = l_FunctionLibraryExtension_0:Penetration(v180, v181, l_l_LookVector_0_0, l_l_FirstChild_0_Attribute_9);
                            l_l_FirstChild_0_Attribute_9 = v205;
                            if l_l_FirstChild_0_Attribute_9 > 0 then
                                l_VFX_0.Impact(unpack(v207));
                                local v208 = l_l_FirstChild_0_Attribute_9 / l_l_l_FirstChild_0_Attribute_9_0;
                                l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 * math.clamp(v208, 0.5, 1);
                                l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = v206;
                                v153[v194] = true;
                                v151.FilterDescendantsInstances = v152;
                                return;
                            else
                                v170:Disconnect();
                                if v165 then
                                    if v165:FindFirstChild("Trail") then
                                        wait(v165.Trail.Lifetime);
                                    end;
                                    v165:Destroy();
                                    return;
                                end;
                            end;
                        end;
                    elseif v159 > 2500 or tick() - v154 > 60 then
                        v170:Disconnect();
                        if v165 then
                            if v165:FindFirstChild("Trail") then
                                wait(v165.Trail.Lifetime);
                            end;
                            v165:Destroy();
                            return;
                        end;
                    else
                        l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = v181;
                        l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 - l_l_FirstChild_0_Attribute_1 * l_l_FirstChild_0_Attribute_2 ^ 2 * v173 ^ 2;
                        local v209 = Vector3.new(0, l_l_FirstChild_0_Attribute_0 * v174 ^ 2, 0);
                        l_l_LookVector_0_0 = (l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_l_LookVector_0_0 * 10000 - v209 - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1).Unit;
                        table.insert(v168, v173);
                        v173 = 0;
                    end;
                end;
            end;
            v170 = l_RunService_0.RenderStepped:Connect(v210);
        end;
        if l_l_FirstChild_0_Attribute_5 ~= nil then
            for _ = 1, l_l_FirstChild_0_Attribute_5 do
                coroutine.wrap(v211)();
            end;
        else
            coroutine.wrap(v211)();
        end;
        return v125 / 200, v126 / 200, v123, v121;
    else
        return;
    end;
end;
return v0;
        local v0 = {};
local l_VFX_0 = require(game.ReplicatedStorage.Modules:WaitForChild("VFX"));
local l_UniversalTables_0 = require(game.ReplicatedStorage.Modules:WaitForChild("UniversalTables"));
local l_FunctionLibraryExtension_0 = require(game.ReplicatedStorage.Modules:WaitForChild("FunctionLibraryExtension"));
local l_ProjectileInflict_0 = game.ReplicatedStorage.Remotes.ProjectileInflict;
local l_VisualProjectile_0 = game.ReplicatedStorage.Remotes.VisualProjectile;
local l_FireProjectile_0 = game.ReplicatedStorage.Remotes.FireProjectile;
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_1 = l_ReplicatedStorage_0:WaitForChild("Players");
local _ = l_ReplicatedStorage_0:WaitForChild("Remotes");
local _ = game.ReplicatedStorage:WaitForChild("Modules");
local l_RangedWeapons_0 = l_ReplicatedStorage_0:WaitForChild("RangedWeapons");
local _ = l_ReplicatedStorage_0:WaitForChild("SFX");
local l_VFX_1 = game.ReplicatedStorage:WaitForChild("VFX");
local l_Debris_0 = game:GetService("Debris");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v18 = l_Players_1:WaitForChild(l_LocalPlayer_0.Name);
local l_Temp_0 = game.ReplicatedStorage.Temp;
local _ = l_UniversalTables_0.UniversalTable.GameSettings.RootScanHeight;
local v21 = l_UniversalTables_0.ReturnTable("GlobalIgnoreListProjectile");
local _ = {
    "LeftFoot", 
    "LeftHand", 
    "LeftLowerArm", 
    "LeftLowerLeg", 
    "LeftUpperArm", 
    "LeftUpperLeg", 
    "LowerTorso", 
    "RightFoot", 
    "RightHand", 
    "RightLowerArm", 
    "RightLowerLeg", 
    "RightUpperArm", 
    "RightUpperLeg", 
    "RightUpperLeg", 
    "UpperTorso", 
    "Head", 
    "FaceHitBox", 
    "HeadTopHitBox"
};
local function _(v23) --[[ Line: 62 ]] --[[ Name: isPlayer ]]
    return (l_Players_0:FindFirstChild(v23.Name));
end;
local function _(v25, v26) --[[ Line: 68 ]] --[[ Name: getRayClosestPoint ]]
    local v27 = v25.Origin - v26;
    local l_Direction_0 = v25.Direction;
    return v26 + (v27 - v27:Dot(l_Direction_0) / l_Direction_0:Dot(l_Direction_0) * l_Direction_0);
end;
local _ = function(v30, v31, v32) --[[ Line: 77 ]] --[[ Name: getAimHeight ]]
    local _ = v30.CFrame.p;
    local l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0 = l_FunctionLibraryExtension_0:GetEstimatedCameraPosition(l_LocalPlayer_0);
    local v35 = Ray.new(l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0, (v32 - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0).Unit * 7500);
    local v36 = v35.Origin - v31;
    local l_Direction_1 = v35.Direction;
    return (v31 + (v36 - v36:Dot(l_Direction_1) / l_Direction_1:Dot(l_Direction_1) * l_Direction_1)).Y;
end;
local function _(v39, v40, v41, v42) --[[ Line: 88 ]] --[[ Name: intersection_point ]]
    local v43 = (v40.Z - v39.Z) / (v40.X - v39.X);
    local v44 = (v42.Z - v41.Z) / (v42.X - v41.X);
    local v45 = v39.Z - v43 * v39.X;
    local v46 = (v41.Z - v44 * v41.X - v45) / (v43 - v44);
    local v47 = v43 * v46 + v45;
    return (Vector3.new(v46, v39.Y, v47));
end;
local function _(v49) --[[ Line: 98 ]] --[[ Name: Encrypt ]]
    local v50 = "";
    for v51 = 1, v49:len() do
        v50 = v50 .. string.char(v49:sub(v51, v51):byte() - 5);
    end;
    return v50;
end;
local function v61(v53, v54) --[[ Line: 109 ]] --[[ Name: devideNumberSequence ]]
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local l_Keypoints_0 = v53.Keypoints;
    for v60 = 1, #l_Keypoints_0 do
        if v60 == 1 then
            v55 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 2 then
            v56 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 3 then
            v57 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 4 then
            v58 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        end;
    end;
    return (NumberSequence.new({
        v55, 
        v56, 
        v57, 
        v58
    }));
end;
local function v73(v62, v63, v64, v65, v66, v67) --[[ Line: 139 ]] --[[ Name: RotCamera ]]
    if v66 then
        local v68 = math.min(1.5 / math.max(v67, 0), 90);
        local v69 = 0;
        local v70 = tick();
        while true do
            local v71 = v68 * (1 * (tick() - v70) * 60);
            local v72 = v69 + v71;
            v69 = v72 > 90 and 90 or v72;
            if v62.CoordinateFrame.lookVector.Y <= 0.98 then
                v62.CoordinateFrame = v62.CoordinateFrame * CFrame.Angles(v63 / (90 / v71), v64 / (90 / v71), v65 / (90 / v71));
                if v69 ~= 90 then
                    v70 = tick();
                    game:GetService("RunService").Stepped:wait();
                else
                    break;
                end;
            else
                break;
            end;
        end;
    else
        v62.CoordinateFrame = v62.CoordinateFrame * CFrame.Angles(v63, v64, v65);
    end;
end;
RecoilCamera = function(v74, v75, v76, _, _) --[[ Line: 162 ]] --[[ Name: RecoilCamera ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v80 = v75 * 0.004 / 3;
    local v81 = v76 * 0.004 / 3;
    local v82 = 0;
    local v83 = 0;
    if v74 then
        v82 = v74.y.Value * v80 * 2;
        v83 = v74.x.Value * v81 * 2;
    end;
    coroutine.wrap(function() --[[ Line: 181 ]]
        v73(l_CurrentCamera_0, v82, v83, 0, true, 0.06);
    end)();
end;
v0.CreateBullet = function(_, v85, v86, v87, _, v89, v90, v91, v92) --[[ Line: 191 ]] --[[ Name: CreateBullet ]]
    local l_Character_0 = l_LocalPlayer_0.Character;
    local l_HumanoidRootPart_0 = l_Character_0.HumanoidRootPart;
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    if l_Character_0:FindFirstChild(v85.Name) then
        local v96 = nil;
        local v97 = nil;
        if v87.Item.Attachments:FindFirstChild("Front") then
            v96 = v87.Item.Attachments.Front:GetChildren()[1].Barrel;
            v97 = v86.Attachments.Front:GetChildren()[1].Barrel;
        else
            v96 = v87.Item.Barrel;
            v97 = v86.Barrel;
        end;
        local l_ItemRoot_0 = v86.ItemRoot;
        local l_ItemProperties_0 = v85.ItemProperties;
        local l_l_RangedWeapons_0_FirstChild_0 = l_RangedWeapons_0:FindFirstChild(v85.Name);
        local l_SpecialProperties_0 = l_ItemProperties_0:FindFirstChild("SpecialProperties");
        local l_Attribute_0 = v18.Status.GameplayVariables:GetAttribute("EquipId");
        local l_FirstChild_0 = l_ReplicatedStorage_0.AmmoTypes:FindFirstChild(v89);
        local v104 = l_SpecialProperties_0 and l_SpecialProperties_0:GetAttribute("TracerColor") or l_l_RangedWeapons_0_FirstChild_0:GetAttribute("ProjectileColor");
        local _ = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("BulletMaterial");
        local l_l_FirstChild_0_Attribute_0 = l_FirstChild_0:GetAttribute("ProjectileDrop");
        local l_l_l_RangedWeapons_0_FirstChild_0_Attribute_1 = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("MuzzleEffect");
        local l_l_FirstChild_0_Attribute_1 = l_FirstChild_0:GetAttribute("Drag");
        local l_l_FirstChild_0_Attribute_2 = l_FirstChild_0:GetAttribute("MuzzleVelocity");
        local l_l_l_FirstChild_0_Attribute_2_0 = l_l_FirstChild_0_Attribute_2;
        local l_l_FirstChild_0_Attribute_3 = l_FirstChild_0:GetAttribute("Tracer");
        local _ = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("RecoilRecoveryTimeMod");
        local l_l_FirstChild_0_Attribute_4 = l_FirstChild_0:GetAttribute("AccuracyDeviation");
        local l_l_FirstChild_0_Attribute_5 = l_FirstChild_0:GetAttribute("Pellets");
        local l_l_FirstChild_0_Attribute_6 = l_FirstChild_0:GetAttribute("Damage");
        local l_l_FirstChild_0_Attribute_7 = l_FirstChild_0:GetAttribute("Arrow");
        local _ = l_FirstChild_0:GetAttribute("ProjectileWidth");
        local l_l_FirstChild_0_Attribute_9 = l_FirstChild_0:GetAttribute("ArmorPen");
        local l_l_l_FirstChild_0_Attribute_9_0 = l_l_FirstChild_0_Attribute_9;
        local v120 = nil;
        local v121 = nil;
        if v91 and l_l_RangedWeapons_0_FirstChild_0:FindFirstChild("RecoilPattern") then
            v120 = #l_l_RangedWeapons_0_FirstChild_0.RecoilPattern:GetChildren();
            v121 = if v91 == 1 then {
                x = {
                    Value = l_l_RangedWeapons_0_FirstChild_0.RecoilPattern["1"].x.Value
                }, 
                y = {
                    Value = l_l_RangedWeapons_0_FirstChild_0.RecoilPattern["1"].y.Value
                }
            } else l_l_RangedWeapons_0_FirstChild_0.RecoilPattern:FindFirstChild((tostring(v91)));
        else
            v121 = {
                x = {
                    Value = math.random(-5, 5) * 0.01
                }, 
                y = {
                    Value = math.random(5, 10) * 0.01
                }
            };
        end;
        local v122 = v18.Status.GameplayVariables:GetAttribute("Stance") == "Crouching";
        local v123 = l_ItemProperties_0.Tool:GetAttribute("MuzzleDevice") or "Default";
        local v124 = l_FirstChild_0:GetAttribute("RecoilStrength") * (l_HumanoidRootPart_0:GetAttribute("Recoil") or 1);
        local v125 = v122 and v124 * 0.9 or v124;
        local v126 = v122 and v124 * 0.9 or v124;
        local l_Attachments_0 = v85:FindFirstChild("Attachments");
        if l_Attachments_0 then
            local l_l_Attachments_0_Children_0 = l_Attachments_0:GetChildren();
            for v129 = 1, #l_l_Attachments_0_Children_0 do
                local l_StringValue_0 = l_l_Attachments_0_Children_0[v129]:FindFirstChildOfClass("StringValue");
                if l_StringValue_0 and l_StringValue_0.ItemProperties:FindFirstChild("Attachment") and (not l_StringValue_0.ItemProperties:GetAttribute("Durability") or l_StringValue_0.ItemProperties:GetAttribute("Durability") > 0) then
                    local l_Attachment_0 = l_StringValue_0.ItemProperties.Attachment;
                    local l_l_Attachment_0_Attribute_0 = l_Attachment_0:GetAttribute("Recoil");
                    if l_l_Attachment_0_Attribute_0 then
                        v125 = v125 + l_l_Attachment_0_Attribute_0 * l_Attachment_0:GetAttribute("HRecoilMod");
                        v126 = v126 + l_l_Attachment_0_Attribute_0 * l_Attachment_0:GetAttribute("VRecoilMod");
                    end;
                    local l_l_Attachment_0_Attribute_1 = l_Attachment_0:GetAttribute("MuzzleDevice");
                    if l_l_Attachment_0_Attribute_1 then
                        v123 = l_l_Attachment_0_Attribute_1;
                        if v87.Item.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension") then
                            v96 = v87.Item.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension");
                            v97 = v86.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension");
                        end;
                    end;
                end;
            end;
        end;
        if v123 == "Suppressor" then
            if tick() - v90 < 0.8 then
                l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSoundSupressed, l_ItemRoot_0.FireSoundSupressed.TimeLength, l_Temp_0);
            else
                l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSoundSupressed, l_ItemRoot_0.FireSoundSupressed.TimeLength, l_Temp_0);
            end;
        elseif tick() - v90 < 0.8 then
            l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSound, l_ItemRoot_0.FireSound.TimeLength, l_Temp_0);
        else
            l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSound, l_ItemRoot_0.FireSound.TimeLength, l_Temp_0);
        end;
        if l_l_l_RangedWeapons_0_FirstChild_0_Attribute_1 == true then
            local v134 = l_SpecialProperties_0 and l_SpecialProperties_0:GetAttribute("MuzzleEffect");
            local l_Children_0 = ((v134 and l_VFX_1.MuzzleEffects.Override:FindFirstChild(v134) or l_VFX_1.MuzzleEffects):FindFirstChild(v123) or l_VFX_1.MuzzleEffects:FindFirstChild(v123)):GetChildren();
            local v136 = l_Children_0[math.random(1, #l_Children_0)];
            local l_Children_1 = v136.Particles:GetChildren();
            if v136:FindFirstChild("MuzzleLight") then
                local v138 = v136.MuzzleLight:Clone();
                v138.Range = math.clamp(v138.Range + math.random(-2, 2) / 2, 0, 50);
                v138.Enabled = true;
                l_Debris_0:AddItem(v138, 0.1);
                v138.Parent = v96;
            end;
            for v139 = 1, #l_Children_1 do
                if l_Children_1[v139].className == "ParticleEmitter" then
                    local v140 = l_Children_1[v139]:Clone();
                    local v141 = v140:GetAttribute("EmitCount") or 1;
                    local v142 = math.clamp(l_l_FirstChild_0_Attribute_6 / 45 / 2.4, 0, 0.6);
                    if l_l_FirstChild_0_Attribute_5 then
                        v142 = math.clamp(l_l_FirstChild_0_Attribute_6 * l_l_FirstChild_0_Attribute_5 / 45 / 2.4, 0, 0.6);
                    end;
                    local v143 = math.clamp(v142, 1, 10);
                    v140.Lifetime = NumberRange.new(v140.Lifetime.Min * v143, v140.Lifetime.Max * v143);
                    v140.Size = v61(v140.Size, v142);
                    v140.Parent = v96;
                    v140:Emit(v141);
                    l_Debris_0:AddItem(v140, v140.Lifetime.Max);
                end;
            end;
        end;
        local _ = l_HumanoidRootPart_0.CFrame.p;
        local l_LookVector_0 = v92.CFrame.LookVector;
        local v146 = math.clamp(l_l_FirstChild_0_Attribute_2 / 2400, 0.7, 1.2);
        local v147 = 0;
        local v148 = "";
        local v149 = 0;
        local v150 = false;
        local function v211() --[[ Line: 369 ]] --[[ Name: fireBullet ]]
            local v151 = RaycastParams.new();
            v151.FilterType = Enum.RaycastFilterType.Exclude;
            local v152 = {
                l_Character_0, 
                v87, 
                v21
            };
            local v153 = {};
            v151.FilterDescendantsInstances = v152;
            v151.IgnoreWater = false;
            v151.CollisionGroup = "WeaponRay";
            local v154 = tick();
            local l_l_LookVector_0_0 = l_LookVector_0;
            local l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = l_FunctionLibraryExtension_0:GetEstimatedCameraPosition(l_LocalPlayer_0);
            local v157 = false;
            local v158 = Vector3.new();
            local v159 = 0;
            local v160 = l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_LookVector_0 * 1000;
            if l_l_FirstChild_0_Attribute_4 then
                local v161 = 6.283185307179586 * math.random();
                local v162 = math.random(-l_l_FirstChild_0_Attribute_4, l_l_FirstChild_0_Attribute_4);
                local v163 = v162 * math.cos(v161);
                local v164 = v162 * math.sin(v161);
                l_l_LookVector_0_0 = (v160 + Vector3.new(v163, math.random(-l_l_FirstChild_0_Attribute_4, l_l_FirstChild_0_Attribute_4), v164) - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1).Unit;
            end;
            v147 = v147 + 1;
            if v147 == 1 then
                v149 = math.random(-100000, 100000);
                v148 = tostring(game.Players.LocalPlayer.UserId);
                coroutine.wrap(function() --[[ Line: 445 ]]
                    if not l_FireProjectile_0:InvokeServer(l_l_LookVector_0_0, v149, tick()) then
                        script.Parent.Binds.AdjustBullets:Fire(l_Attribute_0, 1);
                    end;
                end)();
            elseif v147 > 1 then
                l_VisualProjectile_0:FireServer(l_l_LookVector_0_0, v149);
            end;
            if not l_l_FirstChild_0_Attribute_5 or not v150 and v147 > math.floor(l_l_FirstChild_0_Attribute_5 * 0.2) then
                v150 = true;
            end;
            local v165 = nil;
            local v166 = nil;
            if l_l_FirstChild_0_Attribute_3 then
                v165 = l_VFX_1.MuzzleEffects.Tracer:Clone();
                v165.Name = v148;
                v165.Color = v104;
                l_Debris_0:AddItem(v165, 10);
                v165.Position = Vector3.new(0, -100, 0, 0);
                v165.Parent = game.Workspace.NoCollision.Effects;
                local _ = l_HumanoidRootPart_0.AssemblyLinearVelocity;
                v166 = v96.Position;
            end;
            local v168 = {};
            local _ = {};
            local v170 = nil;
            local _ = 60;
            local _ = 0.008333333333333333;
            local v173 = 0;
            local v174 = 0;
            local _ = function(_) --[[ Line: 499 ]] --[[ Name: Stop ]]
                v170:Disconnect();
                if v165 then
                    if v165:FindFirstChild("Trail") then
                        wait(v165.Trail.Lifetime);
                    end;
                    v165:Destroy();
                end;
            end;
            local function v210(v177) --[[ Line: 521 ]] --[[ Name: onStep ]]
                v173 = v173 + v177;
                if v173 > 0.008333333333333333 then
                    v174 = v174 + v173;
                    local v178 = l_l_FirstChild_0_Attribute_2 * v173;
                    local v179 = workspace:Raycast(l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1, l_l_LookVector_0_0 * v178, v151);
                    local v180 = nil;
                    local v181 = nil;
                    local v182 = nil;
                    local v183 = nil;
                    if v179 then
                        v180 = v179.Instance;
                        v181 = v179.Position;
                        v182 = v179.Normal;
                        v183 = v179.Material;
                    else
                        v181 = l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_l_LookVector_0_0 * v178;
                    end;
                    local l_Magnitude_0 = (l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 - v181).Magnitude;
                    v159 = v159 + l_Magnitude_0;
                    if v165 then
                        local l_Magnitude_1 = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                        local v186 = math.clamp(l_CurrentCamera_1.FieldOfView / 70, 0.38, 1.1);
                        if v159 < 200 then
                            local _ = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                            local v188 = math.clamp(l_Magnitude_1 / 200, 0.1, 2.1) * v146 * v186;
                            local _ = (v166 - v181).Magnitude;
                            local l_Unit_0 = (v181 - v166).Unit;
                            v165.Size = Vector3.new(v188, v188, v188);
                            local v191 = v166 + l_LookVector_0 * v159;
                            v165.CFrame = CFrame.new(v191, l_Unit_0);
                        else
                            local _ = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                            local v193 = math.clamp(l_Magnitude_1 / 200, 0.1, 2.1) * v146 * v186;
                            v165.Size = Vector3.new(v193, v193, v193);
                            v165.CFrame = CFrame.new(v181, l_l_LookVector_0_0);
                        end;
                    end;
                    local v194 = "nil";
                    if v180 then
                        local v195 = math.floor(v181.X);
                        local v196 = math.floor(v181.Y);
                        local v197 = math.floor(v181.Z);
                        local v198 = math.floor(v182.X);
                        local v199 = math.floor(v182.Y);
                        local v200 = math.floor(v182.Z);
                        v194 = tostring(v195) .. tostring(v196) .. tostring(v197) .. tostring(v198) .. tostring(v199) .. tostring(v200);
                        if v153[v194] then
                            v181 = v181 - v182 * 0.1;
                        end;
                    end;
                    if v180 and not v153[v194] then
                        table.insert(v168, v173);
                        local l_l_FunctionLibraryExtension_0_DeepAncestor_0 = l_FunctionLibraryExtension_0:FindDeepAncestor(v180, "Model");
                        local _ = l_l_FunctionLibraryExtension_0_DeepAncestor_0;
                        if v180:FindFirstChild("RealParent") then
                            l_l_FunctionLibraryExtension_0_DeepAncestor_0 = v180.RealParent.Value;
                        end;
                        if v180:GetAttribute("PassThrough", 2) then
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180:GetAttribute("PassThrough", 1) and l_l_FirstChild_0_Attribute_7 == nil then
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180:GetAttribute("Glass") then
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180.Name == "Terrain" then
                            if v157 == false and v183 == Enum.Material.Water then
                                v157 = true;
                                l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 * 0.15;
                                v158 = v181;
                                v151.IgnoreWater = true;
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                                return;
                            else
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                                v170:Disconnect();
                                if v165 then
                                    if v165:FindFirstChild("Trail") then
                                        wait(v165.Trail.Lifetime);
                                    end;
                                    v165:Destroy();
                                    return;
                                end;
                            end;
                        elseif l_l_FunctionLibraryExtension_0_DeepAncestor_0:FindFirstChild("Humanoid") then
                            local v203 = v180.CFrame:ToObjectSpace(CFrame.new(v181));
                            if l_l_FirstChild_0_Attribute_2 / l_l_l_FirstChild_0_Attribute_2_0 > 0.1 and l_l_FirstChild_0_Attribute_2 < 3300 then
                                l_ProjectileInflict_0:FireServer(v180, v203, v149, tick());
                            end;
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            v170:Disconnect();
                            if v165 then
                                if v165:FindFirstChild("Trail") then
                                    wait(v165.Trail.Lifetime);
                                end;
                                v165:Destroy();
                                return;
                            end;
                        elseif l_l_FunctionLibraryExtension_0_DeepAncestor_0.ClassName == "Model" and l_l_FunctionLibraryExtension_0_DeepAncestor_0.PrimaryPart ~= nil and l_l_FunctionLibraryExtension_0_DeepAncestor_0.PrimaryPart:GetAttribute("Health") then
                            local v204 = v180.CFrame:ToObjectSpace(CFrame.new(v181));
                            l_ProjectileInflict_0:FireServer(v180, v204, v149, tick());
                            if l_l_FunctionLibraryExtension_0_DeepAncestor_0.Parent.Name ~= "SleepingPlayers" and v182 then
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            end;
                            v170:Disconnect();
                            if v165 then
                                if v165:FindFirstChild("Trail") then
                                    wait(v165.Trail.Lifetime);
                                end;
                                v165:Destroy();
                                return;
                            end;
                        else
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            local v205, v206, v207 = l_FunctionLibraryExtension_0:Penetration(v180, v181, l_l_LookVector_0_0, l_l_FirstChild_0_Attribute_9);
                            l_l_FirstChild_0_Attribute_9 = v205;
                            if l_l_FirstChild_0_Attribute_9 > 0 then
                                l_VFX_0.Impact(unpack(v207));
                                local v208 = l_l_FirstChild_0_Attribute_9 / l_l_l_FirstChild_0_Attribute_9_0;
                                l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 * math.clamp(v208, 0.5, 1);
                                l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = v206;
                                v153[v194] = true;
                                v151.FilterDescendantsInstances = v152;
                                return;
                            else
                                v170:Disconnect();
                                if v165 then
                                    if v165:FindFirstChild("Trail") then
                                        wait(v165.Trail.Lifetime);
                                    end;
                                    v165:Destroy();
                                    return;
                                end;
                            end;
                        end;
                    elseif v159 > 2500 or tick() - v154 > 60 then
                        v170:Disconnect();
                        if v165 then
                            if v165:FindFirstChild("Trail") then
                                wait(v165.Trail.Lifetime);
                            end;
                            v165:Destroy();
                            return;
                        end;
                    else
                        l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = v181;
                        l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 - l_l_FirstChild_0_Attribute_1 * l_l_FirstChild_0_Attribute_2 ^ 2 * v173 ^ 2;
                        local v209 = Vector3.new(0, l_l_FirstChild_0_Attribute_0 * v174 ^ 2, 0);
                        l_l_LookVector_0_0 = (l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_l_LookVector_0_0 * 10000 - v209 - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1).Unit;
                        table.insert(v168, v173);
                        v173 = 0;
                    end;
                end;
            end;
            v170 = l_RunService_0.RenderStepped:Connect(v210);
        end;
        if l_l_FirstChild_0_Attribute_5 ~= nil then
            for _ = 1, l_l_FirstChild_0_Attribute_5 do
                coroutine.wrap(v211)();
            end;
        else
            coroutine.wrap(v211)();
        end;
        return v125 / 200, v126 / 200, v123, v121;
    else
        return;
    end;
end;
return v0;
          local v0 = {};
local l_VFX_0 = require(game.ReplicatedStorage.Modules:WaitForChild("VFX"));
local l_UniversalTables_0 = require(game.ReplicatedStorage.Modules:WaitForChild("UniversalTables"));
local l_FunctionLibraryExtension_0 = require(game.ReplicatedStorage.Modules:WaitForChild("FunctionLibraryExtension"));
local l_ProjectileInflict_0 = game.ReplicatedStorage.Remotes.ProjectileInflict;
local l_VisualProjectile_0 = game.ReplicatedStorage.Remotes.VisualProjectile;
local l_FireProjectile_0 = game.ReplicatedStorage.Remotes.FireProjectile;
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_1 = l_ReplicatedStorage_0:WaitForChild("Players");
local _ = l_ReplicatedStorage_0:WaitForChild("Remotes");
local _ = game.ReplicatedStorage:WaitForChild("Modules");
local l_RangedWeapons_0 = l_ReplicatedStorage_0:WaitForChild("RangedWeapons");
local _ = l_ReplicatedStorage_0:WaitForChild("SFX");
local l_VFX_1 = game.ReplicatedStorage:WaitForChild("VFX");
local l_Debris_0 = game:GetService("Debris");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v18 = l_Players_1:WaitForChild(l_LocalPlayer_0.Name);
local l_Temp_0 = game.ReplicatedStorage.Temp;
local _ = l_UniversalTables_0.UniversalTable.GameSettings.RootScanHeight;
local v21 = l_UniversalTables_0.ReturnTable("GlobalIgnoreListProjectile");
local _ = {
    "LeftFoot", 
    "LeftHand", 
    "LeftLowerArm", 
    "LeftLowerLeg", 
    "LeftUpperArm", 
    "LeftUpperLeg", 
    "LowerTorso", 
    "RightFoot", 
    "RightHand", 
    "RightLowerArm", 
    "RightLowerLeg", 
    "RightUpperArm", 
    "RightUpperLeg", 
    "RightUpperLeg", 
    "UpperTorso", 
    "Head", 
    "FaceHitBox", 
    "HeadTopHitBox"
};
local function _(v23) --[[ Line: 62 ]] --[[ Name: isPlayer ]]
    return (l_Players_0:FindFirstChild(v23.Name));
end;
local function _(v25, v26) --[[ Line: 68 ]] --[[ Name: getRayClosestPoint ]]
    local v27 = v25.Origin - v26;
    local l_Direction_0 = v25.Direction;
    return v26 + (v27 - v27:Dot(l_Direction_0) / l_Direction_0:Dot(l_Direction_0) * l_Direction_0);
end;
local _ = function(v30, v31, v32) --[[ Line: 77 ]] --[[ Name: getAimHeight ]]
    local _ = v30.CFrame.p;
    local l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0 = l_FunctionLibraryExtension_0:GetEstimatedCameraPosition(l_LocalPlayer_0);
    local v35 = Ray.new(l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0, (v32 - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0).Unit * 7500);
    local v36 = v35.Origin - v31;
    local l_Direction_1 = v35.Direction;
    return (v31 + (v36 - v36:Dot(l_Direction_1) / l_Direction_1:Dot(l_Direction_1) * l_Direction_1)).Y;
end;
local function _(v39, v40, v41, v42) --[[ Line: 88 ]] --[[ Name: intersection_point ]]
    local v43 = (v40.Z - v39.Z) / (v40.X - v39.X);
    local v44 = (v42.Z - v41.Z) / (v42.X - v41.X);
    local v45 = v39.Z - v43 * v39.X;
    local v46 = (v41.Z - v44 * v41.X - v45) / (v43 - v44);
    local v47 = v43 * v46 + v45;
    return (Vector3.new(v46, v39.Y, v47));
end;
local function _(v49) --[[ Line: 98 ]] --[[ Name: Encrypt ]]
    local v50 = "";
    for v51 = 1, v49:len() do
        v50 = v50 .. string.char(v49:sub(v51, v51):byte() - 5);
    end;
    return v50;
end;
local function v61(v53, v54) --[[ Line: 109 ]] --[[ Name: devideNumberSequence ]]
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local l_Keypoints_0 = v53.Keypoints;
    for v60 = 1, #l_Keypoints_0 do
        if v60 == 1 then
            v55 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 2 then
            v56 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 3 then
            v57 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 4 then
            v58 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        end;
    end;
    return (NumberSequence.new({
        v55, 
        v56, 
        v57, 
        v58
    }));
end;
local function v73(v62, v63, v64, v65, v66, v67) --[[ Line: 139 ]] --[[ Name: RotCamera ]]
    if v66 then
        local v68 = math.min(1.5 / math.max(v67, 0), 90);
        local v69 = 0;
        local v70 = tick();
        while true do
            local v71 = v68 * (1 * (tick() - v70) * 60);
            local v72 = v69 + v71;
            v69 = v72 > 90 and 90 or v72;
            if v62.CoordinateFrame.lookVector.Y <= 0.98 then
                v62.CoordinateFrame = v62.CoordinateFrame * CFrame.Angles(v63 / (90 / v71), v64 / (90 / v71), v65 / (90 / v71));
                if v69 ~= 90 then
                    v70 = tick();
                    game:GetService("RunService").Stepped:wait();
                else
                    break;
                end;
            else
                break;
            end;
        end;
    else
        v62.CoordinateFrame = v62.CoordinateFrame * CFrame.Angles(v63, v64, v65);
    end;
end;
RecoilCamera = function(v74, v75, v76, _, _) --[[ Line: 162 ]] --[[ Name: RecoilCamera ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v80 = v75 * 0.004 / 3;
    local v81 = v76 * 0.004 / 3;
    local v82 = 0;
    local v83 = 0;
    if v74 then
        v82 = v74.y.Value * v80 * 2;
        v83 = v74.x.Value * v81 * 2;
    end;
    coroutine.wrap(function() --[[ Line: 181 ]]
        v73(l_CurrentCamera_0, v82, v83, 0, true, 0.06);
    end)();
end;
v0.CreateBullet = function(_, v85, v86, v87, _, v89, v90, v91, v92) --[[ Line: 191 ]] --[[ Name: CreateBullet ]]
    local l_Character_0 = l_LocalPlayer_0.Character;
    local l_HumanoidRootPart_0 = l_Character_0.HumanoidRootPart;
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    if l_Character_0:FindFirstChild(v85.Name) then
        local v96 = nil;
        local v97 = nil;
        if v87.Item.Attachments:FindFirstChild("Front") then
            v96 = v87.Item.Attachments.Front:GetChildren()[1].Barrel;
            v97 = v86.Attachments.Front:GetChildren()[1].Barrel;
        else
            v96 = v87.Item.Barrel;
            v97 = v86.Barrel;
        end;
        local l_ItemRoot_0 = v86.ItemRoot;
        local l_ItemProperties_0 = v85.ItemProperties;
        local l_l_RangedWeapons_0_FirstChild_0 = l_RangedWeapons_0:FindFirstChild(v85.Name);
        local l_SpecialProperties_0 = l_ItemProperties_0:FindFirstChild("SpecialProperties");
        local l_Attribute_0 = v18.Status.GameplayVariables:GetAttribute("EquipId");
        local l_FirstChild_0 = l_ReplicatedStorage_0.AmmoTypes:FindFirstChild(v89);
        local v104 = l_SpecialProperties_0 and l_SpecialProperties_0:GetAttribute("TracerColor") or l_l_RangedWeapons_0_FirstChild_0:GetAttribute("ProjectileColor");
        local _ = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("BulletMaterial");
        local l_l_FirstChild_0_Attribute_0 = l_FirstChild_0:GetAttribute("ProjectileDrop");
        local l_l_l_RangedWeapons_0_FirstChild_0_Attribute_1 = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("MuzzleEffect");
        local l_l_FirstChild_0_Attribute_1 = l_FirstChild_0:GetAttribute("Drag");
        local l_l_FirstChild_0_Attribute_2 = l_FirstChild_0:GetAttribute("MuzzleVelocity");
        local l_l_l_FirstChild_0_Attribute_2_0 = l_l_FirstChild_0_Attribute_2;
        local l_l_FirstChild_0_Attribute_3 = l_FirstChild_0:GetAttribute("Tracer");
        local _ = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("RecoilRecoveryTimeMod");
        local l_l_FirstChild_0_Attribute_4 = l_FirstChild_0:GetAttribute("AccuracyDeviation");
        local l_l_FirstChild_0_Attribute_5 = l_FirstChild_0:GetAttribute("Pellets");
        local l_l_FirstChild_0_Attribute_6 = l_FirstChild_0:GetAttribute("Damage");
        local l_l_FirstChild_0_Attribute_7 = l_FirstChild_0:GetAttribute("Arrow");
        local _ = l_FirstChild_0:GetAttribute("ProjectileWidth");
        local l_l_FirstChild_0_Attribute_9 = l_FirstChild_0:GetAttribute("ArmorPen");
        local l_l_l_FirstChild_0_Attribute_9_0 = l_l_FirstChild_0_Attribute_9;
        local v120 = nil;
        local v121 = nil;
        if v91 and l_l_RangedWeapons_0_FirstChild_0:FindFirstChild("RecoilPattern") then
            v120 = #l_l_RangedWeapons_0_FirstChild_0.RecoilPattern:GetChildren();
            v121 = if v91 == 1 then {
                x = {
                    Value = l_l_RangedWeapons_0_FirstChild_0.RecoilPattern["1"].x.Value
                }, 
                y = {
                    Value = l_l_RangedWeapons_0_FirstChild_0.RecoilPattern["1"].y.Value
                }
            } else l_l_RangedWeapons_0_FirstChild_0.RecoilPattern:FindFirstChild((tostring(v91)));
        else
            v121 = {
                x = {
                    Value = math.random(-5, 5) * 0.01
                }, 
                y = {
                    Value = math.random(5, 10) * 0.01
                }
            };
        end;
        local v122 = v18.Status.GameplayVariables:GetAttribute("Stance") == "Crouching";
        local v123 = l_ItemProperties_0.Tool:GetAttribute("MuzzleDevice") or "Default";
        local v124 = l_FirstChild_0:GetAttribute("RecoilStrength") * (l_HumanoidRootPart_0:GetAttribute("Recoil") or 1);
        local v125 = v122 and v124 * 0.9 or v124;
        local v126 = v122 and v124 * 0.9 or v124;
        local l_Attachments_0 = v85:FindFirstChild("Attachments");
        if l_Attachments_0 then
            local l_l_Attachments_0_Children_0 = l_Attachments_0:GetChildren();
            for v129 = 1, #l_l_Attachments_0_Children_0 do
                local l_StringValue_0 = l_l_Attachments_0_Children_0[v129]:FindFirstChildOfClass("StringValue");
                if l_StringValue_0 and l_StringValue_0.ItemProperties:FindFirstChild("Attachment") and (not l_StringValue_0.ItemProperties:GetAttribute("Durability") or l_StringValue_0.ItemProperties:GetAttribute("Durability") > 0) then
                    local l_Attachment_0 = l_StringValue_0.ItemProperties.Attachment;
                    local l_l_Attachment_0_Attribute_0 = l_Attachment_0:GetAttribute("Recoil");
                    if l_l_Attachment_0_Attribute_0 then
                        v125 = v125 + l_l_Attachment_0_Attribute_0 * l_Attachment_0:GetAttribute("HRecoilMod");
                        v126 = v126 + l_l_Attachment_0_Attribute_0 * l_Attachment_0:GetAttribute("VRecoilMod");
                    end;
                    local l_l_Attachment_0_Attribute_1 = l_Attachment_0:GetAttribute("MuzzleDevice");
                    if l_l_Attachment_0_Attribute_1 then
                        v123 = l_l_Attachment_0_Attribute_1;
                        if v87.Item.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension") then
                            v96 = v87.Item.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension");
                            v97 = v86.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension");
                        end;
                    end;
                end;
            end;
        end;
        if v123 == "Suppressor" then
            if tick() - v90 < 0.8 then
                l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSoundSupressed, l_ItemRoot_0.FireSoundSupressed.TimeLength, l_Temp_0);
            else
                l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSoundSupressed, l_ItemRoot_0.FireSoundSupressed.TimeLength, l_Temp_0);
            end;
        elseif tick() - v90 < 0.8 then
            l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSound, l_ItemRoot_0.FireSound.TimeLength, l_Temp_0);
        else
            l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSound, l_ItemRoot_0.FireSound.TimeLength, l_Temp_0);
        end;
        if l_l_l_RangedWeapons_0_FirstChild_0_Attribute_1 == true then
            local v134 = l_SpecialProperties_0 and l_SpecialProperties_0:GetAttribute("MuzzleEffect");
            local l_Children_0 = ((v134 and l_VFX_1.MuzzleEffects.Override:FindFirstChild(v134) or l_VFX_1.MuzzleEffects):FindFirstChild(v123) or l_VFX_1.MuzzleEffects:FindFirstChild(v123)):GetChildren();
            local v136 = l_Children_0[math.random(1, #l_Children_0)];
            local l_Children_1 = v136.Particles:GetChildren();
            if v136:FindFirstChild("MuzzleLight") then
                local v138 = v136.MuzzleLight:Clone();
                v138.Range = math.clamp(v138.Range + math.random(-2, 2) / 2, 0, 50);
                v138.Enabled = true;
                l_Debris_0:AddItem(v138, 0.1);
                v138.Parent = v96;
            end;
            for v139 = 1, #l_Children_1 do
                if l_Children_1[v139].className == "ParticleEmitter" then
                    local v140 = l_Children_1[v139]:Clone();
                    local v141 = v140:GetAttribute("EmitCount") or 1;
                    local v142 = math.clamp(l_l_FirstChild_0_Attribute_6 / 45 / 2.4, 0, 0.6);
                    if l_l_FirstChild_0_Attribute_5 then
                        v142 = math.clamp(l_l_FirstChild_0_Attribute_6 * l_l_FirstChild_0_Attribute_5 / 45 / 2.4, 0, 0.6);
                    end;
                    local v143 = math.clamp(v142, 1, 10);
                    v140.Lifetime = NumberRange.new(v140.Lifetime.Min * v143, v140.Lifetime.Max * v143);
                    v140.Size = v61(v140.Size, v142);
                    v140.Parent = v96;
                    v140:Emit(v141);
                    l_Debris_0:AddItem(v140, v140.Lifetime.Max);
                end;
            end;
        end;
        local _ = l_HumanoidRootPart_0.CFrame.p;
        local l_LookVector_0 = v92.CFrame.LookVector;
        local v146 = math.clamp(l_l_FirstChild_0_Attribute_2 / 2400, 0.7, 1.2);
        local v147 = 0;
        local v148 = "";
        local v149 = 0;
        local v150 = false;
        local function v211() --[[ Line: 369 ]] --[[ Name: fireBullet ]]
            local v151 = RaycastParams.new();
            v151.FilterType = Enum.RaycastFilterType.Exclude;
            local v152 = {
                l_Character_0, 
                v87, 
                v21
            };
            local v153 = {};
            v151.FilterDescendantsInstances = v152;
            v151.IgnoreWater = false;
            v151.CollisionGroup = "WeaponRay";
            local v154 = tick();
            local l_l_LookVector_0_0 = l_LookVector_0;
            local l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = l_FunctionLibraryExtension_0:GetEstimatedCameraPosition(l_LocalPlayer_0);
            local v157 = false;
            local v158 = Vector3.new();
            local v159 = 0;
            local v160 = l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_LookVector_0 * 1000;
            if l_l_FirstChild_0_Attribute_4 then
                local v161 = 6.283185307179586 * math.random();
                local v162 = math.random(-l_l_FirstChild_0_Attribute_4, l_l_FirstChild_0_Attribute_4);
                local v163 = v162 * math.cos(v161);
                local v164 = v162 * math.sin(v161);
                l_l_LookVector_0_0 = (v160 + Vector3.new(v163, math.random(-l_l_FirstChild_0_Attribute_4, l_l_FirstChild_0_Attribute_4), v164) - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1).Unit;
            end;
            v147 = v147 + 1;
            if v147 == 1 then
                v149 = math.random(-100000, 100000);
                v148 = tostring(game.Players.LocalPlayer.UserId);
                coroutine.wrap(function() --[[ Line: 445 ]]
                    if not l_FireProjectile_0:InvokeServer(l_l_LookVector_0_0, v149, tick()) then
                        script.Parent.Binds.AdjustBullets:Fire(l_Attribute_0, 1);
                    end;
                end)();
            elseif v147 > 1 then
                l_VisualProjectile_0:FireServer(l_l_LookVector_0_0, v149);
            end;
            if not l_l_FirstChild_0_Attribute_5 or not v150 and v147 > math.floor(l_l_FirstChild_0_Attribute_5 * 0.2) then
                v150 = true;
            end;
            local v165 = nil;
            local v166 = nil;
            if l_l_FirstChild_0_Attribute_3 then
                v165 = l_VFX_1.MuzzleEffects.Tracer:Clone();
                v165.Name = v148;
                v165.Color = v104;
                l_Debris_0:AddItem(v165, 10);
                v165.Position = Vector3.new(0, -100, 0, 0);
                v165.Parent = game.Workspace.NoCollision.Effects;
                local _ = l_HumanoidRootPart_0.AssemblyLinearVelocity;
                v166 = v96.Position;
            end;
            local v168 = {};
            local _ = {};
            local v170 = nil;
            local _ = 60;
            local _ = 0.008333333333333333;
            local v173 = 0;
            local v174 = 0;
            local _ = function(_) --[[ Line: 499 ]] --[[ Name: Stop ]]
                v170:Disconnect();
                if v165 then
                    if v165:FindFirstChild("Trail") then
                        wait(v165.Trail.Lifetime);
                    end;
                    v165:Destroy();
                end;
            end;
            local function v210(v177) --[[ Line: 521 ]] --[[ Name: onStep ]]
                v173 = v173 + v177;
                if v173 > 0.008333333333333333 then
                    v174 = v174 + v173;
                    local v178 = l_l_FirstChild_0_Attribute_2 * v173;
                    local v179 = workspace:Raycast(l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1, l_l_LookVector_0_0 * v178, v151);
                    local v180 = nil;
                    local v181 = nil;
                    local v182 = nil;
                    local v183 = nil;
                    if v179 then
                        v180 = v179.Instance;
                        v181 = v179.Position;
                        v182 = v179.Normal;
                        v183 = v179.Material;
                    else
                        v181 = l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_l_LookVector_0_0 * v178;
                    end;
                    local l_Magnitude_0 = (l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 - v181).Magnitude;
                    v159 = v159 + l_Magnitude_0;
                    if v165 then
                        local l_Magnitude_1 = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                        local v186 = math.clamp(l_CurrentCamera_1.FieldOfView / 70, 0.38, 1.1);
                        if v159 < 200 then
                            local _ = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                            local v188 = math.clamp(l_Magnitude_1 / 200, 0.1, 2.1) * v146 * v186;
                            local _ = (v166 - v181).Magnitude;
                            local l_Unit_0 = (v181 - v166).Unit;
                            v165.Size = Vector3.new(v188, v188, v188);
                            local v191 = v166 + l_LookVector_0 * v159;
                            v165.CFrame = CFrame.new(v191, l_Unit_0);
                        else
                            local _ = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                            local v193 = math.clamp(l_Magnitude_1 / 200, 0.1, 2.1) * v146 * v186;
                            v165.Size = Vector3.new(v193, v193, v193);
                            v165.CFrame = CFrame.new(v181, l_l_LookVector_0_0);
                        end;
                    end;
                    local v194 = "nil";
                    if v180 then
                        local v195 = math.floor(v181.X);
                        local v196 = math.floor(v181.Y);
                        local v197 = math.floor(v181.Z);
                        local v198 = math.floor(v182.X);
                        local v199 = math.floor(v182.Y);
                        local v200 = math.floor(v182.Z);
                        v194 = tostring(v195) .. tostring(v196) .. tostring(v197) .. tostring(v198) .. tostring(v199) .. tostring(v200);
                        if v153[v194] then
                            v181 = v181 - v182 * 0.1;
                        end;
                    end;
                    if v180 and not v153[v194] then
                        table.insert(v168, v173);
                        local l_l_FunctionLibraryExtension_0_DeepAncestor_0 = l_FunctionLibraryExtension_0:FindDeepAncestor(v180, "Model");
                        local _ = l_l_FunctionLibraryExtension_0_DeepAncestor_0;
                        if v180:FindFirstChild("RealParent") then
                            l_l_FunctionLibraryExtension_0_DeepAncestor_0 = v180.RealParent.Value;
                        end;
                        if v180:GetAttribute("PassThrough", 2) then
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180:GetAttribute("PassThrough", 1) and l_l_FirstChild_0_Attribute_7 == nil then
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180:GetAttribute("Glass") then
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180.Name == "Terrain" then
                            if v157 == false and v183 == Enum.Material.Water then
                                v157 = true;
                                l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 * 0.15;
                                v158 = v181;
                                v151.IgnoreWater = true;
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                                return;
                            else
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                                v170:Disconnect();
                                if v165 then
                                    if v165:FindFirstChild("Trail") then
                                        wait(v165.Trail.Lifetime);
                                    end;
                                    v165:Destroy();
                                    return;
                                end;
                            end;
                        elseif l_l_FunctionLibraryExtension_0_DeepAncestor_0:FindFirstChild("Humanoid") then
                            local v203 = v180.CFrame:ToObjectSpace(CFrame.new(v181));
                            if l_l_FirstChild_0_Attribute_2 / l_l_l_FirstChild_0_Attribute_2_0 > 0.1 and l_l_FirstChild_0_Attribute_2 < 3300 then
                                l_ProjectileInflict_0:FireServer(v180, v203, v149, tick());
                            end;
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            v170:Disconnect();
                            if v165 then
                                if v165:FindFirstChild("Trail") then
                                    wait(v165.Trail.Lifetime);
                                end;
                                v165:Destroy();
                                return;
                            end;
                        elseif l_l_FunctionLibraryExtension_0_DeepAncestor_0.ClassName == "Model" and l_l_FunctionLibraryExtension_0_DeepAncestor_0.PrimaryPart ~= nil and l_l_FunctionLibraryExtension_0_DeepAncestor_0.PrimaryPart:GetAttribute("Health") then
                            local v204 = v180.CFrame:ToObjectSpace(CFrame.new(v181));
                            l_ProjectileInflict_0:FireServer(v180, v204, v149, tick());
                            if l_l_FunctionLibraryExtension_0_DeepAncestor_0.Parent.Name ~= "SleepingPlayers" and v182 then
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            end;
                            v170:Disconnect();
                            if v165 then
                                if v165:FindFirstChild("Trail") then
                                    wait(v165.Trail.Lifetime);
                                end;
                                v165:Destroy();
                                return;
                            end;
                        else
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            local v205, v206, v207 = l_FunctionLibraryExtension_0:Penetration(v180, v181, l_l_LookVector_0_0, l_l_FirstChild_0_Attribute_9);
                            l_l_FirstChild_0_Attribute_9 = v205;
                            if l_l_FirstChild_0_Attribute_9 > 0 then
                                l_VFX_0.Impact(unpack(v207));
                                local v208 = l_l_FirstChild_0_Attribute_9 / l_l_l_FirstChild_0_Attribute_9_0;
                                l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 * math.clamp(v208, 0.5, 1);
                                l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = v206;
                                v153[v194] = true;
                                v151.FilterDescendantsInstances = v152;
                                return;
                            else
                                v170:Disconnect();
                                if v165 then
                                    if v165:FindFirstChild("Trail") then
                                        wait(v165.Trail.Lifetime);
                                    end;
                                    v165:Destroy();
                                    return;
                                end;
                            end;
                        end;
                    elseif v159 > 2500 or tick() - v154 > 60 then
                        v170:Disconnect();
                        if v165 then
                            if v165:FindFirstChild("Trail") then
                                wait(v165.Trail.Lifetime);
                            end;
                            v165:Destroy();
                            return;
                        end;
                    else
                        l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = v181;
                        l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 - l_l_FirstChild_0_Attribute_1 * l_l_FirstChild_0_Attribute_2 ^ 2 * v173 ^ 2;
                        local v209 = Vector3.new(0, l_l_FirstChild_0_Attribute_0 * v174 ^ 2, 0);
                        l_l_LookVector_0_0 = (l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_l_LookVector_0_0 * 10000 - v209 - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1).Unit;
                        table.insert(v168, v173);
                        v173 = 0;
                    end;
                end;
            end;
            v170 = l_RunService_0.RenderStepped:Connect(v210);
        end;
        if l_l_FirstChild_0_Attribute_5 ~= nil then
            for _ = 1, l_l_FirstChild_0_Attribute_5 do
                coroutine.wrap(v211)();
            end;
        else
            coroutine.wrap(v211)();
        end;
        return v125 / 200, v126 / 200, v123, v121;
    else
        return;
    end;
end;
return v0;
            local v0 = {};
local l_VFX_0 = require(game.ReplicatedStorage.Modules:WaitForChild("VFX"));
local l_UniversalTables_0 = require(game.ReplicatedStorage.Modules:WaitForChild("UniversalTables"));
local l_FunctionLibraryExtension_0 = require(game.ReplicatedStorage.Modules:WaitForChild("FunctionLibraryExtension"));
local l_ProjectileInflict_0 = game.ReplicatedStorage.Remotes.ProjectileInflict;
local l_VisualProjectile_0 = game.ReplicatedStorage.Remotes.VisualProjectile;
local l_FireProjectile_0 = game.ReplicatedStorage.Remotes.FireProjectile;
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_1 = l_ReplicatedStorage_0:WaitForChild("Players");
local _ = l_ReplicatedStorage_0:WaitForChild("Remotes");
local _ = game.ReplicatedStorage:WaitForChild("Modules");
local l_RangedWeapons_0 = l_ReplicatedStorage_0:WaitForChild("RangedWeapons");
local _ = l_ReplicatedStorage_0:WaitForChild("SFX");
local l_VFX_1 = game.ReplicatedStorage:WaitForChild("VFX");
local l_Debris_0 = game:GetService("Debris");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v18 = l_Players_1:WaitForChild(l_LocalPlayer_0.Name);
local l_Temp_0 = game.ReplicatedStorage.Temp;
local _ = l_UniversalTables_0.UniversalTable.GameSettings.RootScanHeight;
local v21 = l_UniversalTables_0.ReturnTable("GlobalIgnoreListProjectile");
local _ = {
    "LeftFoot", 
    "LeftHand", 
    "LeftLowerArm", 
    "LeftLowerLeg", 
    "LeftUpperArm", 
    "LeftUpperLeg", 
    "LowerTorso", 
    "RightFoot", 
    "RightHand", 
    "RightLowerArm", 
    "RightLowerLeg", 
    "RightUpperArm", 
    "RightUpperLeg", 
    "RightUpperLeg", 
    "UpperTorso", 
    "Head", 
    "FaceHitBox", 
    "HeadTopHitBox"
};
local function _(v23) --[[ Line: 62 ]] --[[ Name: isPlayer ]]
    return (l_Players_0:FindFirstChild(v23.Name));
end;
local function _(v25, v26) --[[ Line: 68 ]] --[[ Name: getRayClosestPoint ]]
    local v27 = v25.Origin - v26;
    local l_Direction_0 = v25.Direction;
    return v26 + (v27 - v27:Dot(l_Direction_0) / l_Direction_0:Dot(l_Direction_0) * l_Direction_0);
end;
local _ = function(v30, v31, v32) --[[ Line: 77 ]] --[[ Name: getAimHeight ]]
    local _ = v30.CFrame.p;
    local l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0 = l_FunctionLibraryExtension_0:GetEstimatedCameraPosition(l_LocalPlayer_0);
    local v35 = Ray.new(l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0, (v32 - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0).Unit * 7500);
    local v36 = v35.Origin - v31;
    local l_Direction_1 = v35.Direction;
    return (v31 + (v36 - v36:Dot(l_Direction_1) / l_Direction_1:Dot(l_Direction_1) * l_Direction_1)).Y;
end;
local function _(v39, v40, v41, v42) --[[ Line: 88 ]] --[[ Name: intersection_point ]]
    local v43 = (v40.Z - v39.Z) / (v40.X - v39.X);
    local v44 = (v42.Z - v41.Z) / (v42.X - v41.X);
    local v45 = v39.Z - v43 * v39.X;
    local v46 = (v41.Z - v44 * v41.X - v45) / (v43 - v44);
    local v47 = v43 * v46 + v45;
    return (Vector3.new(v46, v39.Y, v47));
end;
local function _(v49) --[[ Line: 98 ]] --[[ Name: Encrypt ]]
    local v50 = "";
    for v51 = 1, v49:len() do
        v50 = v50 .. string.char(v49:sub(v51, v51):byte() - 5);
    end;
    return v50;
end;
local function v61(v53, v54) --[[ Line: 109 ]] --[[ Name: devideNumberSequence ]]
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local l_Keypoints_0 = v53.Keypoints;
    for v60 = 1, #l_Keypoints_0 do
        if v60 == 1 then
            v55 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 2 then
            v56 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 3 then
            v57 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 4 then
            v58 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        end;
    end;
    return (NumberSequence.new({
        v55, 
        v56, 
        v57, 
        v58
    }));
end;
local function v73(v62, v63, v64, v65, v66, v67) --[[ Line: 139 ]] --[[ Name: RotCamera ]]
    if v66 then
        local v68 = math.min(1.5 / math.max(v67, 0), 90);
        local v69 = 0;
        local v70 = tick();
        while true do
            local v71 = v68 * (1 * (tick() - v70) * 60);
            local v72 = v69 + v71;
            v69 = v72 > 90 and 90 or v72;
            if v62.CoordinateFrame.lookVector.Y <= 0.98 then
                v62.CoordinateFrame = v62.CoordinateFrame * CFrame.Angles(v63 / (90 / v71), v64 / (90 / v71), v65 / (90 / v71));
                if v69 ~= 90 then
                    v70 = tick();
                    game:GetService("RunService").Stepped:wait();
                else
                    break;
                end;
            else
                break;
            end;
        end;
    else
        v62.CoordinateFrame = v62.CoordinateFrame * CFrame.Angles(v63, v64, v65);
    end;
end;
RecoilCamera = function(v74, v75, v76, _, _) --[[ Line: 162 ]] --[[ Name: RecoilCamera ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v80 = v75 * 0.004 / 3;
    local v81 = v76 * 0.004 / 3;
    local v82 = 0;
    local v83 = 0;
    if v74 then
        v82 = v74.y.Value * v80 * 2;
        v83 = v74.x.Value * v81 * 2;
    end;
    coroutine.wrap(function() --[[ Line: 181 ]]
        v73(l_CurrentCamera_0, v82, v83, 0, true, 0.06);
    end)();
end;
v0.CreateBullet = function(_, v85, v86, v87, _, v89, v90, v91, v92) --[[ Line: 191 ]] --[[ Name: CreateBullet ]]
    local l_Character_0 = l_LocalPlayer_0.Character;
    local l_HumanoidRootPart_0 = l_Character_0.HumanoidRootPart;
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    if l_Character_0:FindFirstChild(v85.Name) then
        local v96 = nil;
        local v97 = nil;
        if v87.Item.Attachments:FindFirstChild("Front") then
            v96 = v87.Item.Attachments.Front:GetChildren()[1].Barrel;
            v97 = v86.Attachments.Front:GetChildren()[1].Barrel;
        else
            v96 = v87.Item.Barrel;
            v97 = v86.Barrel;
        end;
        local l_ItemRoot_0 = v86.ItemRoot;
        local l_ItemProperties_0 = v85.ItemProperties;
        local l_l_RangedWeapons_0_FirstChild_0 = l_RangedWeapons_0:FindFirstChild(v85.Name);
        local l_SpecialProperties_0 = l_ItemProperties_0:FindFirstChild("SpecialProperties");
        local l_Attribute_0 = v18.Status.GameplayVariables:GetAttribute("EquipId");
        local l_FirstChild_0 = l_ReplicatedStorage_0.AmmoTypes:FindFirstChild(v89);
        local v104 = l_SpecialProperties_0 and l_SpecialProperties_0:GetAttribute("TracerColor") or l_l_RangedWeapons_0_FirstChild_0:GetAttribute("ProjectileColor");
        local _ = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("BulletMaterial");
        local l_l_FirstChild_0_Attribute_0 = l_FirstChild_0:GetAttribute("ProjectileDrop");
        local l_l_l_RangedWeapons_0_FirstChild_0_Attribute_1 = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("MuzzleEffect");
        local l_l_FirstChild_0_Attribute_1 = l_FirstChild_0:GetAttribute("Drag");
        local l_l_FirstChild_0_Attribute_2 = l_FirstChild_0:GetAttribute("MuzzleVelocity");
        local l_l_l_FirstChild_0_Attribute_2_0 = l_l_FirstChild_0_Attribute_2;
        local l_l_FirstChild_0_Attribute_3 = l_FirstChild_0:GetAttribute("Tracer");
        local _ = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("RecoilRecoveryTimeMod");
        local l_l_FirstChild_0_Attribute_4 = l_FirstChild_0:GetAttribute("AccuracyDeviation");
        local l_l_FirstChild_0_Attribute_5 = l_FirstChild_0:GetAttribute("Pellets");
        local l_l_FirstChild_0_Attribute_6 = l_FirstChild_0:GetAttribute("Damage");
        local l_l_FirstChild_0_Attribute_7 = l_FirstChild_0:GetAttribute("Arrow");
        local _ = l_FirstChild_0:GetAttribute("ProjectileWidth");
        local l_l_FirstChild_0_Attribute_9 = l_FirstChild_0:GetAttribute("ArmorPen");
        local l_l_l_FirstChild_0_Attribute_9_0 = l_l_FirstChild_0_Attribute_9;
        local v120 = nil;
        local v121 = nil;
        if v91 and l_l_RangedWeapons_0_FirstChild_0:FindFirstChild("RecoilPattern") then
            v120 = #l_l_RangedWeapons_0_FirstChild_0.RecoilPattern:GetChildren();
            v121 = if v91 == 1 then {
                x = {
                    Value = l_l_RangedWeapons_0_FirstChild_0.RecoilPattern["1"].x.Value
                }, 
                y = {
                    Value = l_l_RangedWeapons_0_FirstChild_0.RecoilPattern["1"].y.Value
                }
            } else l_l_RangedWeapons_0_FirstChild_0.RecoilPattern:FindFirstChild((tostring(v91)));
        else
            v121 = {
                x = {
                    Value = math.random(-5, 5) * 0.01
                }, 
                y = {
                    Value = math.random(5, 10) * 0.01
                }
            };
        end;
        local v122 = v18.Status.GameplayVariables:GetAttribute("Stance") == "Crouching";
        local v123 = l_ItemProperties_0.Tool:GetAttribute("MuzzleDevice") or "Default";
        local v124 = l_FirstChild_0:GetAttribute("RecoilStrength") * (l_HumanoidRootPart_0:GetAttribute("Recoil") or 1);
        local v125 = v122 and v124 * 0.9 or v124;
        local v126 = v122 and v124 * 0.9 or v124;
        local l_Attachments_0 = v85:FindFirstChild("Attachments");
        if l_Attachments_0 then
            local l_l_Attachments_0_Children_0 = l_Attachments_0:GetChildren();
            for v129 = 1, #l_l_Attachments_0_Children_0 do
                local l_StringValue_0 = l_l_Attachments_0_Children_0[v129]:FindFirstChildOfClass("StringValue");
                if l_StringValue_0 and l_StringValue_0.ItemProperties:FindFirstChild("Attachment") and (not l_StringValue_0.ItemProperties:GetAttribute("Durability") or l_StringValue_0.ItemProperties:GetAttribute("Durability") > 0) then
                    local l_Attachment_0 = l_StringValue_0.ItemProperties.Attachment;
                    local l_l_Attachment_0_Attribute_0 = l_Attachment_0:GetAttribute("Recoil");
                    if l_l_Attachment_0_Attribute_0 then
                        v125 = v125 + l_l_Attachment_0_Attribute_0 * l_Attachment_0:GetAttribute("HRecoilMod");
                        v126 = v126 + l_l_Attachment_0_Attribute_0 * l_Attachment_0:GetAttribute("VRecoilMod");
                    end;
                    local l_l_Attachment_0_Attribute_1 = l_Attachment_0:GetAttribute("MuzzleDevice");
                    if l_l_Attachment_0_Attribute_1 then
                        v123 = l_l_Attachment_0_Attribute_1;
                        if v87.Item.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension") then
                            v96 = v87.Item.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension");
                            v97 = v86.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension");
                        end;
                    end;
                end;
            end;
        end;
        if v123 == "Suppressor" then
            if tick() - v90 < 0.8 then
                l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSoundSupressed, l_ItemRoot_0.FireSoundSupressed.TimeLength, l_Temp_0);
            else
                l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSoundSupressed, l_ItemRoot_0.FireSoundSupressed.TimeLength, l_Temp_0);
            end;
        elseif tick() - v90 < 0.8 then
            l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSound, l_ItemRoot_0.FireSound.TimeLength, l_Temp_0);
        else
            l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSound, l_ItemRoot_0.FireSound.TimeLength, l_Temp_0);
        end;
        if l_l_l_RangedWeapons_0_FirstChild_0_Attribute_1 == true then
            local v134 = l_SpecialProperties_0 and l_SpecialProperties_0:GetAttribute("MuzzleEffect");
            local l_Children_0 = ((v134 and l_VFX_1.MuzzleEffects.Override:FindFirstChild(v134) or l_VFX_1.MuzzleEffects):FindFirstChild(v123) or l_VFX_1.MuzzleEffects:FindFirstChild(v123)):GetChildren();
            local v136 = l_Children_0[math.random(1, #l_Children_0)];
            local l_Children_1 = v136.Particles:GetChildren();
            if v136:FindFirstChild("MuzzleLight") then
                local v138 = v136.MuzzleLight:Clone();
                v138.Range = math.clamp(v138.Range + math.random(-2, 2) / 2, 0, 50);
                v138.Enabled = true;
                l_Debris_0:AddItem(v138, 0.1);
                v138.Parent = v96;
            end;
            for v139 = 1, #l_Children_1 do
                if l_Children_1[v139].className == "ParticleEmitter" then
                    local v140 = l_Children_1[v139]:Clone();
                    local v141 = v140:GetAttribute("EmitCount") or 1;
                    local v142 = math.clamp(l_l_FirstChild_0_Attribute_6 / 45 / 2.4, 0, 0.6);
                    if l_l_FirstChild_0_Attribute_5 then
                        v142 = math.clamp(l_l_FirstChild_0_Attribute_6 * l_l_FirstChild_0_Attribute_5 / 45 / 2.4, 0, 0.6);
                    end;
                    local v143 = math.clamp(v142, 1, 10);
                    v140.Lifetime = NumberRange.new(v140.Lifetime.Min * v143, v140.Lifetime.Max * v143);
                    v140.Size = v61(v140.Size, v142);
                    v140.Parent = v96;
                    v140:Emit(v141);
                    l_Debris_0:AddItem(v140, v140.Lifetime.Max);
                end;
            end;
        end;
        local _ = l_HumanoidRootPart_0.CFrame.p;
        local l_LookVector_0 = v92.CFrame.LookVector;
        local v146 = math.clamp(l_l_FirstChild_0_Attribute_2 / 2400, 0.7, 1.2);
        local v147 = 0;
        local v148 = "";
        local v149 = 0;
        local v150 = false;
        local function v211() --[[ Line: 369 ]] --[[ Name: fireBullet ]]
            local v151 = RaycastParams.new();
            v151.FilterType = Enum.RaycastFilterType.Exclude;
            local v152 = {
                l_Character_0, 
                v87, 
                v21
            };
            local v153 = {};
            v151.FilterDescendantsInstances = v152;
            v151.IgnoreWater = false;
            v151.CollisionGroup = "WeaponRay";
            local v154 = tick();
            local l_l_LookVector_0_0 = l_LookVector_0;
            local l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = l_FunctionLibraryExtension_0:GetEstimatedCameraPosition(l_LocalPlayer_0);
            local v157 = false;
            local v158 = Vector3.new();
            local v159 = 0;
            local v160 = l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_LookVector_0 * 1000;
            if l_l_FirstChild_0_Attribute_4 then
                local v161 = 6.283185307179586 * math.random();
                local v162 = math.random(-l_l_FirstChild_0_Attribute_4, l_l_FirstChild_0_Attribute_4);
                local v163 = v162 * math.cos(v161);
                local v164 = v162 * math.sin(v161);
                l_l_LookVector_0_0 = (v160 + Vector3.new(v163, math.random(-l_l_FirstChild_0_Attribute_4, l_l_FirstChild_0_Attribute_4), v164) - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1).Unit;
            end;
            v147 = v147 + 1;
            if v147 == 1 then
                v149 = math.random(-100000, 100000);
                v148 = tostring(game.Players.LocalPlayer.UserId);
                coroutine.wrap(function() --[[ Line: 445 ]]
                    if not l_FireProjectile_0:InvokeServer(l_l_LookVector_0_0, v149, tick()) then
                        script.Parent.Binds.AdjustBullets:Fire(l_Attribute_0, 1);
                    end;
                end)();
            elseif v147 > 1 then
                l_VisualProjectile_0:FireServer(l_l_LookVector_0_0, v149);
            end;
            if not l_l_FirstChild_0_Attribute_5 or not v150 and v147 > math.floor(l_l_FirstChild_0_Attribute_5 * 0.2) then
                v150 = true;
            end;
            local v165 = nil;
            local v166 = nil;
            if l_l_FirstChild_0_Attribute_3 then
                v165 = l_VFX_1.MuzzleEffects.Tracer:Clone();
                v165.Name = v148;
                v165.Color = v104;
                l_Debris_0:AddItem(v165, 10);
                v165.Position = Vector3.new(0, -100, 0, 0);
                v165.Parent = game.Workspace.NoCollision.Effects;
                local _ = l_HumanoidRootPart_0.AssemblyLinearVelocity;
                v166 = v96.Position;
            end;
            local v168 = {};
            local _ = {};
            local v170 = nil;
            local _ = 60;
            local _ = 0.008333333333333333;
            local v173 = 0;
            local v174 = 0;
            local _ = function(_) --[[ Line: 499 ]] --[[ Name: Stop ]]
                v170:Disconnect();
                if v165 then
                    if v165:FindFirstChild("Trail") then
                        wait(v165.Trail.Lifetime);
                    end;
                    v165:Destroy();
                end;
            end;
            local function v210(v177) --[[ Line: 521 ]] --[[ Name: onStep ]]
                v173 = v173 + v177;
                if v173 > 0.008333333333333333 then
                    v174 = v174 + v173;
                    local v178 = l_l_FirstChild_0_Attribute_2 * v173;
                    local v179 = workspace:Raycast(l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1, l_l_LookVector_0_0 * v178, v151);
                    local v180 = nil;
                    local v181 = nil;
                    local v182 = nil;
                    local v183 = nil;
                    if v179 then
                        v180 = v179.Instance;
                        v181 = v179.Position;
                        v182 = v179.Normal;
                        v183 = v179.Material;
                    else
                        v181 = l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_l_LookVector_0_0 * v178;
                    end;
                    local l_Magnitude_0 = (l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 - v181).Magnitude;
                    v159 = v159 + l_Magnitude_0;
                    if v165 then
                        local l_Magnitude_1 = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                        local v186 = math.clamp(l_CurrentCamera_1.FieldOfView / 70, 0.38, 1.1);
                        if v159 < 200 then
                            local _ = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                            local v188 = math.clamp(l_Magnitude_1 / 200, 0.1, 2.1) * v146 * v186;
                            local _ = (v166 - v181).Magnitude;
                            local l_Unit_0 = (v181 - v166).Unit;
                            v165.Size = Vector3.new(v188, v188, v188);
                            local v191 = v166 + l_LookVector_0 * v159;
                            v165.CFrame = CFrame.new(v191, l_Unit_0);
                        else
                            local _ = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                            local v193 = math.clamp(l_Magnitude_1 / 200, 0.1, 2.1) * v146 * v186;
                            v165.Size = Vector3.new(v193, v193, v193);
                            v165.CFrame = CFrame.new(v181, l_l_LookVector_0_0);
                        end;
                    end;
                    local v194 = "nil";
                    if v180 then
                        local v195 = math.floor(v181.X);
                        local v196 = math.floor(v181.Y);
                        local v197 = math.floor(v181.Z);
                        local v198 = math.floor(v182.X);
                        local v199 = math.floor(v182.Y);
                        local v200 = math.floor(v182.Z);
                        v194 = tostring(v195) .. tostring(v196) .. tostring(v197) .. tostring(v198) .. tostring(v199) .. tostring(v200);
                        if v153[v194] then
                            v181 = v181 - v182 * 0.1;
                        end;
                    end;
                    if v180 and not v153[v194] then
                        table.insert(v168, v173);
                        local l_l_FunctionLibraryExtension_0_DeepAncestor_0 = l_FunctionLibraryExtension_0:FindDeepAncestor(v180, "Model");
                        local _ = l_l_FunctionLibraryExtension_0_DeepAncestor_0;
                        if v180:FindFirstChild("RealParent") then
                            l_l_FunctionLibraryExtension_0_DeepAncestor_0 = v180.RealParent.Value;
                        end;
                        if v180:GetAttribute("PassThrough", 2) then
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180:GetAttribute("PassThrough", 1) and l_l_FirstChild_0_Attribute_7 == nil then
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180:GetAttribute("Glass") then
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180.Name == "Terrain" then
                            if v157 == false and v183 == Enum.Material.Water then
                                v157 = true;
                                l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 * 0.15;
                                v158 = v181;
                                v151.IgnoreWater = true;
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                                return;
                            else
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                                v170:Disconnect();
                                if v165 then
                                    if v165:FindFirstChild("Trail") then
                                        wait(v165.Trail.Lifetime);
                                    end;
                                    v165:Destroy();
                                    return;
                                end;
                            end;
                        elseif l_l_FunctionLibraryExtension_0_DeepAncestor_0:FindFirstChild("Humanoid") then
                            local v203 = v180.CFrame:ToObjectSpace(CFrame.new(v181));
                            if l_l_FirstChild_0_Attribute_2 / l_l_l_FirstChild_0_Attribute_2_0 > 0.1 and l_l_FirstChild_0_Attribute_2 < 3300 then
                                l_ProjectileInflict_0:FireServer(v180, v203, v149, tick());
                            end;
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            v170:Disconnect();
                            if v165 then
                                if v165:FindFirstChild("Trail") then
                                    wait(v165.Trail.Lifetime);
                                end;
                                v165:Destroy();
                                return;
                            end;
                        elseif l_l_FunctionLibraryExtension_0_DeepAncestor_0.ClassName == "Model" and l_l_FunctionLibraryExtension_0_DeepAncestor_0.PrimaryPart ~= nil and l_l_FunctionLibraryExtension_0_DeepAncestor_0.PrimaryPart:GetAttribute("Health") then
                            local v204 = v180.CFrame:ToObjectSpace(CFrame.new(v181));
                            l_ProjectileInflict_0:FireServer(v180, v204, v149, tick());
                            if l_l_FunctionLibraryExtension_0_DeepAncestor_0.Parent.Name ~= "SleepingPlayers" and v182 then
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            end;
                            v170:Disconnect();
                            if v165 then
                                if v165:FindFirstChild("Trail") then
                                    wait(v165.Trail.Lifetime);
                                end;
                                v165:Destroy();
                                return;
                            end;
                        else
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            local v205, v206, v207 = l_FunctionLibraryExtension_0:Penetration(v180, v181, l_l_LookVector_0_0, l_l_FirstChild_0_Attribute_9);
                            l_l_FirstChild_0_Attribute_9 = v205;
                            if l_l_FirstChild_0_Attribute_9 > 0 then
                                l_VFX_0.Impact(unpack(v207));
                                local v208 = l_l_FirstChild_0_Attribute_9 / l_l_l_FirstChild_0_Attribute_9_0;
                                l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 * math.clamp(v208, 0.5, 1);
                                l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = v206;
                                v153[v194] = true;
                                v151.FilterDescendantsInstances = v152;
                                return;
                            else
                                v170:Disconnect();
                                if v165 then
                                    if v165:FindFirstChild("Trail") then
                                        wait(v165.Trail.Lifetime);
                                    end;
                                    v165:Destroy();
                                    return;
                                end;
                            end;
                        end;
                    elseif v159 > 2500 or tick() - v154 > 60 then
                        v170:Disconnect();
                        if v165 then
                            if v165:FindFirstChild("Trail") then
                                wait(v165.Trail.Lifetime);
                            end;
                            v165:Destroy();
                            return;
                        end;
                    else
                        l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = v181;
                        l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 - l_l_FirstChild_0_Attribute_1 * l_l_FirstChild_0_Attribute_2 ^ 2 * v173 ^ 2;
                        local v209 = Vector3.new(0, l_l_FirstChild_0_Attribute_0 * v174 ^ 2, 0);
                        l_l_LookVector_0_0 = (l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_l_LookVector_0_0 * 10000 - v209 - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1).Unit;
                        table.insert(v168, v173);
                        v173 = 0;
                    end;
                end;
            end;
            v170 = l_RunService_0.RenderStepped:Connect(v210);
        end;
        if l_l_FirstChild_0_Attribute_5 ~= nil then
            for _ = 1, l_l_FirstChild_0_Attribute_5 do
                coroutine.wrap(v211)();
            end;
        else
            coroutine.wrap(v211)();
        end;
        return v125 / 200, v126 / 200, v123, v121;
    else
        return;
    end;
end;
return v0;
              local v0 = {};
local l_VFX_0 = require(game.ReplicatedStorage.Modules:WaitForChild("VFX"));
local l_UniversalTables_0 = require(game.ReplicatedStorage.Modules:WaitForChild("UniversalTables"));
local l_FunctionLibraryExtension_0 = require(game.ReplicatedStorage.Modules:WaitForChild("FunctionLibraryExtension"));
local l_ProjectileInflict_0 = game.ReplicatedStorage.Remotes.ProjectileInflict;
local l_VisualProjectile_0 = game.ReplicatedStorage.Remotes.VisualProjectile;
local l_FireProjectile_0 = game.ReplicatedStorage.Remotes.FireProjectile;
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_1 = l_ReplicatedStorage_0:WaitForChild("Players");
local _ = l_ReplicatedStorage_0:WaitForChild("Remotes");
local _ = game.ReplicatedStorage:WaitForChild("Modules");
local l_RangedWeapons_0 = l_ReplicatedStorage_0:WaitForChild("RangedWeapons");
local _ = l_ReplicatedStorage_0:WaitForChild("SFX");
local l_VFX_1 = game.ReplicatedStorage:WaitForChild("VFX");
local l_Debris_0 = game:GetService("Debris");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v18 = l_Players_1:WaitForChild(l_LocalPlayer_0.Name);
local l_Temp_0 = game.ReplicatedStorage.Temp;
local _ = l_UniversalTables_0.UniversalTable.GameSettings.RootScanHeight;
local v21 = l_UniversalTables_0.ReturnTable("GlobalIgnoreListProjectile");
local _ = {
    "LeftFoot", 
    "LeftHand", 
    "LeftLowerArm", 
    "LeftLowerLeg", 
    "LeftUpperArm", 
    "LeftUpperLeg", 
    "LowerTorso", 
    "RightFoot", 
    "RightHand", 
    "RightLowerArm", 
    "RightLowerLeg", 
    "RightUpperArm", 
    "RightUpperLeg", 
    "RightUpperLeg", 
    "UpperTorso", 
    "Head", 
    "FaceHitBox", 
    "HeadTopHitBox"
};
local function _(v23) --[[ Line: 62 ]] --[[ Name: isPlayer ]]
    return (l_Players_0:FindFirstChild(v23.Name));
end;
local function _(v25, v26) --[[ Line: 68 ]] --[[ Name: getRayClosestPoint ]]
    local v27 = v25.Origin - v26;
    local l_Direction_0 = v25.Direction;
    return v26 + (v27 - v27:Dot(l_Direction_0) / l_Direction_0:Dot(l_Direction_0) * l_Direction_0);
end;
local _ = function(v30, v31, v32) --[[ Line: 77 ]] --[[ Name: getAimHeight ]]
    local _ = v30.CFrame.p;
    local l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0 = l_FunctionLibraryExtension_0:GetEstimatedCameraPosition(l_LocalPlayer_0);
    local v35 = Ray.new(l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0, (v32 - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0).Unit * 7500);
    local v36 = v35.Origin - v31;
    local l_Direction_1 = v35.Direction;
    return (v31 + (v36 - v36:Dot(l_Direction_1) / l_Direction_1:Dot(l_Direction_1) * l_Direction_1)).Y;
end;
local function _(v39, v40, v41, v42) --[[ Line: 88 ]] --[[ Name: intersection_point ]]
    local v43 = (v40.Z - v39.Z) / (v40.X - v39.X);
    local v44 = (v42.Z - v41.Z) / (v42.X - v41.X);
    local v45 = v39.Z - v43 * v39.X;
    local v46 = (v41.Z - v44 * v41.X - v45) / (v43 - v44);
    local v47 = v43 * v46 + v45;
    return (Vector3.new(v46, v39.Y, v47));
end;
local function _(v49) --[[ Line: 98 ]] --[[ Name: Encrypt ]]
    local v50 = "";
    for v51 = 1, v49:len() do
        v50 = v50 .. string.char(v49:sub(v51, v51):byte() - 5);
    end;
    return v50;
end;
local function v61(v53, v54) --[[ Line: 109 ]] --[[ Name: devideNumberSequence ]]
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local l_Keypoints_0 = v53.Keypoints;
    for v60 = 1, #l_Keypoints_0 do
        if v60 == 1 then
            v55 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 2 then
            v56 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 3 then
            v57 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 4 then
            v58 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        end;
    end;
    return (NumberSequence.new({
        v55, 
        v56, 
        v57, 
        v58
    }));
end;
local function v73(v62, v63, v64, v65, v66, v67) --[[ Line: 139 ]] --[[ Name: RotCamera ]]
    if v66 then
        local v68 = math.min(1.5 / math.max(v67, 0), 90);
        local v69 = 0;
        local v70 = tick();
        while true do
            local v71 = v68 * (1 * (tick() - v70) * 60);
            local v72 = v69 + v71;
            v69 = v72 > 90 and 90 or v72;
            if v62.CoordinateFrame.lookVector.Y <= 0.98 then
                v62.CoordinateFrame = v62.CoordinateFrame * CFrame.Angles(v63 / (90 / v71), v64 / (90 / v71), v65 / (90 / v71));
                if v69 ~= 90 then
                    v70 = tick();
                    game:GetService("RunService").Stepped:wait();
                else
                    break;
                end;
            else
                break;
            end;
        end;
    else
        v62.CoordinateFrame = v62.CoordinateFrame * CFrame.Angles(v63, v64, v65);
    end;
end;
RecoilCamera = function(v74, v75, v76, _, _) --[[ Line: 162 ]] --[[ Name: RecoilCamera ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v80 = v75 * 0.004 / 3;
    local v81 = v76 * 0.004 / 3;
    local v82 = 0;
    local v83 = 0;
    if v74 then
        v82 = v74.y.Value * v80 * 2;
        v83 = v74.x.Value * v81 * 2;
    end;
    coroutine.wrap(function() --[[ Line: 181 ]]
        v73(l_CurrentCamera_0, v82, v83, 0, true, 0.06);
    end)();
end;
v0.CreateBullet = function(_, v85, v86, v87, _, v89, v90, v91, v92) --[[ Line: 191 ]] --[[ Name: CreateBullet ]]
    local l_Character_0 = l_LocalPlayer_0.Character;
    local l_HumanoidRootPart_0 = l_Character_0.HumanoidRootPart;
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    if l_Character_0:FindFirstChild(v85.Name) then
        local v96 = nil;
        local v97 = nil;
        if v87.Item.Attachments:FindFirstChild("Front") then
            v96 = v87.Item.Attachments.Front:GetChildren()[1].Barrel;
            v97 = v86.Attachments.Front:GetChildren()[1].Barrel;
        else
            v96 = v87.Item.Barrel;
            v97 = v86.Barrel;
        end;
        local l_ItemRoot_0 = v86.ItemRoot;
        local l_ItemProperties_0 = v85.ItemProperties;
        local l_l_RangedWeapons_0_FirstChild_0 = l_RangedWeapons_0:FindFirstChild(v85.Name);
        local l_SpecialProperties_0 = l_ItemProperties_0:FindFirstChild("SpecialProperties");
        local l_Attribute_0 = v18.Status.GameplayVariables:GetAttribute("EquipId");
        local l_FirstChild_0 = l_ReplicatedStorage_0.AmmoTypes:FindFirstChild(v89);
        local v104 = l_SpecialProperties_0 and l_SpecialProperties_0:GetAttribute("TracerColor") or l_l_RangedWeapons_0_FirstChild_0:GetAttribute("ProjectileColor");
        local _ = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("BulletMaterial");
        local l_l_FirstChild_0_Attribute_0 = l_FirstChild_0:GetAttribute("ProjectileDrop");
        local l_l_l_RangedWeapons_0_FirstChild_0_Attribute_1 = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("MuzzleEffect");
        local l_l_FirstChild_0_Attribute_1 = l_FirstChild_0:GetAttribute("Drag");
        local l_l_FirstChild_0_Attribute_2 = l_FirstChild_0:GetAttribute("MuzzleVelocity");
        local l_l_l_FirstChild_0_Attribute_2_0 = l_l_FirstChild_0_Attribute_2;
        local l_l_FirstChild_0_Attribute_3 = l_FirstChild_0:GetAttribute("Tracer");
        local _ = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("RecoilRecoveryTimeMod");
        local l_l_FirstChild_0_Attribute_4 = l_FirstChild_0:GetAttribute("AccuracyDeviation");
        local l_l_FirstChild_0_Attribute_5 = l_FirstChild_0:GetAttribute("Pellets");
        local l_l_FirstChild_0_Attribute_6 = l_FirstChild_0:GetAttribute("Damage");
        local l_l_FirstChild_0_Attribute_7 = l_FirstChild_0:GetAttribute("Arrow");
        local _ = l_FirstChild_0:GetAttribute("ProjectileWidth");
        local l_l_FirstChild_0_Attribute_9 = l_FirstChild_0:GetAttribute("ArmorPen");
        local l_l_l_FirstChild_0_Attribute_9_0 = l_l_FirstChild_0_Attribute_9;
        local v120 = nil;
        local v121 = nil;
        if v91 and l_l_RangedWeapons_0_FirstChild_0:FindFirstChild("RecoilPattern") then
            v120 = #l_l_RangedWeapons_0_FirstChild_0.RecoilPattern:GetChildren();
            v121 = if v91 == 1 then {
                x = {
                    Value = l_l_RangedWeapons_0_FirstChild_0.RecoilPattern["1"].x.Value
                }, 
                y = {
                    Value = l_l_RangedWeapons_0_FirstChild_0.RecoilPattern["1"].y.Value
                }
            } else l_l_RangedWeapons_0_FirstChild_0.RecoilPattern:FindFirstChild((tostring(v91)));
        else
            v121 = {
                x = {
                    Value = math.random(-5, 5) * 0.01
                }, 
                y = {
                    Value = math.random(5, 10) * 0.01
                }
            };
        end;
        local v122 = v18.Status.GameplayVariables:GetAttribute("Stance") == "Crouching";
        local v123 = l_ItemProperties_0.Tool:GetAttribute("MuzzleDevice") or "Default";
        local v124 = l_FirstChild_0:GetAttribute("RecoilStrength") * (l_HumanoidRootPart_0:GetAttribute("Recoil") or 1);
        local v125 = v122 and v124 * 0.9 or v124;
        local v126 = v122 and v124 * 0.9 or v124;
        local l_Attachments_0 = v85:FindFirstChild("Attachments");
        if l_Attachments_0 then
            local l_l_Attachments_0_Children_0 = l_Attachments_0:GetChildren();
            for v129 = 1, #l_l_Attachments_0_Children_0 do
                local l_StringValue_0 = l_l_Attachments_0_Children_0[v129]:FindFirstChildOfClass("StringValue");
                if l_StringValue_0 and l_StringValue_0.ItemProperties:FindFirstChild("Attachment") and (not l_StringValue_0.ItemProperties:GetAttribute("Durability") or l_StringValue_0.ItemProperties:GetAttribute("Durability") > 0) then
                    local l_Attachment_0 = l_StringValue_0.ItemProperties.Attachment;
                    local l_l_Attachment_0_Attribute_0 = l_Attachment_0:GetAttribute("Recoil");
                    if l_l_Attachment_0_Attribute_0 then
                        v125 = v125 + l_l_Attachment_0_Attribute_0 * l_Attachment_0:GetAttribute("HRecoilMod");
                        v126 = v126 + l_l_Attachment_0_Attribute_0 * l_Attachment_0:GetAttribute("VRecoilMod");
                    end;
                    local l_l_Attachment_0_Attribute_1 = l_Attachment_0:GetAttribute("MuzzleDevice");
                    if l_l_Attachment_0_Attribute_1 then
                        v123 = l_l_Attachment_0_Attribute_1;
                        if v87.Item.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension") then
                            v96 = v87.Item.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension");
                            v97 = v86.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension");
                        end;
                    end;
                end;
            end;
        end;
        if v123 == "Suppressor" then
            if tick() - v90 < 0.8 then
                l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSoundSupressed, l_ItemRoot_0.FireSoundSupressed.TimeLength, l_Temp_0);
            else
                l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSoundSupressed, l_ItemRoot_0.FireSoundSupressed.TimeLength, l_Temp_0);
            end;
        elseif tick() - v90 < 0.8 then
            l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSound, l_ItemRoot_0.FireSound.TimeLength, l_Temp_0);
        else
            l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSound, l_ItemRoot_0.FireSound.TimeLength, l_Temp_0);
        end;
        if l_l_l_RangedWeapons_0_FirstChild_0_Attribute_1 == true then
            local v134 = l_SpecialProperties_0 and l_SpecialProperties_0:GetAttribute("MuzzleEffect");
            local l_Children_0 = ((v134 and l_VFX_1.MuzzleEffects.Override:FindFirstChild(v134) or l_VFX_1.MuzzleEffects):FindFirstChild(v123) or l_VFX_1.MuzzleEffects:FindFirstChild(v123)):GetChildren();
            local v136 = l_Children_0[math.random(1, #l_Children_0)];
            local l_Children_1 = v136.Particles:GetChildren();
            if v136:FindFirstChild("MuzzleLight") then
                local v138 = v136.MuzzleLight:Clone();
                v138.Range = math.clamp(v138.Range + math.random(-2, 2) / 2, 0, 50);
                v138.Enabled = true;
                l_Debris_0:AddItem(v138, 0.1);
                v138.Parent = v96;
            end;
            for v139 = 1, #l_Children_1 do
                if l_Children_1[v139].className == "ParticleEmitter" then
                    local v140 = l_Children_1[v139]:Clone();
                    local v141 = v140:GetAttribute("EmitCount") or 1;
                    local v142 = math.clamp(l_l_FirstChild_0_Attribute_6 / 45 / 2.4, 0, 0.6);
                    if l_l_FirstChild_0_Attribute_5 then
                        v142 = math.clamp(l_l_FirstChild_0_Attribute_6 * l_l_FirstChild_0_Attribute_5 / 45 / 2.4, 0, 0.6);
                    end;
                    local v143 = math.clamp(v142, 1, 10);
                    v140.Lifetime = NumberRange.new(v140.Lifetime.Min * v143, v140.Lifetime.Max * v143);
                    v140.Size = v61(v140.Size, v142);
                    v140.Parent = v96;
                    v140:Emit(v141);
                    l_Debris_0:AddItem(v140, v140.Lifetime.Max);
                end;
            end;
        end;
        local _ = l_HumanoidRootPart_0.CFrame.p;
        local l_LookVector_0 = v92.CFrame.LookVector;
        local v146 = math.clamp(l_l_FirstChild_0_Attribute_2 / 2400, 0.7, 1.2);
        local v147 = 0;
        local v148 = "";
        local v149 = 0;
        local v150 = false;
        local function v211() --[[ Line: 369 ]] --[[ Name: fireBullet ]]
            local v151 = RaycastParams.new();
            v151.FilterType = Enum.RaycastFilterType.Exclude;
            local v152 = {
                l_Character_0, 
                v87, 
                v21
            };
            local v153 = {};
            v151.FilterDescendantsInstances = v152;
            v151.IgnoreWater = false;
            v151.CollisionGroup = "WeaponRay";
            local v154 = tick();
            local l_l_LookVector_0_0 = l_LookVector_0;
            local l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = l_FunctionLibraryExtension_0:GetEstimatedCameraPosition(l_LocalPlayer_0);
            local v157 = false;
            local v158 = Vector3.new();
            local v159 = 0;
            local v160 = l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_LookVector_0 * 1000;
            if l_l_FirstChild_0_Attribute_4 then
                local v161 = 6.283185307179586 * math.random();
                local v162 = math.random(-l_l_FirstChild_0_Attribute_4, l_l_FirstChild_0_Attribute_4);
                local v163 = v162 * math.cos(v161);
                local v164 = v162 * math.sin(v161);
                l_l_LookVector_0_0 = (v160 + Vector3.new(v163, math.random(-l_l_FirstChild_0_Attribute_4, l_l_FirstChild_0_Attribute_4), v164) - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1).Unit;
            end;
            v147 = v147 + 1;
            if v147 == 1 then
                v149 = math.random(-100000, 100000);
                v148 = tostring(game.Players.LocalPlayer.UserId);
                coroutine.wrap(function() --[[ Line: 445 ]]
                    if not l_FireProjectile_0:InvokeServer(l_l_LookVector_0_0, v149, tick()) then
                        script.Parent.Binds.AdjustBullets:Fire(l_Attribute_0, 1);
                    end;
                end)();
            elseif v147 > 1 then
                l_VisualProjectile_0:FireServer(l_l_LookVector_0_0, v149);
            end;
            if not l_l_FirstChild_0_Attribute_5 or not v150 and v147 > math.floor(l_l_FirstChild_0_Attribute_5 * 0.2) then
                v150 = true;
            end;
            local v165 = nil;
            local v166 = nil;
            if l_l_FirstChild_0_Attribute_3 then
                v165 = l_VFX_1.MuzzleEffects.Tracer:Clone();
                v165.Name = v148;
                v165.Color = v104;
                l_Debris_0:AddItem(v165, 10);
                v165.Position = Vector3.new(0, -100, 0, 0);
                v165.Parent = game.Workspace.NoCollision.Effects;
                local _ = l_HumanoidRootPart_0.AssemblyLinearVelocity;
                v166 = v96.Position;
            end;
            local v168 = {};
            local _ = {};
            local v170 = nil;
            local _ = 60;
            local _ = 0.008333333333333333;
            local v173 = 0;
            local v174 = 0;
            local _ = function(_) --[[ Line: 499 ]] --[[ Name: Stop ]]
                v170:Disconnect();
                if v165 then
                    if v165:FindFirstChild("Trail") then
                        wait(v165.Trail.Lifetime);
                    end;
                    v165:Destroy();
                end;
            end;
            local function v210(v177) --[[ Line: 521 ]] --[[ Name: onStep ]]
                v173 = v173 + v177;
                if v173 > 0.008333333333333333 then
                    v174 = v174 + v173;
                    local v178 = l_l_FirstChild_0_Attribute_2 * v173;
                    local v179 = workspace:Raycast(l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1, l_l_LookVector_0_0 * v178, v151);
                    local v180 = nil;
                    local v181 = nil;
                    local v182 = nil;
                    local v183 = nil;
                    if v179 then
                        v180 = v179.Instance;
                        v181 = v179.Position;
                        v182 = v179.Normal;
                        v183 = v179.Material;
                    else
                        v181 = l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_l_LookVector_0_0 * v178;
                    end;
                    local l_Magnitude_0 = (l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 - v181).Magnitude;
                    v159 = v159 + l_Magnitude_0;
                    if v165 then
                        local l_Magnitude_1 = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                        local v186 = math.clamp(l_CurrentCamera_1.FieldOfView / 70, 0.38, 1.1);
                        if v159 < 200 then
                            local _ = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                            local v188 = math.clamp(l_Magnitude_1 / 200, 0.1, 2.1) * v146 * v186;
                            local _ = (v166 - v181).Magnitude;
                            local l_Unit_0 = (v181 - v166).Unit;
                            v165.Size = Vector3.new(v188, v188, v188);
                            local v191 = v166 + l_LookVector_0 * v159;
                            v165.CFrame = CFrame.new(v191, l_Unit_0);
                        else
                            local _ = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                            local v193 = math.clamp(l_Magnitude_1 / 200, 0.1, 2.1) * v146 * v186;
                            v165.Size = Vector3.new(v193, v193, v193);
                            v165.CFrame = CFrame.new(v181, l_l_LookVector_0_0);
                        end;
                    end;
                    local v194 = "nil";
                    if v180 then
                        local v195 = math.floor(v181.X);
                        local v196 = math.floor(v181.Y);
                        local v197 = math.floor(v181.Z);
                        local v198 = math.floor(v182.X);
                        local v199 = math.floor(v182.Y);
                        local v200 = math.floor(v182.Z);
                        v194 = tostring(v195) .. tostring(v196) .. tostring(v197) .. tostring(v198) .. tostring(v199) .. tostring(v200);
                        if v153[v194] then
                            v181 = v181 - v182 * 0.1;
                        end;
                    end;
                    if v180 and not v153[v194] then
                        table.insert(v168, v173);
                        local l_l_FunctionLibraryExtension_0_DeepAncestor_0 = l_FunctionLibraryExtension_0:FindDeepAncestor(v180, "Model");
                        local _ = l_l_FunctionLibraryExtension_0_DeepAncestor_0;
                        if v180:FindFirstChild("RealParent") then
                            l_l_FunctionLibraryExtension_0_DeepAncestor_0 = v180.RealParent.Value;
                        end;
                        if v180:GetAttribute("PassThrough", 2) then
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180:GetAttribute("PassThrough", 1) and l_l_FirstChild_0_Attribute_7 == nil then
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180:GetAttribute("Glass") then
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180.Name == "Terrain" then
                            if v157 == false and v183 == Enum.Material.Water then
                                v157 = true;
                                l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 * 0.15;
                                v158 = v181;
                                v151.IgnoreWater = true;
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                                return;
                            else
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                                v170:Disconnect();
                                if v165 then
                                    if v165:FindFirstChild("Trail") then
                                        wait(v165.Trail.Lifetime);
                                    end;
                                    v165:Destroy();
                                    return;
                                end;
                            end;
                        elseif l_l_FunctionLibraryExtension_0_DeepAncestor_0:FindFirstChild("Humanoid") then
                            local v203 = v180.CFrame:ToObjectSpace(CFrame.new(v181));
                            if l_l_FirstChild_0_Attribute_2 / l_l_l_FirstChild_0_Attribute_2_0 > 0.1 and l_l_FirstChild_0_Attribute_2 < 3300 then
                                l_ProjectileInflict_0:FireServer(v180, v203, v149, tick());
                            end;
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            v170:Disconnect();
                            if v165 then
                                if v165:FindFirstChild("Trail") then
                                    wait(v165.Trail.Lifetime);
                                end;
                                v165:Destroy();
                                return;
                            end;
                        elseif l_l_FunctionLibraryExtension_0_DeepAncestor_0.ClassName == "Model" and l_l_FunctionLibraryExtension_0_DeepAncestor_0.PrimaryPart ~= nil and l_l_FunctionLibraryExtension_0_DeepAncestor_0.PrimaryPart:GetAttribute("Health") then
                            local v204 = v180.CFrame:ToObjectSpace(CFrame.new(v181));
                            l_ProjectileInflict_0:FireServer(v180, v204, v149, tick());
                            if l_l_FunctionLibraryExtension_0_DeepAncestor_0.Parent.Name ~= "SleepingPlayers" and v182 then
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            end;
                            v170:Disconnect();
                            if v165 then
                                if v165:FindFirstChild("Trail") then
                                    wait(v165.Trail.Lifetime);
                                end;
                                v165:Destroy();
                                return;
                            end;
                        else
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            local v205, v206, v207 = l_FunctionLibraryExtension_0:Penetration(v180, v181, l_l_LookVector_0_0, l_l_FirstChild_0_Attribute_9);
                            l_l_FirstChild_0_Attribute_9 = v205;
                            if l_l_FirstChild_0_Attribute_9 > 0 then
                                l_VFX_0.Impact(unpack(v207));
                                local v208 = l_l_FirstChild_0_Attribute_9 / l_l_l_FirstChild_0_Attribute_9_0;
                                l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 * math.clamp(v208, 0.5, 1);
                                l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = v206;
                                v153[v194] = true;
                                v151.FilterDescendantsInstances = v152;
                                return;
                            else
                                v170:Disconnect();
                                if v165 then
                                    if v165:FindFirstChild("Trail") then
                                        wait(v165.Trail.Lifetime);
                                    end;
                                    v165:Destroy();
                                    return;
                                end;
                            end;
                        end;
                    elseif v159 > 2500 or tick() - v154 > 60 then
                        v170:Disconnect();
                        if v165 then
                            if v165:FindFirstChild("Trail") then
                                wait(v165.Trail.Lifetime);
                            end;
                            v165:Destroy();
                            return;
                        end;
                    else
                        l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = v181;
                        l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 - l_l_FirstChild_0_Attribute_1 * l_l_FirstChild_0_Attribute_2 ^ 2 * v173 ^ 2;
                        local v209 = Vector3.new(0, l_l_FirstChild_0_Attribute_0 * v174 ^ 2, 0);
                        l_l_LookVector_0_0 = (l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_l_LookVector_0_0 * 10000 - v209 - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1).Unit;
                        table.insert(v168, v173);
                        v173 = 0;
                    end;
                end;
            end;
            v170 = l_RunService_0.RenderStepped:Connect(v210);
        end;
        if l_l_FirstChild_0_Attribute_5 ~= nil then
            for _ = 1, l_l_FirstChild_0_Attribute_5 do
                coroutine.wrap(v211)();
            end;
        else
            coroutine.wrap(v211)();
        end;
        return v125 / 200, v126 / 200, v123, v121;
    else
        return;
    end;
end;
return v0;
                local v0 = {};
local l_VFX_0 = require(game.ReplicatedStorage.Modules:WaitForChild("VFX"));
local l_UniversalTables_0 = require(game.ReplicatedStorage.Modules:WaitForChild("UniversalTables"));
local l_FunctionLibraryExtension_0 = require(game.ReplicatedStorage.Modules:WaitForChild("FunctionLibraryExtension"));
local l_ProjectileInflict_0 = game.ReplicatedStorage.Remotes.ProjectileInflict;
local l_VisualProjectile_0 = game.ReplicatedStorage.Remotes.VisualProjectile;
local l_FireProjectile_0 = game.ReplicatedStorage.Remotes.FireProjectile;
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_1 = l_ReplicatedStorage_0:WaitForChild("Players");
local _ = l_ReplicatedStorage_0:WaitForChild("Remotes");
local _ = game.ReplicatedStorage:WaitForChild("Modules");
local l_RangedWeapons_0 = l_ReplicatedStorage_0:WaitForChild("RangedWeapons");
local _ = l_ReplicatedStorage_0:WaitForChild("SFX");
local l_VFX_1 = game.ReplicatedStorage:WaitForChild("VFX");
local l_Debris_0 = game:GetService("Debris");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v18 = l_Players_1:WaitForChild(l_LocalPlayer_0.Name);
local l_Temp_0 = game.ReplicatedStorage.Temp;
local _ = l_UniversalTables_0.UniversalTable.GameSettings.RootScanHeight;
local v21 = l_UniversalTables_0.ReturnTable("GlobalIgnoreListProjectile");
local _ = {
    "LeftFoot", 
    "LeftHand", 
    "LeftLowerArm", 
    "LeftLowerLeg", 
    "LeftUpperArm", 
    "LeftUpperLeg", 
    "LowerTorso", 
    "RightFoot", 
    "RightHand", 
    "RightLowerArm", 
    "RightLowerLeg", 
    "RightUpperArm", 
    "RightUpperLeg", 
    "RightUpperLeg", 
    "UpperTorso", 
    "Head", 
    "FaceHitBox", 
    "HeadTopHitBox"
};
local function _(v23) --[[ Line: 62 ]] --[[ Name: isPlayer ]]
    return (l_Players_0:FindFirstChild(v23.Name));
end;
local function _(v25, v26) --[[ Line: 68 ]] --[[ Name: getRayClosestPoint ]]
    local v27 = v25.Origin - v26;
    local l_Direction_0 = v25.Direction;
    return v26 + (v27 - v27:Dot(l_Direction_0) / l_Direction_0:Dot(l_Direction_0) * l_Direction_0);
end;
local _ = function(v30, v31, v32) --[[ Line: 77 ]] --[[ Name: getAimHeight ]]
    local _ = v30.CFrame.p;
    local l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0 = l_FunctionLibraryExtension_0:GetEstimatedCameraPosition(l_LocalPlayer_0);
    local v35 = Ray.new(l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0, (v32 - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0).Unit * 7500);
    local v36 = v35.Origin - v31;
    local l_Direction_1 = v35.Direction;
    return (v31 + (v36 - v36:Dot(l_Direction_1) / l_Direction_1:Dot(l_Direction_1) * l_Direction_1)).Y;
end;
local function _(v39, v40, v41, v42) --[[ Line: 88 ]] --[[ Name: intersection_point ]]
    local v43 = (v40.Z - v39.Z) / (v40.X - v39.X);
    local v44 = (v42.Z - v41.Z) / (v42.X - v41.X);
    local v45 = v39.Z - v43 * v39.X;
    local v46 = (v41.Z - v44 * v41.X - v45) / (v43 - v44);
    local v47 = v43 * v46 + v45;
    return (Vector3.new(v46, v39.Y, v47));
end;
local function _(v49) --[[ Line: 98 ]] --[[ Name: Encrypt ]]
    local v50 = "";
    for v51 = 1, v49:len() do
        v50 = v50 .. string.char(v49:sub(v51, v51):byte() - 5);
    end;
    return v50;
end;
local function v61(v53, v54) --[[ Line: 109 ]] --[[ Name: devideNumberSequence ]]
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local l_Keypoints_0 = v53.Keypoints;
    for v60 = 1, #l_Keypoints_0 do
        if v60 == 1 then
            v55 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 2 then
            v56 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 3 then
            v57 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 4 then
            v58 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        end;
    end;
    return (NumberSequence.new({
        v55, 
        v56, 
        v57, 
        v58
    }));
end;
local function v73(v62, v63, v64, v65, v66, v67) --[[ Line: 139 ]] --[[ Name: RotCamera ]]
    if v66 then
        local v68 = math.min(1.5 / math.max(v67, 0), 90);
        local v69 = 0;
        local v70 = tick();
        while true do
            local v71 = v68 * (1 * (tick() - v70) * 60);
            local v72 = v69 + v71;
            v69 = v72 > 90 and 90 or v72;
            if v62.CoordinateFrame.lookVector.Y <= 0.98 then
                v62.CoordinateFrame = v62.CoordinateFrame * CFrame.Angles(v63 / (90 / v71), v64 / (90 / v71), v65 / (90 / v71));
                if v69 ~= 90 then
                    v70 = tick();
                    game:GetService("RunService").Stepped:wait();
                else
                    break;
                end;
            else
                break;
            end;
        end;
    else
        v62.CoordinateFrame = v62.CoordinateFrame * CFrame.Angles(v63, v64, v65);
    end;
end;
RecoilCamera = function(v74, v75, v76, _, _) --[[ Line: 162 ]] --[[ Name: RecoilCamera ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v80 = v75 * 0.004 / 3;
    local v81 = v76 * 0.004 / 3;
    local v82 = 0;
    local v83 = 0;
    if v74 then
        v82 = v74.y.Value * v80 * 2;
        v83 = v74.x.Value * v81 * 2;
    end;
    coroutine.wrap(function() --[[ Line: 181 ]]
        v73(l_CurrentCamera_0, v82, v83, 0, true, 0.06);
    end)();
end;
v0.CreateBullet = function(_, v85, v86, v87, _, v89, v90, v91, v92) --[[ Line: 191 ]] --[[ Name: CreateBullet ]]
    local l_Character_0 = l_LocalPlayer_0.Character;
    local l_HumanoidRootPart_0 = l_Character_0.HumanoidRootPart;
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    if l_Character_0:FindFirstChild(v85.Name) then
        local v96 = nil;
        local v97 = nil;
        if v87.Item.Attachments:FindFirstChild("Front") then
            v96 = v87.Item.Attachments.Front:GetChildren()[1].Barrel;
            v97 = v86.Attachments.Front:GetChildren()[1].Barrel;
        else
            v96 = v87.Item.Barrel;
            v97 = v86.Barrel;
        end;
        local l_ItemRoot_0 = v86.ItemRoot;
        local l_ItemProperties_0 = v85.ItemProperties;
        local l_l_RangedWeapons_0_FirstChild_0 = l_RangedWeapons_0:FindFirstChild(v85.Name);
        local l_SpecialProperties_0 = l_ItemProperties_0:FindFirstChild("SpecialProperties");
        local l_Attribute_0 = v18.Status.GameplayVariables:GetAttribute("EquipId");
        local l_FirstChild_0 = l_ReplicatedStorage_0.AmmoTypes:FindFirstChild(v89);
        local v104 = l_SpecialProperties_0 and l_SpecialProperties_0:GetAttribute("TracerColor") or l_l_RangedWeapons_0_FirstChild_0:GetAttribute("ProjectileColor");
        local _ = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("BulletMaterial");
        local l_l_FirstChild_0_Attribute_0 = l_FirstChild_0:GetAttribute("ProjectileDrop");
        local l_l_l_RangedWeapons_0_FirstChild_0_Attribute_1 = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("MuzzleEffect");
        local l_l_FirstChild_0_Attribute_1 = l_FirstChild_0:GetAttribute("Drag");
        local l_l_FirstChild_0_Attribute_2 = l_FirstChild_0:GetAttribute("MuzzleVelocity");
        local l_l_l_FirstChild_0_Attribute_2_0 = l_l_FirstChild_0_Attribute_2;
        local l_l_FirstChild_0_Attribute_3 = l_FirstChild_0:GetAttribute("Tracer");
        local _ = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("RecoilRecoveryTimeMod");
        local l_l_FirstChild_0_Attribute_4 = l_FirstChild_0:GetAttribute("AccuracyDeviation");
        local l_l_FirstChild_0_Attribute_5 = l_FirstChild_0:GetAttribute("Pellets");
        local l_l_FirstChild_0_Attribute_6 = l_FirstChild_0:GetAttribute("Damage");
        local l_l_FirstChild_0_Attribute_7 = l_FirstChild_0:GetAttribute("Arrow");
        local _ = l_FirstChild_0:GetAttribute("ProjectileWidth");
        local l_l_FirstChild_0_Attribute_9 = l_FirstChild_0:GetAttribute("ArmorPen");
        local l_l_l_FirstChild_0_Attribute_9_0 = l_l_FirstChild_0_Attribute_9;
        local v120 = nil;
        local v121 = nil;
        if v91 and l_l_RangedWeapons_0_FirstChild_0:FindFirstChild("RecoilPattern") then
            v120 = #l_l_RangedWeapons_0_FirstChild_0.RecoilPattern:GetChildren();
            v121 = if v91 == 1 then {
                x = {
                    Value = l_l_RangedWeapons_0_FirstChild_0.RecoilPattern["1"].x.Value
                }, 
                y = {
                    Value = l_l_RangedWeapons_0_FirstChild_0.RecoilPattern["1"].y.Value
                }
            } else l_l_RangedWeapons_0_FirstChild_0.RecoilPattern:FindFirstChild((tostring(v91)));
        else
            v121 = {
                x = {
                    Value = math.random(-5, 5) * 0.01
                }, 
                y = {
                    Value = math.random(5, 10) * 0.01
                }
            };
        end;
        local v122 = v18.Status.GameplayVariables:GetAttribute("Stance") == "Crouching";
        local v123 = l_ItemProperties_0.Tool:GetAttribute("MuzzleDevice") or "Default";
        local v124 = l_FirstChild_0:GetAttribute("RecoilStrength") * (l_HumanoidRootPart_0:GetAttribute("Recoil") or 1);
        local v125 = v122 and v124 * 0.9 or v124;
        local v126 = v122 and v124 * 0.9 or v124;
        local l_Attachments_0 = v85:FindFirstChild("Attachments");
        if l_Attachments_0 then
            local l_l_Attachments_0_Children_0 = l_Attachments_0:GetChildren();
            for v129 = 1, #l_l_Attachments_0_Children_0 do
                local l_StringValue_0 = l_l_Attachments_0_Children_0[v129]:FindFirstChildOfClass("StringValue");
                if l_StringValue_0 and l_StringValue_0.ItemProperties:FindFirstChild("Attachment") and (not l_StringValue_0.ItemProperties:GetAttribute("Durability") or l_StringValue_0.ItemProperties:GetAttribute("Durability") > 0) then
                    local l_Attachment_0 = l_StringValue_0.ItemProperties.Attachment;
                    local l_l_Attachment_0_Attribute_0 = l_Attachment_0:GetAttribute("Recoil");
                    if l_l_Attachment_0_Attribute_0 then
                        v125 = v125 + l_l_Attachment_0_Attribute_0 * l_Attachment_0:GetAttribute("HRecoilMod");
                        v126 = v126 + l_l_Attachment_0_Attribute_0 * l_Attachment_0:GetAttribute("VRecoilMod");
                    end;
                    local l_l_Attachment_0_Attribute_1 = l_Attachment_0:GetAttribute("MuzzleDevice");
                    if l_l_Attachment_0_Attribute_1 then
                        v123 = l_l_Attachment_0_Attribute_1;
                        if v87.Item.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension") then
                            v96 = v87.Item.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension");
                            v97 = v86.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension");
                        end;
                    end;
                end;
            end;
        end;
        if v123 == "Suppressor" then
            if tick() - v90 < 0.8 then
                l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSoundSupressed, l_ItemRoot_0.FireSoundSupressed.TimeLength, l_Temp_0);
            else
                l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSoundSupressed, l_ItemRoot_0.FireSoundSupressed.TimeLength, l_Temp_0);
            end;
        elseif tick() - v90 < 0.8 then
            l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSound, l_ItemRoot_0.FireSound.TimeLength, l_Temp_0);
        else
            l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSound, l_ItemRoot_0.FireSound.TimeLength, l_Temp_0);
        end;
        if l_l_l_RangedWeapons_0_FirstChild_0_Attribute_1 == true then
            local v134 = l_SpecialProperties_0 and l_SpecialProperties_0:GetAttribute("MuzzleEffect");
            local l_Children_0 = ((v134 and l_VFX_1.MuzzleEffects.Override:FindFirstChild(v134) or l_VFX_1.MuzzleEffects):FindFirstChild(v123) or l_VFX_1.MuzzleEffects:FindFirstChild(v123)):GetChildren();
            local v136 = l_Children_0[math.random(1, #l_Children_0)];
            local l_Children_1 = v136.Particles:GetChildren();
            if v136:FindFirstChild("MuzzleLight") then
                local v138 = v136.MuzzleLight:Clone();
                v138.Range = math.clamp(v138.Range + math.random(-2, 2) / 2, 0, 50);
                v138.Enabled = true;
                l_Debris_0:AddItem(v138, 0.1);
                v138.Parent = v96;
            end;
            for v139 = 1, #l_Children_1 do
                if l_Children_1[v139].className == "ParticleEmitter" then
                    local v140 = l_Children_1[v139]:Clone();
                    local v141 = v140:GetAttribute("EmitCount") or 1;
                    local v142 = math.clamp(l_l_FirstChild_0_Attribute_6 / 45 / 2.4, 0, 0.6);
                    if l_l_FirstChild_0_Attribute_5 then
                        v142 = math.clamp(l_l_FirstChild_0_Attribute_6 * l_l_FirstChild_0_Attribute_5 / 45 / 2.4, 0, 0.6);
                    end;
                    local v143 = math.clamp(v142, 1, 10);
                    v140.Lifetime = NumberRange.new(v140.Lifetime.Min * v143, v140.Lifetime.Max * v143);
                    v140.Size = v61(v140.Size, v142);
                    v140.Parent = v96;
                    v140:Emit(v141);
                    l_Debris_0:AddItem(v140, v140.Lifetime.Max);
                end;
            end;
        end;
        local _ = l_HumanoidRootPart_0.CFrame.p;
        local l_LookVector_0 = v92.CFrame.LookVector;
        local v146 = math.clamp(l_l_FirstChild_0_Attribute_2 / 2400, 0.7, 1.2);
        local v147 = 0;
        local v148 = "";
        local v149 = 0;
        local v150 = false;
        local function v211() --[[ Line: 369 ]] --[[ Name: fireBullet ]]
            local v151 = RaycastParams.new();
            v151.FilterType = Enum.RaycastFilterType.Exclude;
            local v152 = {
                l_Character_0, 
                v87, 
                v21
            };
            local v153 = {};
            v151.FilterDescendantsInstances = v152;
            v151.IgnoreWater = false;
            v151.CollisionGroup = "WeaponRay";
            local v154 = tick();
            local l_l_LookVector_0_0 = l_LookVector_0;
            local l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = l_FunctionLibraryExtension_0:GetEstimatedCameraPosition(l_LocalPlayer_0);
            local v157 = false;
            local v158 = Vector3.new();
            local v159 = 0;
            local v160 = l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_LookVector_0 * 1000;
            if l_l_FirstChild_0_Attribute_4 then
                local v161 = 6.283185307179586 * math.random();
                local v162 = math.random(-l_l_FirstChild_0_Attribute_4, l_l_FirstChild_0_Attribute_4);
                local v163 = v162 * math.cos(v161);
                local v164 = v162 * math.sin(v161);
                l_l_LookVector_0_0 = (v160 + Vector3.new(v163, math.random(-l_l_FirstChild_0_Attribute_4, l_l_FirstChild_0_Attribute_4), v164) - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1).Unit;
            end;
            v147 = v147 + 1;
            if v147 == 1 then
                v149 = math.random(-100000, 100000);
                v148 = tostring(game.Players.LocalPlayer.UserId);
                coroutine.wrap(function() --[[ Line: 445 ]]
                    if not l_FireProjectile_0:InvokeServer(l_l_LookVector_0_0, v149, tick()) then
                        script.Parent.Binds.AdjustBullets:Fire(l_Attribute_0, 1);
                    end;
                end)();
            elseif v147 > 1 then
                l_VisualProjectile_0:FireServer(l_l_LookVector_0_0, v149);
            end;
            if not l_l_FirstChild_0_Attribute_5 or not v150 and v147 > math.floor(l_l_FirstChild_0_Attribute_5 * 0.2) then
                v150 = true;
            end;
            local v165 = nil;
            local v166 = nil;
            if l_l_FirstChild_0_Attribute_3 then
                v165 = l_VFX_1.MuzzleEffects.Tracer:Clone();
                v165.Name = v148;
                v165.Color = v104;
                l_Debris_0:AddItem(v165, 10);
                v165.Position = Vector3.new(0, -100, 0, 0);
                v165.Parent = game.Workspace.NoCollision.Effects;
                local _ = l_HumanoidRootPart_0.AssemblyLinearVelocity;
                v166 = v96.Position;
            end;
            local v168 = {};
            local _ = {};
            local v170 = nil;
            local _ = 60;
            local _ = 0.008333333333333333;
            local v173 = 0;
            local v174 = 0;
            local _ = function(_) --[[ Line: 499 ]] --[[ Name: Stop ]]
                v170:Disconnect();
                if v165 then
                    if v165:FindFirstChild("Trail") then
                        wait(v165.Trail.Lifetime);
                    end;
                    v165:Destroy();
                end;
            end;
            local function v210(v177) --[[ Line: 521 ]] --[[ Name: onStep ]]
                v173 = v173 + v177;
                if v173 > 0.008333333333333333 then
                    v174 = v174 + v173;
                    local v178 = l_l_FirstChild_0_Attribute_2 * v173;
                    local v179 = workspace:Raycast(l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1, l_l_LookVector_0_0 * v178, v151);
                    local v180 = nil;
                    local v181 = nil;
                    local v182 = nil;
                    local v183 = nil;
                    if v179 then
                        v180 = v179.Instance;
                        v181 = v179.Position;
                        v182 = v179.Normal;
                        v183 = v179.Material;
                    else
                        v181 = l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_l_LookVector_0_0 * v178;
                    end;
                    local l_Magnitude_0 = (l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 - v181).Magnitude;
                    v159 = v159 + l_Magnitude_0;
                    if v165 then
                        local l_Magnitude_1 = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                        local v186 = math.clamp(l_CurrentCamera_1.FieldOfView / 70, 0.38, 1.1);
                        if v159 < 200 then
                            local _ = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                            local v188 = math.clamp(l_Magnitude_1 / 200, 0.1, 2.1) * v146 * v186;
                            local _ = (v166 - v181).Magnitude;
                            local l_Unit_0 = (v181 - v166).Unit;
                            v165.Size = Vector3.new(v188, v188, v188);
                            local v191 = v166 + l_LookVector_0 * v159;
                            v165.CFrame = CFrame.new(v191, l_Unit_0);
                        else
                            local _ = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                            local v193 = math.clamp(l_Magnitude_1 / 200, 0.1, 2.1) * v146 * v186;
                            v165.Size = Vector3.new(v193, v193, v193);
                            v165.CFrame = CFrame.new(v181, l_l_LookVector_0_0);
                        end;
                    end;
                    local v194 = "nil";
                    if v180 then
                        local v195 = math.floor(v181.X);
                        local v196 = math.floor(v181.Y);
                        local v197 = math.floor(v181.Z);
                        local v198 = math.floor(v182.X);
                        local v199 = math.floor(v182.Y);
                        local v200 = math.floor(v182.Z);
                        v194 = tostring(v195) .. tostring(v196) .. tostring(v197) .. tostring(v198) .. tostring(v199) .. tostring(v200);
                        if v153[v194] then
                            v181 = v181 - v182 * 0.1;
                        end;
                    end;
                    if v180 and not v153[v194] then
                        table.insert(v168, v173);
                        local l_l_FunctionLibraryExtension_0_DeepAncestor_0 = l_FunctionLibraryExtension_0:FindDeepAncestor(v180, "Model");
                        local _ = l_l_FunctionLibraryExtension_0_DeepAncestor_0;
                        if v180:FindFirstChild("RealParent") then
                            l_l_FunctionLibraryExtension_0_DeepAncestor_0 = v180.RealParent.Value;
                        end;
                        if v180:GetAttribute("PassThrough", 2) then
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180:GetAttribute("PassThrough", 1) and l_l_FirstChild_0_Attribute_7 == nil then
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180:GetAttribute("Glass") then
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180.Name == "Terrain" then
                            if v157 == false and v183 == Enum.Material.Water then
                                v157 = true;
                                l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 * 0.15;
                                v158 = v181;
                                v151.IgnoreWater = true;
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                                return;
                            else
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                                v170:Disconnect();
                                if v165 then
                                    if v165:FindFirstChild("Trail") then
                                        wait(v165.Trail.Lifetime);
                                    end;
                                    v165:Destroy();
                                    return;
                                end;
                            end;
                        elseif l_l_FunctionLibraryExtension_0_DeepAncestor_0:FindFirstChild("Humanoid") then
                            local v203 = v180.CFrame:ToObjectSpace(CFrame.new(v181));
                            if l_l_FirstChild_0_Attribute_2 / l_l_l_FirstChild_0_Attribute_2_0 > 0.1 and l_l_FirstChild_0_Attribute_2 < 3300 then
                                l_ProjectileInflict_0:FireServer(v180, v203, v149, tick());
                            end;
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            v170:Disconnect();
                            if v165 then
                                if v165:FindFirstChild("Trail") then
                                    wait(v165.Trail.Lifetime);
                                end;
                                v165:Destroy();
                                return;
                            end;
                        elseif l_l_FunctionLibraryExtension_0_DeepAncestor_0.ClassName == "Model" and l_l_FunctionLibraryExtension_0_DeepAncestor_0.PrimaryPart ~= nil and l_l_FunctionLibraryExtension_0_DeepAncestor_0.PrimaryPart:GetAttribute("Health") then
                            local v204 = v180.CFrame:ToObjectSpace(CFrame.new(v181));
                            l_ProjectileInflict_0:FireServer(v180, v204, v149, tick());
                            if l_l_FunctionLibraryExtension_0_DeepAncestor_0.Parent.Name ~= "SleepingPlayers" and v182 then
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            end;
                            v170:Disconnect();
                            if v165 then
                                if v165:FindFirstChild("Trail") then
                                    wait(v165.Trail.Lifetime);
                                end;
                                v165:Destroy();
                                return;
                            end;
                        else
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            local v205, v206, v207 = l_FunctionLibraryExtension_0:Penetration(v180, v181, l_l_LookVector_0_0, l_l_FirstChild_0_Attribute_9);
                            l_l_FirstChild_0_Attribute_9 = v205;
                            if l_l_FirstChild_0_Attribute_9 > 0 then
                                l_VFX_0.Impact(unpack(v207));
                                local v208 = l_l_FirstChild_0_Attribute_9 / l_l_l_FirstChild_0_Attribute_9_0;
                                l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 * math.clamp(v208, 0.5, 1);
                                l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = v206;
                                v153[v194] = true;
                                v151.FilterDescendantsInstances = v152;
                                return;
                            else
                                v170:Disconnect();
                                if v165 then
                                    if v165:FindFirstChild("Trail") then
                                        wait(v165.Trail.Lifetime);
                                    end;
                                    v165:Destroy();
                                    return;
                                end;
                            end;
                        end;
                    elseif v159 > 2500 or tick() - v154 > 60 then
                        v170:Disconnect();
                        if v165 then
                            if v165:FindFirstChild("Trail") then
                                wait(v165.Trail.Lifetime);
                            end;
                            v165:Destroy();
                            return;
                        end;
                    else
                        l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = v181;
                        l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 - l_l_FirstChild_0_Attribute_1 * l_l_FirstChild_0_Attribute_2 ^ 2 * v173 ^ 2;
                        local v209 = Vector3.new(0, l_l_FirstChild_0_Attribute_0 * v174 ^ 2, 0);
                        l_l_LookVector_0_0 = (l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_l_LookVector_0_0 * 10000 - v209 - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1).Unit;
                        table.insert(v168, v173);
                        v173 = 0;
                    end;
                end;
            end;
            v170 = l_RunService_0.RenderStepped:Connect(v210);
        end;
        if l_l_FirstChild_0_Attribute_5 ~= nil then
            for _ = 1, l_l_FirstChild_0_Attribute_5 do
                coroutine.wrap(v211)();
            end;
        else
            coroutine.wrap(v211)();
        end;
        return v125 / 200, v126 / 200, v123, v121;
    else
        return;
    end;
end;
return v0;
                  local v0 = {};
local l_VFX_0 = require(game.ReplicatedStorage.Modules:WaitForChild("VFX"));
local l_UniversalTables_0 = require(game.ReplicatedStorage.Modules:WaitForChild("UniversalTables"));
local l_FunctionLibraryExtension_0 = require(game.ReplicatedStorage.Modules:WaitForChild("FunctionLibraryExtension"));
local l_ProjectileInflict_0 = game.ReplicatedStorage.Remotes.ProjectileInflict;
local l_VisualProjectile_0 = game.ReplicatedStorage.Remotes.VisualProjectile;
local l_FireProjectile_0 = game.ReplicatedStorage.Remotes.FireProjectile;
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_1 = l_ReplicatedStorage_0:WaitForChild("Players");
local _ = l_ReplicatedStorage_0:WaitForChild("Remotes");
local _ = game.ReplicatedStorage:WaitForChild("Modules");
local l_RangedWeapons_0 = l_ReplicatedStorage_0:WaitForChild("RangedWeapons");
local _ = l_ReplicatedStorage_0:WaitForChild("SFX");
local l_VFX_1 = game.ReplicatedStorage:WaitForChild("VFX");
local l_Debris_0 = game:GetService("Debris");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v18 = l_Players_1:WaitForChild(l_LocalPlayer_0.Name);
local l_Temp_0 = game.ReplicatedStorage.Temp;
local _ = l_UniversalTables_0.UniversalTable.GameSettings.RootScanHeight;
local v21 = l_UniversalTables_0.ReturnTable("GlobalIgnoreListProjectile");
local _ = {
    "LeftFoot", 
    "LeftHand", 
    "LeftLowerArm", 
    "LeftLowerLeg", 
    "LeftUpperArm", 
    "LeftUpperLeg", 
    "LowerTorso", 
    "RightFoot", 
    "RightHand", 
    "RightLowerArm", 
    "RightLowerLeg", 
    "RightUpperArm", 
    "RightUpperLeg", 
    "RightUpperLeg", 
    "UpperTorso", 
    "Head", 
    "FaceHitBox", 
    "HeadTopHitBox"
};
local function _(v23) --[[ Line: 62 ]] --[[ Name: isPlayer ]]
    return (l_Players_0:FindFirstChild(v23.Name));
end;
local function _(v25, v26) --[[ Line: 68 ]] --[[ Name: getRayClosestPoint ]]
    local v27 = v25.Origin - v26;
    local l_Direction_0 = v25.Direction;
    return v26 + (v27 - v27:Dot(l_Direction_0) / l_Direction_0:Dot(l_Direction_0) * l_Direction_0);
end;
local _ = function(v30, v31, v32) --[[ Line: 77 ]] --[[ Name: getAimHeight ]]
    local _ = v30.CFrame.p;
    local l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0 = l_FunctionLibraryExtension_0:GetEstimatedCameraPosition(l_LocalPlayer_0);
    local v35 = Ray.new(l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0, (v32 - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_0).Unit * 7500);
    local v36 = v35.Origin - v31;
    local l_Direction_1 = v35.Direction;
    return (v31 + (v36 - v36:Dot(l_Direction_1) / l_Direction_1:Dot(l_Direction_1) * l_Direction_1)).Y;
end;
local function _(v39, v40, v41, v42) --[[ Line: 88 ]] --[[ Name: intersection_point ]]
    local v43 = (v40.Z - v39.Z) / (v40.X - v39.X);
    local v44 = (v42.Z - v41.Z) / (v42.X - v41.X);
    local v45 = v39.Z - v43 * v39.X;
    local v46 = (v41.Z - v44 * v41.X - v45) / (v43 - v44);
    local v47 = v43 * v46 + v45;
    return (Vector3.new(v46, v39.Y, v47));
end;
local function _(v49) --[[ Line: 98 ]] --[[ Name: Encrypt ]]
    local v50 = "";
    for v51 = 1, v49:len() do
        v50 = v50 .. string.char(v49:sub(v51, v51):byte() - 5);
    end;
    return v50;
end;
local function v61(v53, v54) --[[ Line: 109 ]] --[[ Name: devideNumberSequence ]]
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local l_Keypoints_0 = v53.Keypoints;
    for v60 = 1, #l_Keypoints_0 do
        if v60 == 1 then
            v55 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 2 then
            v56 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 3 then
            v57 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        elseif v60 == 4 then
            v58 = NumberSequenceKeypoint.new(l_Keypoints_0[v60].Time, l_Keypoints_0[v60].Value * v54);
        end;
    end;
    return (NumberSequence.new({
        v55, 
        v56, 
        v57, 
        v58
    }));
end;
local function v73(v62, v63, v64, v65, v66, v67) --[[ Line: 139 ]] --[[ Name: RotCamera ]]
    if v66 then
        local v68 = math.min(1.5 / math.max(v67, 0), 90);
        local v69 = 0;
        local v70 = tick();
        while true do
            local v71 = v68 * (1 * (tick() - v70) * 60);
            local v72 = v69 + v71;
            v69 = v72 > 90 and 90 or v72;
            if v62.CoordinateFrame.lookVector.Y <= 0.98 then
                v62.CoordinateFrame = v62.CoordinateFrame * CFrame.Angles(v63 / (90 / v71), v64 / (90 / v71), v65 / (90 / v71));
                if v69 ~= 90 then
                    v70 = tick();
                    game:GetService("RunService").Stepped:wait();
                else
                    break;
                end;
            else
                break;
            end;
        end;
    else
        v62.CoordinateFrame = v62.CoordinateFrame * CFrame.Angles(v63, v64, v65);
    end;
end;
RecoilCamera = function(v74, v75, v76, _, _) --[[ Line: 162 ]] --[[ Name: RecoilCamera ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v80 = v75 * 0.004 / 3;
    local v81 = v76 * 0.004 / 3;
    local v82 = 0;
    local v83 = 0;
    if v74 then
        v82 = v74.y.Value * v80 * 2;
        v83 = v74.x.Value * v81 * 2;
    end;
    coroutine.wrap(function() --[[ Line: 181 ]]
        v73(l_CurrentCamera_0, v82, v83, 0, true, 0.06);
    end)();
end;
v0.CreateBullet = function(_, v85, v86, v87, _, v89, v90, v91, v92) --[[ Line: 191 ]] --[[ Name: CreateBullet ]]
    local l_Character_0 = l_LocalPlayer_0.Character;
    local l_HumanoidRootPart_0 = l_Character_0.HumanoidRootPart;
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    if l_Character_0:FindFirstChild(v85.Name) then
        local v96 = nil;
        local v97 = nil;
        if v87.Item.Attachments:FindFirstChild("Front") then
            v96 = v87.Item.Attachments.Front:GetChildren()[1].Barrel;
            v97 = v86.Attachments.Front:GetChildren()[1].Barrel;
        else
            v96 = v87.Item.Barrel;
            v97 = v86.Barrel;
        end;
        local l_ItemRoot_0 = v86.ItemRoot;
        local l_ItemProperties_0 = v85.ItemProperties;
        local l_l_RangedWeapons_0_FirstChild_0 = l_RangedWeapons_0:FindFirstChild(v85.Name);
        local l_SpecialProperties_0 = l_ItemProperties_0:FindFirstChild("SpecialProperties");
        local l_Attribute_0 = v18.Status.GameplayVariables:GetAttribute("EquipId");
        local l_FirstChild_0 = l_ReplicatedStorage_0.AmmoTypes:FindFirstChild(v89);
        local v104 = l_SpecialProperties_0 and l_SpecialProperties_0:GetAttribute("TracerColor") or l_l_RangedWeapons_0_FirstChild_0:GetAttribute("ProjectileColor");
        local _ = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("BulletMaterial");
        local l_l_FirstChild_0_Attribute_0 = l_FirstChild_0:GetAttribute("ProjectileDrop");
        local l_l_l_RangedWeapons_0_FirstChild_0_Attribute_1 = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("MuzzleEffect");
        local l_l_FirstChild_0_Attribute_1 = l_FirstChild_0:GetAttribute("Drag");
        local l_l_FirstChild_0_Attribute_2 = l_FirstChild_0:GetAttribute("MuzzleVelocity");
        local l_l_l_FirstChild_0_Attribute_2_0 = l_l_FirstChild_0_Attribute_2;
        local l_l_FirstChild_0_Attribute_3 = l_FirstChild_0:GetAttribute("Tracer");
        local _ = l_l_RangedWeapons_0_FirstChild_0:GetAttribute("RecoilRecoveryTimeMod");
        local l_l_FirstChild_0_Attribute_4 = l_FirstChild_0:GetAttribute("AccuracyDeviation");
        local l_l_FirstChild_0_Attribute_5 = l_FirstChild_0:GetAttribute("Pellets");
        local l_l_FirstChild_0_Attribute_6 = l_FirstChild_0:GetAttribute("Damage");
        local l_l_FirstChild_0_Attribute_7 = l_FirstChild_0:GetAttribute("Arrow");
        local _ = l_FirstChild_0:GetAttribute("ProjectileWidth");
        local l_l_FirstChild_0_Attribute_9 = l_FirstChild_0:GetAttribute("ArmorPen");
        local l_l_l_FirstChild_0_Attribute_9_0 = l_l_FirstChild_0_Attribute_9;
        local v120 = nil;
        local v121 = nil;
        if v91 and l_l_RangedWeapons_0_FirstChild_0:FindFirstChild("RecoilPattern") then
            v120 = #l_l_RangedWeapons_0_FirstChild_0.RecoilPattern:GetChildren();
            v121 = if v91 == 1 then {
                x = {
                    Value = l_l_RangedWeapons_0_FirstChild_0.RecoilPattern["1"].x.Value
                }, 
                y = {
                    Value = l_l_RangedWeapons_0_FirstChild_0.RecoilPattern["1"].y.Value
                }
            } else l_l_RangedWeapons_0_FirstChild_0.RecoilPattern:FindFirstChild((tostring(v91)));
        else
            v121 = {
                x = {
                    Value = math.random(-5, 5) * 0.01
                }, 
                y = {
                    Value = math.random(5, 10) * 0.01
                }
            };
        end;
        local v122 = v18.Status.GameplayVariables:GetAttribute("Stance") == "Crouching";
        local v123 = l_ItemProperties_0.Tool:GetAttribute("MuzzleDevice") or "Default";
        local v124 = l_FirstChild_0:GetAttribute("RecoilStrength") * (l_HumanoidRootPart_0:GetAttribute("Recoil") or 1);
        local v125 = v122 and v124 * 0.9 or v124;
        local v126 = v122 and v124 * 0.9 or v124;
        local l_Attachments_0 = v85:FindFirstChild("Attachments");
        if l_Attachments_0 then
            local l_l_Attachments_0_Children_0 = l_Attachments_0:GetChildren();
            for v129 = 1, #l_l_Attachments_0_Children_0 do
                local l_StringValue_0 = l_l_Attachments_0_Children_0[v129]:FindFirstChildOfClass("StringValue");
                if l_StringValue_0 and l_StringValue_0.ItemProperties:FindFirstChild("Attachment") and (not l_StringValue_0.ItemProperties:GetAttribute("Durability") or l_StringValue_0.ItemProperties:GetAttribute("Durability") > 0) then
                    local l_Attachment_0 = l_StringValue_0.ItemProperties.Attachment;
                    local l_l_Attachment_0_Attribute_0 = l_Attachment_0:GetAttribute("Recoil");
                    if l_l_Attachment_0_Attribute_0 then
                        v125 = v125 + l_l_Attachment_0_Attribute_0 * l_Attachment_0:GetAttribute("HRecoilMod");
                        v126 = v126 + l_l_Attachment_0_Attribute_0 * l_Attachment_0:GetAttribute("VRecoilMod");
                    end;
                    local l_l_Attachment_0_Attribute_1 = l_Attachment_0:GetAttribute("MuzzleDevice");
                    if l_l_Attachment_0_Attribute_1 then
                        v123 = l_l_Attachment_0_Attribute_1;
                        if v87.Item.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension") then
                            v96 = v87.Item.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension");
                            v97 = v86.Attachments.Muzzle:FindFirstChild(l_StringValue_0.Name):FindFirstChild("BarrelExtension");
                        end;
                    end;
                end;
            end;
        end;
        if v123 == "Suppressor" then
            if tick() - v90 < 0.8 then
                l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSoundSupressed, l_ItemRoot_0.FireSoundSupressed.TimeLength, l_Temp_0);
            else
                l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSoundSupressed, l_ItemRoot_0.FireSoundSupressed.TimeLength, l_Temp_0);
            end;
        elseif tick() - v90 < 0.8 then
            l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSound, l_ItemRoot_0.FireSound.TimeLength, l_Temp_0);
        else
            l_FunctionLibraryExtension_0:PlaySoundV2(l_ItemRoot_0.FireSound, l_ItemRoot_0.FireSound.TimeLength, l_Temp_0);
        end;
        if l_l_l_RangedWeapons_0_FirstChild_0_Attribute_1 == true then
            local v134 = l_SpecialProperties_0 and l_SpecialProperties_0:GetAttribute("MuzzleEffect");
            local l_Children_0 = ((v134 and l_VFX_1.MuzzleEffects.Override:FindFirstChild(v134) or l_VFX_1.MuzzleEffects):FindFirstChild(v123) or l_VFX_1.MuzzleEffects:FindFirstChild(v123)):GetChildren();
            local v136 = l_Children_0[math.random(1, #l_Children_0)];
            local l_Children_1 = v136.Particles:GetChildren();
            if v136:FindFirstChild("MuzzleLight") then
                local v138 = v136.MuzzleLight:Clone();
                v138.Range = math.clamp(v138.Range + math.random(-2, 2) / 2, 0, 50);
                v138.Enabled = true;
                l_Debris_0:AddItem(v138, 0.1);
                v138.Parent = v96;
            end;
            for v139 = 1, #l_Children_1 do
                if l_Children_1[v139].className == "ParticleEmitter" then
                    local v140 = l_Children_1[v139]:Clone();
                    local v141 = v140:GetAttribute("EmitCount") or 1;
                    local v142 = math.clamp(l_l_FirstChild_0_Attribute_6 / 45 / 2.4, 0, 0.6);
                    if l_l_FirstChild_0_Attribute_5 then
                        v142 = math.clamp(l_l_FirstChild_0_Attribute_6 * l_l_FirstChild_0_Attribute_5 / 45 / 2.4, 0, 0.6);
                    end;
                    local v143 = math.clamp(v142, 1, 10);
                    v140.Lifetime = NumberRange.new(v140.Lifetime.Min * v143, v140.Lifetime.Max * v143);
                    v140.Size = v61(v140.Size, v142);
                    v140.Parent = v96;
                    v140:Emit(v141);
                    l_Debris_0:AddItem(v140, v140.Lifetime.Max);
                end;
            end;
        end;
        local _ = l_HumanoidRootPart_0.CFrame.p;
        local l_LookVector_0 = v92.CFrame.LookVector;
        local v146 = math.clamp(l_l_FirstChild_0_Attribute_2 / 2400, 0.7, 1.2);
        local v147 = 0;
        local v148 = "";
        local v149 = 0;
        local v150 = false;
        local function v211() --[[ Line: 369 ]] --[[ Name: fireBullet ]]
            local v151 = RaycastParams.new();
            v151.FilterType = Enum.RaycastFilterType.Exclude;
            local v152 = {
                l_Character_0, 
                v87, 
                v21
            };
            local v153 = {};
            v151.FilterDescendantsInstances = v152;
            v151.IgnoreWater = false;
            v151.CollisionGroup = "WeaponRay";
            local v154 = tick();
            local l_l_LookVector_0_0 = l_LookVector_0;
            local l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = l_FunctionLibraryExtension_0:GetEstimatedCameraPosition(l_LocalPlayer_0);
            local v157 = false;
            local v158 = Vector3.new();
            local v159 = 0;
            local v160 = l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_LookVector_0 * 1000;
            if l_l_FirstChild_0_Attribute_4 then
                local v161 = 6.283185307179586 * math.random();
                local v162 = math.random(-l_l_FirstChild_0_Attribute_4, l_l_FirstChild_0_Attribute_4);
                local v163 = v162 * math.cos(v161);
                local v164 = v162 * math.sin(v161);
                l_l_LookVector_0_0 = (v160 + Vector3.new(v163, math.random(-l_l_FirstChild_0_Attribute_4, l_l_FirstChild_0_Attribute_4), v164) - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1).Unit;
            end;
            v147 = v147 + 1;
            if v147 == 1 then
                v149 = math.random(-100000, 100000);
                v148 = tostring(game.Players.LocalPlayer.UserId);
                coroutine.wrap(function() --[[ Line: 445 ]]
                    if not l_FireProjectile_0:InvokeServer(l_l_LookVector_0_0, v149, tick()) then
                        script.Parent.Binds.AdjustBullets:Fire(l_Attribute_0, 1);
                    end;
                end)();
            elseif v147 > 1 then
                l_VisualProjectile_0:FireServer(l_l_LookVector_0_0, v149);
            end;
            if not l_l_FirstChild_0_Attribute_5 or not v150 and v147 > math.floor(l_l_FirstChild_0_Attribute_5 * 0.2) then
                v150 = true;
            end;
            local v165 = nil;
            local v166 = nil;
            if l_l_FirstChild_0_Attribute_3 then
                v165 = l_VFX_1.MuzzleEffects.Tracer:Clone();
                v165.Name = v148;
                v165.Color = v104;
                l_Debris_0:AddItem(v165, 10);
                v165.Position = Vector3.new(0, -100, 0, 0);
                v165.Parent = game.Workspace.NoCollision.Effects;
                local _ = l_HumanoidRootPart_0.AssemblyLinearVelocity;
                v166 = v96.Position;
            end;
            local v168 = {};
            local _ = {};
            local v170 = nil;
            local _ = 60;
            local _ = 0.008333333333333333;
            local v173 = 0;
            local v174 = 0;
            local _ = function(_) --[[ Line: 499 ]] --[[ Name: Stop ]]
                v170:Disconnect();
                if v165 then
                    if v165:FindFirstChild("Trail") then
                        wait(v165.Trail.Lifetime);
                    end;
                    v165:Destroy();
                end;
            end;
            local function v210(v177) --[[ Line: 521 ]] --[[ Name: onStep ]]
                v173 = v173 + v177;
                if v173 > 0.008333333333333333 then
                    v174 = v174 + v173;
                    local v178 = l_l_FirstChild_0_Attribute_2 * v173;
                    local v179 = workspace:Raycast(l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1, l_l_LookVector_0_0 * v178, v151);
                    local v180 = nil;
                    local v181 = nil;
                    local v182 = nil;
                    local v183 = nil;
                    if v179 then
                        v180 = v179.Instance;
                        v181 = v179.Position;
                        v182 = v179.Normal;
                        v183 = v179.Material;
                    else
                        v181 = l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_l_LookVector_0_0 * v178;
                    end;
                    local l_Magnitude_0 = (l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 - v181).Magnitude;
                    v159 = v159 + l_Magnitude_0;
                    if v165 then
                        local l_Magnitude_1 = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                        local v186 = math.clamp(l_CurrentCamera_1.FieldOfView / 70, 0.38, 1.1);
                        if v159 < 200 then
                            local _ = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                            local v188 = math.clamp(l_Magnitude_1 / 200, 0.1, 2.1) * v146 * v186;
                            local _ = (v166 - v181).Magnitude;
                            local l_Unit_0 = (v181 - v166).Unit;
                            v165.Size = Vector3.new(v188, v188, v188);
                            local v191 = v166 + l_LookVector_0 * v159;
                            v165.CFrame = CFrame.new(v191, l_Unit_0);
                        else
                            local _ = (l_CurrentCamera_1.CFrame.Position - v181).Magnitude;
                            local v193 = math.clamp(l_Magnitude_1 / 200, 0.1, 2.1) * v146 * v186;
                            v165.Size = Vector3.new(v193, v193, v193);
                            v165.CFrame = CFrame.new(v181, l_l_LookVector_0_0);
                        end;
                    end;
                    local v194 = "nil";
                    if v180 then
                        local v195 = math.floor(v181.X);
                        local v196 = math.floor(v181.Y);
                        local v197 = math.floor(v181.Z);
                        local v198 = math.floor(v182.X);
                        local v199 = math.floor(v182.Y);
                        local v200 = math.floor(v182.Z);
                        v194 = tostring(v195) .. tostring(v196) .. tostring(v197) .. tostring(v198) .. tostring(v199) .. tostring(v200);
                        if v153[v194] then
                            v181 = v181 - v182 * 0.1;
                        end;
                    end;
                    if v180 and not v153[v194] then
                        table.insert(v168, v173);
                        local l_l_FunctionLibraryExtension_0_DeepAncestor_0 = l_FunctionLibraryExtension_0:FindDeepAncestor(v180, "Model");
                        local _ = l_l_FunctionLibraryExtension_0_DeepAncestor_0;
                        if v180:FindFirstChild("RealParent") then
                            l_l_FunctionLibraryExtension_0_DeepAncestor_0 = v180.RealParent.Value;
                        end;
                        if v180:GetAttribute("PassThrough", 2) then
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180:GetAttribute("PassThrough", 1) and l_l_FirstChild_0_Attribute_7 == nil then
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180:GetAttribute("Glass") then
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            table.insert(v152, v180);
                            v151.FilterDescendantsInstances = v152;
                            return;
                        elseif v180.Name == "Terrain" then
                            if v157 == false and v183 == Enum.Material.Water then
                                v157 = true;
                                l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 * 0.15;
                                v158 = v181;
                                v151.IgnoreWater = true;
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                                return;
                            else
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                                v170:Disconnect();
                                if v165 then
                                    if v165:FindFirstChild("Trail") then
                                        wait(v165.Trail.Lifetime);
                                    end;
                                    v165:Destroy();
                                    return;
                                end;
                            end;
                        elseif l_l_FunctionLibraryExtension_0_DeepAncestor_0:FindFirstChild("Humanoid") then
                            local v203 = v180.CFrame:ToObjectSpace(CFrame.new(v181));
                            if l_l_FirstChild_0_Attribute_2 / l_l_l_FirstChild_0_Attribute_2_0 > 0.1 and l_l_FirstChild_0_Attribute_2 < 3300 then
                                l_ProjectileInflict_0:FireServer(v180, v203, v149, tick());
                            end;
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            v170:Disconnect();
                            if v165 then
                                if v165:FindFirstChild("Trail") then
                                    wait(v165.Trail.Lifetime);
                                end;
                                v165:Destroy();
                                return;
                            end;
                        elseif l_l_FunctionLibraryExtension_0_DeepAncestor_0.ClassName == "Model" and l_l_FunctionLibraryExtension_0_DeepAncestor_0.PrimaryPart ~= nil and l_l_FunctionLibraryExtension_0_DeepAncestor_0.PrimaryPart:GetAttribute("Health") then
                            local v204 = v180.CFrame:ToObjectSpace(CFrame.new(v181));
                            l_ProjectileInflict_0:FireServer(v180, v204, v149, tick());
                            if l_l_FunctionLibraryExtension_0_DeepAncestor_0.Parent.Name ~= "SleepingPlayers" and v182 then
                                l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            end;
                            v170:Disconnect();
                            if v165 then
                                if v165:FindFirstChild("Trail") then
                                    wait(v165.Trail.Lifetime);
                                end;
                                v165:Destroy();
                                return;
                            end;
                        else
                            l_VFX_0.Impact(v180, v181, v182, v183, l_l_LookVector_0_0, "Ranged", true);
                            local v205, v206, v207 = l_FunctionLibraryExtension_0:Penetration(v180, v181, l_l_LookVector_0_0, l_l_FirstChild_0_Attribute_9);
                            l_l_FirstChild_0_Attribute_9 = v205;
                            if l_l_FirstChild_0_Attribute_9 > 0 then
                                l_VFX_0.Impact(unpack(v207));
                                local v208 = l_l_FirstChild_0_Attribute_9 / l_l_l_FirstChild_0_Attribute_9_0;
                                l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 * math.clamp(v208, 0.5, 1);
                                l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = v206;
                                v153[v194] = true;
                                v151.FilterDescendantsInstances = v152;
                                return;
                            else
                                v170:Disconnect();
                                if v165 then
                                    if v165:FindFirstChild("Trail") then
                                        wait(v165.Trail.Lifetime);
                                    end;
                                    v165:Destroy();
                                    return;
                                end;
                            end;
                        end;
                    elseif v159 > 2500 or tick() - v154 > 60 then
                        v170:Disconnect();
                        if v165 then
                            if v165:FindFirstChild("Trail") then
                                wait(v165.Trail.Lifetime);
                            end;
                            v165:Destroy();
                            return;
                        end;
                    else
                        l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 = v181;
                        l_l_FirstChild_0_Attribute_2 = l_l_FirstChild_0_Attribute_2 - l_l_FirstChild_0_Attribute_1 * l_l_FirstChild_0_Attribute_2 ^ 2 * v173 ^ 2;
                        local v209 = Vector3.new(0, l_l_FirstChild_0_Attribute_0 * v174 ^ 2, 0);
                        l_l_LookVector_0_0 = (l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1 + l_l_LookVector_0_0 * 10000 - v209 - l_l_FunctionLibraryExtension_0_EstimatedCameraPosition_1).Unit;
                        table.insert(v168, v173);
                        v173 = 0;
                    end;
                end;
            end;
            v170 = l_RunService_0.RenderStepped:Connect(v210);
        end;
        if l_l_FirstChild_0_Attribute_5 ~= nil then
            for _ = 1, l_l_FirstChild_0_Attribute_5 do
                coroutine.wrap(v211)();
            end;
        else
            coroutine.wrap(v211)();
        end;
        return v125 / 200, v126 / 200, v123, v121;
    else
        return;
    end;
end;
return v0;
