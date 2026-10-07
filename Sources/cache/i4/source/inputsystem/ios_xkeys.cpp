#include "inputsystem.h"
#include "tier1/convar.h"
// [will] BEGIN - These were copied from xcontroller.cpp for X360 button press emulation in OSX.
// We don't want to fully support XController on OSX, just enough to emulate Xbox Controller button presses.
// So instead of #defining out half of xcontroller.cpp for OSX, just copied it here.
#if !defined( _CERT )

#define XBX_MAX_BUTTONSAMPLE		32768
#define XBX_MAX_ANALOGSAMPLE		255
#define XBX_MAX_STICKSAMPLE_LEFT	32768
#define XBX_MAX_STICKSAMPLE_RIGHT	32767
#define XBX_MAX_STICKSAMPLE_DOWN	32768
#define XBX_MAX_STICKSAMPLE_UP		32767

#define XBX_STICK_SCALE_LEFT(x) 	( ( float )XBX_MAX_STICKSAMPLE_LEFT/( float )( XBX_MAX_STICKSAMPLE_LEFT-(x) ) )
#define XBX_STICK_SCALE_RIGHT(x) 	( ( float )XBX_MAX_STICKSAMPLE_RIGHT/( float )( XBX_MAX_STICKSAMPLE_RIGHT-(x) ) )
#define XBX_STICK_SCALE_DOWN(x) 	( ( float )XBX_MAX_STICKSAMPLE_DOWN/( float )( XBX_MAX_STICKSAMPLE_DOWN-(x) ) )
#define XBX_STICK_SCALE_UP(x)	 	( ( float )XBX_MAX_STICKSAMPLE_UP/( float )( XBX_MAX_STICKSAMPLE_UP-(x) ) )

#define XBX_STICK_SMALL_THRESHOLD	((int)( 0.20f * XBX_MAX_STICKSAMPLE_LEFT ))

