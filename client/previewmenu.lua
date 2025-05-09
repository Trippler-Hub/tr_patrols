RegisterNetEvent('patrols:previewmenu', function(data)
    local config = data.config
    local spawn = data.spawn
    local preview = data.preview
    
    local PreviewMenu = {
        {
            header = "Preview Menu",
            isMenuHeader = true
        }
    }

    if Config.Vehicles[config] then
        for _, vehicle in ipairs(Config.Vehicles[config]) do
            PreviewMenu[#PreviewMenu+1] = {
                header = vehicle.vehiclename,
                txt = "Preview: " .. vehicle.vehiclename,
                params = {
                    event = "patrols:preview",
                    args = {
                        vehicle = vehicle.vehicle,
                        preview = preview,
                    }
                }
            }
        end
    else
        print("Warning: No vehicles found for config: " .. json.encode(data))
    end

    PreviewMenu[#PreviewMenu+1] = {
        header = "⬅ Go Back",
        params = {
            event = "patrols:menu",
            args = {
                config = config,
                spawn = spawn,
                preview = preview
            }
        }
    }
    
    exports['qb-menu']:openMenu(PreviewMenu)
end)