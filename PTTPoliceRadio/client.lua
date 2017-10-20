
function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 0 )
    end
end

Citizen.CreateThread( function()
    while true do 
        Citizen.Wait( 0 )

        local ped = GetPlayerPed( -1 )

        if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
            DisableControlAction( 0, 19, true ) -- INPUT_CHARACTER_WHEEL (LEFTALT)  

            if ( not IsPauseMenuActive() ) then 
                    loadAnimDict( "random@arrests" )

                    while ( not HasAnimDictLoaded( "random@arrests" ) ) do 
                        Citizen.Wait( 100 )
                    end 
                        if ( IsDisabledControlJustReleased( 0, 19 ) ) then
						ClearPedSecondaryTask(ped)
                        SetEnableHandcuffs(ped, false)
                    else
                        if ( IsDisabledControlJustPressed( 0, 19 ) ) then
                        TaskPlayAnim(ped, "random@arrests", "generic_radio_enter", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
						SetEnableHandcuffs(ped, true)
                    end 
					   if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests", "generic_radio_enter", 3) then
					   DisableControlAction(1, 140, true)
					   DisableControlAction(1, 141, true)
					   DisableControlAction(1, 142, true)
					end
                end
            end 
        end 
    end
end )
