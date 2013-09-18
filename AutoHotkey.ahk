; FFXIV Helper
; Copyright 2013 Aria Bennett Troutt

; TODO
; Implement Sprint Repeater
; Make customizable chocobo music (figure out which songs are loaded into game)

#InstallKeybdHook
#useHook On

#IfWinActive, FINAL FANTASY XIV: A Realm Reborn
{
  ; Global Variables
  global craftMode := "none"
  
  ; Global Functions
  checkIfStop()
  {
    if (stop)
    {
      return
    }
  }
  spamEnter()
  {
    ; Send enter key 5 times and set up for next round
    Sleep 4000
    checkIfStop() ;
    ControlSend, , {Numpad0}, ahk_class FFXIVGAME
    Sleep 100
    checkIfStop() ;    
    ControlSend, , {Numpad0}, ahk_class FFXIVGAME
    Sleep 100
    checkIfStop() ;
    ControlSend, , {Numpad0}, ahk_class FFXIVGAME
    Sleep 100
    checkIfStop() ;
    ControlSend, , {Numpad0}, ahk_class FFXIVGAME
    Sleep 100
    checkIfStop() ;
    ControlSend, , {Numpad0}, ahk_class FFXIVGAME
    Sleep 3000
    checkIfStop() ;
  }
  pressKeyMultipleTimes(key, times) 
  {
    Loop, %times%
    {
      ControlSend, , {%key%}, ahk_class FFXIVGAME 
      Sleep 4000
      checkIfStop() ;
      return ;
    }
  }
  setCraftMode(craft) {
    MsgBox, 4, , Craft switched to:  %craft% ;
    craftMode = %craft% ;
    stop := 0
    return ;
  }



  ;Press ctrl- 1300ms after 1 is pressed
  $1::
    Send {1} ;
    sleep 1300 ;
    Send {LControl Down} ;
    sleep 50 ;
    Send - ; 
    sleep 50 ;
    Send {LControl Up} ;
    return ;

  ;Press ctrl= 1300m2222s after 2 is pressed
  $2::
    Send {2} ;
    sleep 1300 ;
    Send {LControl Down} ;
    sleep 50 ;
    Send {=} ; 
    sleep 50 ;
    Send {LControl Up} ;
    return ;

  ;Press / on the numpad to start doing selected craft
  NumpadDiv::
  
    ;Fishing!
    if (craftMode == "fishing")
    {
      Loop, 
      { 
        ControlSend, , {1}, ahk_class FFXIVGAME 
        Sleep 20000
        checkIfStop() ;
        ControlSend, , {2}, ahk_class FFXIVGAME
        Sleep 3000  
        checkIfStop() ;
      }
      return ;
    }    
    ;Cooking!
    if (craftMode == "cooking")
    {
      Loop, 
      {
        pressKeyMultipleTimes(3, 1) ;        
        pressKeyMultipleTimes(1, 3) ;
        pressKeyMultipleTimes(2, 1) ;        
        pressKeyMultipleTimes(1, 1) ;
        spamEnter() ;       
      }
      return ;
    }
    
    ;Goldsmithing!
    if (craftMode == "goldsmithing")
    {
      Loop, 
      {
        pressKeyMultipleTimes(4, 1) ;
        pressKeyMultipleTimes(5, 1) ;
        pressKeyMultipleTimes(1, 5) ;
        pressKeyMultipleTimes(2, 4) ;
        spamEnter() ;
      }
      return ;
    }
    ;Leatherworking!
    if (craftMode == "leatherworking")
    {      
      Loop,
      {
        pressKeyMultipleTimes(1, 1) ;
        pressKeyMultipleTimes(2, 3) ;
        spamEnter() ;
      }
      return ;
    }    
    ;Armorcrafting!
    if (craftMode == "armorcrafting")
    {
      Loop,
      {
        pressKeyMultipleTimes(2, 3) ;
        pressKeyMultipleTimes(3, 1) ;
        pressKeyMultipleTimes(2, 3) ;
        pressKeyMultipleTimes(1, 1) ;
        spamEnter() ;
      }
      return ;
    }    
    ;Blacksmithing!
    if (craftMode == "blacksmithing")
    {
      Loop,
      {
        pressKeyMultipleTimes(1, 1) ;
        spamEnter() ;
      }
      return ;
    }
    
    return ;

  ;Press * on the numpad to STOP!
  NumpadMult:: 
    stop := 1 ;
    MsgBox, 4, , stop is %stop% ;
    return

  ;Press - on the numpad followed by a key to switch crafting modes
  NumpadSub & Numpad0::
    setCraftMode("fishing") ;
    return ;
  NumpadSub & Numpad1::   
    setCraftMode("cooking") ;
    return ;
  NumpadSub & Numpad2::
    setCraftMode("goldsmithing") ;
    return ;
  NumpadSub & Numpad3::
    setCraftMode("leatherworking") ;
    return ;
  NumpadSub & Numpad4::
    setCraftMode("armorcrafting") ;
    return ;
  NumpadSub & Numpad5::
    setCraftMode("blacksmithing") ;
    return ;
    
    
  return ;
}
