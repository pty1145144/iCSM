'use strict';

var AdvertisingToggle = ( function()
{
    var elBtn = $.GetContextPanel().FindChildInLayoutFile( 'HireAdvertisingToggle' );

    var _Init = function()
    {
        _UpdateToggle();
    };

    var _UpdateToggle = function()
    {
        var strAdvertising = PartyListAPI.GetLocalPlayerForHireAdvertising();
                                                                  

        if ( PartyListAPI.GetCount() > 1 )
        {
            elBtn.SetHasClass( 'advertising-active', false );
            elBtn.enabled = false;
            UpdateTooltip( elBtn.enabled );
            return;
        }
        
        elBtn.enabled = true;
        UpdateTooltip( elBtn.enabled );
        if ( strAdvertising && strAdvertising !== '' )
        {
            elBtn.SetHasClass( 'advertising-active', true );
        }
        else
        {
            elBtn.SetHasClass( 'advertising-active', false );
        }
    };
    
    var _OnActivate = function()
    {
NativeOfflineUI.Unavailable();
	};

    var UpdateTooltip = function( isDisabled )
    {
        var OnMouseOver = function()
        {
            var tooltipText = isDisabled === false ? '#advertising_for_hire_tooltip_disabled' : '#advertising_for_hire_tooltip';
            UiToolkitAPI.ShowTitleTextTooltip( 'HireAdvertisingToggleContainer', '#advertising_for_hire_tooltip_title', tooltipText );
        };
        
        elBtn.SetPanelEvent( 'onmouseover', OnMouseOver );
        elBtn.SetPanelEvent( 'onmouseout', function() { UiToolkitAPI.HideTitleTextTooltip(); } );
    };
    


	return {
        Init: _Init,
        OnActivate: _OnActivate,
        UpdateToggle: _UpdateToggle
	};

} )();

                                                                                                    
                                           
                                                                                                    
( function()
{
	AdvertisingToggle.Init();
} )();
