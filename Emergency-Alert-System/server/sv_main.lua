Active = false
Received = false

RegisterCommand(eas, function(source, args, rawCommand)
    if source == 0 then
        print("This command cannot be executed by the server.")
        print("This command can only be executed by a player.")
        return
    end
    if not IsPlayerAceAllowed(source, "command.eas") then
        TriggerClientEvent('chat:addMessage', source, {args = { "Error", "You don't have permission to use this command." }})
        return
    end
    if Active then 
        TriggerClientEvent('chat:addMessage', source, {args = { "Error", "An alert is already active. Please wait." }})
        return
    end
    local type = tostring(args[1])
    if not type then
        TriggerClientEvent('chat:addMessage', source, {args = { "Error", "Invalid arguments. Usage: /eas {type}" }})
        return
    end
    if type ~= thunderstorm or type ~= snowstorm or type ~= tornado or type ~= tsunami or type ~= flood or type ~= hurricane or type ~= nuke then
        TriggerClientEvent('chat:addMessage', source, {args = { "Error", "Arguments out of bounds. Ensure you are entering a valid alert type." }})
        return
    end
    TriggerClientEvent("cl:EAS:TriggerOnAll", -1, type)
    Active = true
end, false)

RegisterNetEvent("sv:EAS:Callback")
RegisterNetEvent("sv:EAS:Callback", function()
    if Received == true then
        return
    end
    Received = true
    Wait(Config.Settings.cooldown * 1000)
    Active = false
    Received = false
end)

RegisterNetEvent("sv:EAS:ExternalTrigger")
RegisterNetEvent("sv:EAS:ExternalTrigger", function(arg)
    if Active then 
        print("Error", "An alert is already active. Please wait.")
        return
    end
    local type = tostring(arg)
    if not type then
        print("Error", "Invalid arguments. Usage: /eas {type}")
        return
    end
    if type ~= thunderstorm or type ~= snowstorm or type ~= tornado or type ~= tsunami or type ~= flood or type ~= hurricane or type ~= nuke then
        print("Error", "Arguments out of bounds. Ensure you are entering a valid alert type.")
        return
    end
    TriggerClientEvent("cl:EAS:TriggerOnAll", -1, type)
    Active = true
end)