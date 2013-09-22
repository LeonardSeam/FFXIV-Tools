; FFXIV Helper
; Copyright 2013 Aria Bennett Troutt

; TODO
; Implement Sprint Repeater
; Make customizable chocobo music (figure out which songs are loaded into game)

#InstallKeybdHook
#useHook On

#IfWinActive, FINAL FANTASY XIV: A Realm Reborn
{

  ; Global Settings
  SetKeyDelay, 20
  ; Global Variables
  global craftMode := "none" ;
  global stop := 1 ;
  global fishingCounter := 0 ;
  
  ; Global Functions
  spamConfirm()
  {
    ; Send enter key 5 times and set up for next round
    Sleep 4000
    ControlSend, , {Numpad0}, ahk_class FFXIVGAME
    Sleep 100
    ControlSend, , {Numpad0}, ahk_class FFXIVGAME
    Sleep 100
    ControlSend, , {Numpad0}, ahk_class FFXIVGAME
    Sleep 100
    ControlSend, , {Numpad0}, ahk_class FFXIVGAME
    Sleep 100
    ControlSend, , {Numpad0}, ahk_class FFXIVGAME
    Sleep 3000
  }
  pressKeyMultipleTimes(key, times) 
  {
    Loop, %times%
    {
      ControlSend, , {%key%}, ahk_class FFXIVGAME 
      Sleep 4000
    }
    return ;
  }
  setCraftMode(craft) 
  {
    MsgBox, 4, , Craft switched to:  %craft% ;
    craftMode = %craft% ;
    return ;
  }
  movePlayerForward() 
  {
    Send {w Down} ;
    Sleep 20000 ;
    Send {w Up} ;
  }
  movePlayerLeft() 
  {
    Send {q Down} ;
    Sleep 20000 ;
    Send {q Up} ;
  }
  movePlayerRight() 
  {
    Send {e Down} ;
    Sleep 20000 ;
    Send {e Up} ;
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

  ;Press ctrl= 1300ms after 2 is pressed
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

    stop := 0 ;
  
    ;Fishing!
    if (craftMode == "fishing")
    {
      Loop, 
      { 
        if (stop) 
        {
          return ;
        }
        ControlSend, , {1}, ahk_class FFXIVGAME 
        Sleep 20000
        ControlSend, , {2}, ahk_class FFXIVGAME
        Sleep 3000  
        fishingCounter++ ;
        if (fishingCounter == 30)
        {
          Sleep 20000
          movePlayerLeft() ;
        }
        if (fishingCounter == 60)
        {
          Sleep 20000
          movePlayerRight() ;
          fishingCounter := 0 ;
        }

      }
      return ;
    }    
    ;Cooking!
    if (craftMode == "cooking")
    {
      Loop, 
      {
        if (stop) 
        {
          return ;
        }
        pressKeyMultipleTimes(3, 1) ;        
        pressKeyMultipleTimes(1, 3) ;
        pressKeyMultipleTimes(2, 1) ;        
        pressKeyMultipleTimes(1, 1) ;
        spamConfirm() ;       
      }
      return ;
    }
    
    ;Goldsmithing!
    if (craftMode == "goldsmithing")
    {
      Loop, 
      {
        if (stop) 
        {
          return ;
        }
        pressKeyMultipleTimes(4, 1) ;
        pressKeyMultipleTimes(5, 1) ;
        pressKeyMultipleTimes(1, 5) ;
        pressKeyMultipleTimes(2, 4) ;
        spamConfirm() ;
      }
      return ;
    }
    ;Leatherworking!
    if (craftMode == "leatherworking")
    {      
      Loop,
      {
        if (stop) 
        {
          return ;
        }
        pressKeyMultipleTimes(1, 1) ;
        pressKeyMultipleTimes(2, 3) ;
        spamConfirm() ;
      }
      return ;
    }    
    ;Armorcrafting!
    if (craftMode == "armorcrafting")
    {
      Loop,
      {
        if (stop) 
        {
          return ;
        }
        pressKeyMultipleTimes(2, 3) ;
        pressKeyMultipleTimes(3, 1) ;
        pressKeyMultipleTimes(2, 3) ;
        pressKeyMultipleTimes(1, 1) ;
        spamConfirm() ;
      }
      return ;
    }    
    ;Blacksmithing!
    if (craftMode == "blacksmithing")
    {
      Loop,
      {
        if (stop) 
        {
          return ;
        }
        pressKeyMultipleTimes(1, 1) ;
        spamConfirm() ;
      }
      return ;
    }
    ;Alchemy!
    if (craftMode == "alchemy")
    {
      Loop,
      {
        if (stop) 
        {
          return ;
        }
        pressKeyMultipleTimes(3, 1) ;
        pressKeyMultipleTimes(2, 3) ;
        pressKeyMultipleTimes(1, 4) ;
        spamConfirm() ;
      }
      return ;
    }
    ;Carpentry!
    if (craftMode == "carpentry")
    {
      Loop,
      {
        if (stop) 
        {
          return ;
        }
        pressKeyMultipleTimes(1, 1) ;
        spamConfirm() ;
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
  NumpadSub & Numpad6::
    setCraftMode("alchemy") ;
    return ;
  NumpadSub & Numpad7::
    setCraftMode("carpentry") ;
    return ;
  NumpadSub & NumpadAdd::
    movePlayerForward() ;
    return ;
    
    
  return ;
}
