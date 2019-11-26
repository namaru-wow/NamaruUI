local ADDON_NAME, NUI = ...

local format = string.format

local AddonTitle = select( 2, GetAddOnInfo( ADDON_NAME ) )

function NUI:Print( ... )
	print( ( '[%s]' ):format( AddonTitle ), ... )
end

function NUI:Debug( Module, ... )
	if( not self['DEBUG'] ) then
		return
	end

	Debug = NUI.StringFormat:ColorString( 'DEBUG', unpack( NUI['Config']['Profile']['Colors']['Text']['Red'] ) )
	NUI:Print( ( '<%s:%s>' ):format( Debug, Module ), ... )
end
