'use strict';

var Avatar = ( function()
{
	
	var _Init = function( elAvatar, xuid, type )
	{
	  	                                      

		switch ( type )
		{
			case 'playercard':
				_SetImage( elAvatar, xuid );
				_SetFlair( elAvatar, xuid );
				_SetTeamColor( elAvatar, xuid );
				_SetLobbyLeader( elAvatar );
				break;
			default:
				_SetImage( elAvatar, xuid );
				_SetTeamColor( elAvatar, xuid );
		}
	};

	var _SetImage = function( elAvatar, xuid )
	{
        var image = elAvatar.FindChildTraverse('JsAvatarImage');
        var localId = MyPersonaAPI.GetXuid();
        var isLocal = xuid === 'local' || (localId && String(xuid) === String(localId));
        image.SetHasClass('hidden', !isLocal);
        if (isLocal) image.SetDefaultImage('file://{images}/icons/ui/player.svg');
	};

	var _SetFlair = function( elAvatar, xuid )
	{
elAvatar.FindChildTraverse('JsAvatarFlair').AddClass('hidden');
	};

	var _SetTeamColor = function( elAvatar, xuid )
	{
		var teamColor = PartyListAPI.GetPartyMemberSetting( xuid, 'game/teamcolor' );
		var elTeamColor = elAvatar.FindChildTraverse( 'JsAvatarTeamColor' );

		if ( !teamColor )
		{
			if ( elTeamColor )
				elTeamColor.AddClass( 'hidden' );

			return;
		}

		if( typeof TeamColor !== 'undefined' )
		{
			var rgbColor = TeamColor.GetTeamColor( Number( teamColor ) );
			
			elTeamColor.RemoveClass( 'hidden' );
			elTeamColor.style.washColor = 'rgb(' + rgbColor + ')';
		}
	};

	var _SetTeamLetter = function( elAvatar, xuid )
	{
		var teamColor = PartyListAPI.GetPartyMemberSetting( xuid, 'game/teamcolor' );
		var elTeamLetter = elAvatar.FindChildTraverse( 'JsAvatarTeamLetter' );
		var useLetters = false;

		if ( teamColor == '' && useLetters )
		{
			if ( elTeamLetter )
				elTeamLetter.AddClass( 'hidden' );

			return;
		}

		var teamLetter = elTeamLetter._GetTeamColorLetter( Number( teamColor ) );
		elTeamLetter.RemoveClass( 'hidden' );
		elTeamLetter.text = teamLetter;
	};

	var _SetLobbyLeader = function( elAvatar )
	{
		if ( !elAvatar.hasOwnProperty( "GetAttributeString" ) )
			return;
		
		var show = elAvatar.GetAttributeString( 'showleader', '' );
		var elLeader = elAvatar.FindChildTraverse( 'JsAvatarLeader' );
		
		if ( elLeader )
		{
			if ( show === 'show' )
				elLeader.RemoveClass( 'hidden' );
			else
				elLeader.AddClass( 'hidden' );
		}
	};

	var _UpdateTalkingState = function( elAvatar, xuid, bCalledFromScheduledFunction )
	{
		if ( !elAvatar || !elAvatar.IsValid() )
			return;

		var elSpeaking = elAvatar.FindChildTraverse( 'JsAvatarSpeaking' );
		if ( !elSpeaking )
			return;

		var bFriendIsTalking = PartyListAPI.GetFriendIsTalking( xuid );
		elSpeaking.SetHasClass( 'hidden', !bFriendIsTalking );

		if ( bFriendIsTalking && ( bCalledFromScheduledFunction || !elAvatar.GetAttributeString( 'updatetalkingstate', '' ) ) )
		{
			var schfn = $.Schedule( .1, _UpdateTalkingState.bind( this, elAvatar, xuid, true ) );
			elAvatar.SetAttributeString( 'updatetalkingstate', '' + schfn );
		}

		if ( !bFriendIsTalking )
		{
			elAvatar.SetAttributeString( 'updatetalkingstate', '' );
		}
	};

	return {
		Init: _Init,
		UpdateTalkingState : _UpdateTalkingState
	};
})();

(function()
{
	                                                                           
	                                                                                                          
})();