// Threshold for counting analog movement as a button press
#define JOYSTICK_ANALOG_BUTTON_THRESHOLD	XBX_MAX_STICKSAMPLE_LEFT * 0.4f
//-----------------------------------------------------------------------------
//	Purpose: Post Xbox events, ignoring key repeats
//-----------------------------------------------------------------------------
void CInputSystem::PostXKeyEvent( int userId, xKey_t xKey, int nSample )
{
	AnalogCode_t	code	= ANALOG_CODE_LAST;
	float			value	= 0.f;

	// Map the physical controller slot to the split screen slot
#if defined( _GAMECONSOLE )
	int nMsgSlot = XBX_GetSlotByUserId( userId );
	#ifdef _PS3
	if ( ( XBX_GetNumGameUsers() <= 1 ) && !ps3_joy_ss.GetBool() )
	{
		// In PS3 START button identification mode START key notification
		// is replaced with INACTIVE_START notification that can identify
		// controller that pressed the button
		if ( ( xKey == XK_BUTTON_START ) && ( nMsgSlot < 0 )
			&& ( ( Plat_FloatTime() - g_ps3_flTimeStartButtonIdentificationMode ) < 0.5f ) )
		{
			xKey = XK_BUTTON_INACTIVE_START;
			nMsgSlot = userId;
		}
		else
		{
			// When we don't have splitscreen then any controller can
			// play and will be visible as controller #0
			nMsgSlot = 0;
		}
	}
	#endif
	if ( nMsgSlot < 0 )
	{
		// special case, that if you press start on a controller we've marked inactive, switch it to an
		// XK_BUTTON_INACTIVE_START which you can handle joins from inactive controllers
		if ( xKey == XK_BUTTON_START )
		{
			xKey = XK_BUTTON_INACTIVE_START;
			nMsgSlot = userId;
		}
		else
		{
			return; // We are not listening to this controller (not signed in and assigned)
		}
	}
#else //defined( _GAMECONSOLE )
	int nMsgSlot = userId;
#endif //defined( _GAMECONSOLE )

	int nSampleThreshold = 0;

	// Look for changes on the analog axes
	switch( xKey )
	{
	case XK_STICK1_LEFT:
	case XK_STICK1_RIGHT:
		{
			code = (AnalogCode_t)JOYSTICK_AXIS( nMsgSlot, JOY_AXIS_X );
			value = ( xKey == XK_STICK1_LEFT ) ? -nSample : nSample;
			nSampleThreshold = ( int )( JOYSTICK_ANALOG_BUTTON_THRESHOLD );
		}
		break;

	case XK_STICK1_UP:
	case XK_STICK1_DOWN:
		{
			code = (AnalogCode_t)JOYSTICK_AXIS( nMsgSlot, JOY_AXIS_Y );
			value = ( xKey == XK_STICK1_UP ) ? -nSample : nSample;
			nSampleThreshold = ( int )( JOYSTICK_ANALOG_BUTTON_THRESHOLD );
		}
		break;

	case XK_STICK2_LEFT:
	case XK_STICK2_RIGHT:
		{
			code = (AnalogCode_t)JOYSTICK_AXIS( nMsgSlot, JOY_AXIS_U );
			value = ( xKey == XK_STICK2_LEFT ) ? -nSample : nSample;
			nSampleThreshold = ( int )( JOYSTICK_ANALOG_BUTTON_THRESHOLD );
		}
		break;

	case XK_STICK2_UP:
	case XK_STICK2_DOWN:
		{
			code = (AnalogCode_t)JOYSTICK_AXIS( nMsgSlot, JOY_AXIS_R );
			value = ( xKey == XK_STICK2_UP ) ? -nSample : nSample;
			nSampleThreshold = ( int )( JOYSTICK_ANALOG_BUTTON_THRESHOLD );
		}
		break;
	}

	// Store the analog event
	if ( ANALOG_CODE_LAST != code )
	{
		InputState_t &state = m_InputState[ m_bIsPolling ];
		state.m_pAnalogDelta[ code ] = ( int )( value - state.m_pAnalogValue[ code ] );
		state.m_pAnalogValue[ code ] = ( int )value;
		if ( state.m_pAnalogDelta[ code ] != 0 )
		{
			PostEvent( IE_AnalogValueChanged, m_nLastSampleTick, code, ( int )value, state.m_pAnalogDelta[ code ] );
		}
	}

	// store the key
	m_appXKeys[userId][xKey].sample = nSample;
	if ( nSample > nSampleThreshold )
	{
		m_appXKeys[userId][xKey].repeats++;
	}
	else
	{
		m_appXKeys[userId][xKey].repeats = 0;
		nSample = 0;
	}

	if ( m_appXKeys[userId][xKey].repeats > 1 )
	{
		// application cannot handle streaming keys
		// first keypress is the only edge trigger
		return;
	}

	// package the key
	ButtonCode_t buttonCode = XKeyToButtonCode( nMsgSlot, xKey );
	if ( nSample )
	{
		PostButtonPressedEvent( IE_ButtonPressed, m_nLastSampleTick, buttonCode, buttonCode );

		// [dkorus] check whether we're trying to set the current controller
		if( ( buttonCode == KEY_XBUTTON_A || buttonCode == XK_BUTTON_START )
			&& m_setCurrentInputDeviceOnNextButtonPress )
		{
			if( IsInputDeviceConnected( INPUT_DEVICE_GAMEPAD ) )
			{
				SetCurrentInputDevice( INPUT_DEVICE_GAMEPAD );
				ConVarRef var( "joystick" );
				if( var.IsValid( ) )
					var.SetValue( 1 );
				m_setCurrentInputDeviceOnNextButtonPress = false;
			}
		}

	}
	else
	{
		PostButtonReleasedEvent( IE_ButtonReleased, m_nLastSampleTick, buttonCode, buttonCode );
	}
}
#endif // _CERT
