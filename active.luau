local disable : boolean = true

if (isfile and writefile and isfolder and makefolder) and not(disable) then
    if not isfolder("renx_log") then
        makefolder("renx_log")
    end

    local filename : string = "89J28HJF892HJ89SDUAJJKF3298"
    local realfile : string = string.format("renx_log/%s.txt", filename)

    if isfile(realfile) then
        return {success = false, message = "Already have [".. filename .."] log."}
    end
    writefile(realfile, string.format("Log was create when %d.", tostring(tick())))

    local UILibrary : {} = loadstring(game:HttpGet("0.lua"))()
    if game.GameId == 0 then UILibrary = loadstring(game:HttpGet("0.lua"))() end

    local Notification : {new : () -> nil} = UILibrary:Notification();

    Notification.new({
        Title = "Announcement!",
        Description = "Hello World",
        Duration = 10,
    })
    return {success = true, message = "Done!"}
end
return {success = false, message = "Script disabled or executor not supported."}
