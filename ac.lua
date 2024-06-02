local Frame = vgui.Create("DFrame")
Frame:SetTitle("Run Lua")
Frame:SetSize(ScrW() * 0.5, ScrH() * 0.5)
Frame:Center()
Frame:MakePopup()
Frame:ShowCloseButton(false)
Frame.Paint = function(self, w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 254))
end

local closeButton = vgui.Create("DButton", Frame)
closeButton:SetSize(30, 25)
closeButton:SetPos(Frame:GetWide() - 30, 0)
closeButton:SetText("X")
closeButton.DoClick = function()
    Frame:Close()
end
closeButton.Paint = function(self, w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(255, 0, 0, 254))
end

local TextEntry = vgui.Create("DTextEntry", Frame)
TextEntry:SetSize(Frame:GetWide() - 10, Frame:GetTall() - 45)
TextEntry:SetPos(5, 25)
TextEntry:SetMultiline(true)
TextEntry:SetFont("DermaDefault")
TextEntry:SetTextColor(Color(255, 255, 255))
TextEntry:SetPaintBackground(false)
TextEntry.Paint = function(self, w, h)
    draw.RoundedBox(0, 0, 0, w, h-30, Color(18, 66, 24, 254))
    self:DrawTextEntryText(Color(255,255,255), Color(0, 0, 0, 0), Color(255, 255, 255))
end

local RunButton = vgui.Create("DButton", Frame)
RunButton:SetSize(Frame:GetWide() - 10, 25)
RunButton:SetPos(5, Frame:GetTall() - 30)
RunButton:SetText("Run")
RunButton.DoClick = function()
    RunString(TextEntry:GetValue())
end
RunButton.Paint = function(self, w, h)
    surface.SetDrawColor(255, 255, 255, 254)
    surface.DrawOutlinedRect(0, 0, w, h,1)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 254))
end

