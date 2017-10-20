function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

Citizen.CreateThread( function()
    while true do 
        Citizen.Wait( 1 )

        local ped = GetPlayerPed( -1 )

        if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
            DisableControlAction( 0, 19, true ) -- INPUT_CHARACTER_WHEEL (LEFTALT)  

            if ( not IsPauseMenuActive() ) then 
                    loadAnimDict( "random@arrests" )

                    while ( not HasAnimDictLoaded( "random@arrests" ) ) do 
                        Citizen.Wait( 100 )
                    end 
                        if ( IsDisabledControlJustReleased( 0, 19 ) ) then 
                        SetEnableHandcuffs(ped, false)
                        ClearPedSecondaryTask(ped)
                    else
                        if ( IsDisabledControlJustPressed( 0, 19 ) ) then
                        ClearPedSecondaryTask(ped)
                        SetEnableHandcuffs(ped, true)
                        DisableControlAction(1, 140, true)
                        DisableControlAction(1, 141, true)
                        DisableControlAction(1, 142, true)
                        TaskPlayAnim(ped, "random@arrests", "generic_radio_chatter", 8.0, 3.0, -1, 49, 0, 0, 0, 0 )
                    end 
                end
            end 
        end 
    end
end )