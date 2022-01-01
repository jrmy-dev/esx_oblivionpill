ESX = nil

local locksound = false
local pillUsed = false
local scaleform

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        scaleform = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('dix-oblivionpill:oblivionPill')
AddEventHandler('dix-oblivionpill:oblivionPill', function()
    pillUsed = true
end)

RegisterNetEvent('dix-oblivionpill:stopPill')
AddEventHandler('dix-oblivionpill:stopPill', function()
    pillUsed = false
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if pillUsed == true then
            StartScreenEffect("DeathFailOut", 0, 0)

            if not locksound then
                PlaySoundFrontend(-1, "Bed", "WastedSounds", 1)
                locksound = true
                pillUsed = true
            end

            ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 1.0)

            if HasScaleformMovieLoaded(scaleform) then
                Citizen.Wait(0)
                PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
                BeginTextComponent("STRING")
                AddTextComponentString(_U('oblivionPill_fall'))
                EndTextComponent()
                PopScaleformMovieFunctionVoid()
                Citizen.Wait(100)
                PlaySoundFrontend(-1, "TextHit", "WastedSounds", 1)

                while pillUsed == true do
                    DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
                    SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
                    DisablePlayerFiring(PlayerId(), true)
                    Citizen.Wait(0)
                end

                StopScreenEffect("DeathFailOut")
                locksound = false
            end
        end
    end
end)
