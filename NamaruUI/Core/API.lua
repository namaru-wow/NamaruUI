local ADDON_NAME, NUI = ...

local floor = math.floor

function NUI:Scale( Value )
	return NUI['UIScale'] * floor( Value / NUI['UIScale'] + 0.5 )
end

function NUI:UnpackPoint( Config )
	return Config['Point'], Config['Frame'], Config['RelPoint'] or Config['Point'], NUI:Scale( Config['XOffset'] or 0 ), NUI:Scale( Config['YOffset'] or 0 )
end

function NUI:SetHeight( Frame, Height )
	Frame:SetHeight( NUI:Scale( Height ) )
end

function NUI:SetWidth( Frame, Width )
	Frame:SetWidth( NUI:Scale( Width ) )
end

function NUI:SetSize( Frame, Width, Height )
	local Width, Height = NUI:Scale( Width ), NUI:Scale( Height )

	Frame:SetSize( Width, Height )
end

function NUI:Kill( Frame )
	if( Frame['UnregisterAllEvents'] ) then
		Frame:UnregisterAllEvents()
		Frame:SetParent( NUI['HiddenFrame'] )
	end

	Frame._Show = Frame.Show
	Frame.Show = Frame.Hide

	Frame:Hide()
end
