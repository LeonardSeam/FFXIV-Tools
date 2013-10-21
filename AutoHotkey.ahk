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
  ; SetKeyDelay, 20
  ; SendMode Input

  ; Global Variables
  global craftMode := "none" ;
  global stop := 1 ;
  global fishingCounter := 0 ;
  global isSprinting := 0 ;
  
  ; Global Functions
  spamConfirm()
  {
    ; Send enter key 5 times and set up for next round
    Sleep 3000
    ControlSend, , {Numpad0}, ahk_class FFXIVGAME
    Sleep 100
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
      Sleep 3000
    }
    return ;
  }
  setCraftMode(craft) 
  {
    MsgBox, 4, , Craft switched to:  %craft% ;
    craftMode = %craft% ;
    return ;
  }
  movePlayerForward(duration) 
  {
    ControlSend, , {w Down}, ahk_class FFXIVGAME 
    Sleep %duration% ;
    ControlSend, , {w Up}, ahk_class FFXIVGAME 
    Sleep 200 ;
  }
  movePlayerLeft() 
  {
    ControlSend, , {q Down}, ahk_class FFXIVGAME 
    Sleep 20000 ;
    ControlSend, , {q Up}, ahk_class FFXIVGAME 
    Sleep 200 ;
  }
  movePlayerRight() 
  {
    ControlSend, , {e Down}, ahk_class FFXIVGAME 
    Sleep 20000 ;
    ControlSend, , {e Up}, ahk_class FFXIVGAME 
    Sleep 200 ;
  }
  turnPlayerLeft(duration) 
  {
    ControlSend, , {a Down}, ahk_class FFXIVGAME 
    Sleep %duration% ;
    ControlSend, , {a Up}, ahk_class FFXIVGAME 
    Sleep 200 ;
  }
  turnPlayerRight(duration) 
  {
    ControlSend, , {d Down}, ahk_class FFXIVGAME 
    Sleep %duration% ;
    ControlSend, , {d Up}, ahk_class FFXIVGAME 
    Sleep 200 ;
  }
  mine()
  {
    ControlSend, , {F12}, ahk_class FFXIVGAME 
    spamConfirm() ;
    ControlSend, , {F12}, ahk_class FFXIVGAME 
    spamConfirm() ;
    ControlSend, , {F12}, ahk_class FFXIVGAME 
    spamConfirm() ;
    ControlSend, , {F12}, ahk_class FFXIVGAME 
    spamConfirm() ;
    ControlSend, , {F12}, ahk_class FFXIVGAME 
    spamConfirm() ;
    Sleep 2000 ;
  }
  spamKey(key)
  {
    Loop, 5 
      {
        Send {%key%} ;
        Sleep 20 ;
      }
    return ;
  }



  ;Press ctrl+0 after 1 is pressed 
  $1::
    spamKey(1) ;
    sleep 1300 ;
    Send {LControl Down} ;
    sleep 20 ;
    spamKey(0) ;
    sleep 20 ;
    Send {LControl Up} ;
    sleep 20 ;
    return ;

  ;Press ctrl- 1300ms after 2 is pressed
  $2::
    spamKey(2) ;
    sleep 1300 ;
    Send {LControl Down} ;
    sleep 20 ;
    spamKey(-) ;
    sleep 20 ;
    Send {LControl Up} ;
    sleep 20 ;
    return ;

  ;Press ctrl= 1300ms after 3 is pressed
  $3::
    spamKey(3) ;
    sleep 1300 ;
    Send {LControl Down} ;
    sleep 20 ;
    spamKey(=) ;
    sleep 20 ;
    Send {LControl Up} ;
    sleep 20 ;
    return ;

  $4::
    spamKey(4) ;
    return ;

  $5::
    spamKey(5) ;
    return ;

  $6::
    spamKey(6) ;
    return ;

  $7::
    spamKey(7) ;
    return ;

  $8::
    spamKey(8) ;
    return ;

  $9::
    spamKey(9) ;
    return ;

  $0::
    spamKey(0) ;
    return ;


  ;Sprint Forever -  Press + to enable/disable running forever
  NumpadAdd::
    Loop,
    {
      ControlSend, , {Pause}, ahk_class FFXIVGAME 
      sleep 32000
    }


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
        pressKeyMultipleTimes(2, 3) ;        
        pressKeyMultipleTimes(3, 1) ;        
        pressKeyMultipleTimes(4, 1) ;        
        pressKeyMultipleTimes(7, 1) ;        
        pressKeyMultipleTimes(1, 3) ;        
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
        pressKeyMultipleTimes(1, 1) ;
        pressKeyMultipleTimes(2, 1) ;
        pressKeyMultipleTimes(3, 3) ;
        pressKeyMultipleTimes(4, 1) ;
        pressKeyMultipleTimes(3, 1) ;
        pressKeyMultipleTimes(2, 1) ;
        pressKeyMultipleTimes(3, 2) ;
        pressKeyMultipleTimes(6, 1) ;
        pressKeyMultipleTimes(4, 1) ;
        pressKeyMultipleTimes(3, 2) ;
        pressKeyMultipleTimes(5, 2) ;
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
        pressKeyMultipleTimes(5, 1) ;
        pressKeyMultipleTimes(1, 5) ;
        pressKeyMultipleTimes(7, 1) ;
        pressKeyMultipleTimes(1, 5) ;
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
        pressKeyMultipleTimes(5, 1) ;
        pressKeyMultipleTimes(1, 1) ;
        pressKeyMultipleTimes(2, 3) ;
        pressKeyMultipleTimes(4, 1) ;
        pressKeyMultipleTimes(1, 1) ;
        pressKeyMultipleTimes(3, 4) ;
        pressKeyMultipleTimes(2, 1) ;
        sleep 5000
        MouseMove 669, 234 
        click 3
        sleep 3000
        MouseMove 760, 550 
        click 3
        sleep 3000
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
        pressKeyMultipleTimes(2, 1) ;
        pressKeyMultipleTimes(3, 2) ;
        pressKeyMultipleTimes(4, 3) ;
        pressKeyMultipleTimes(5, 1) ;
        pressKeyMultipleTimes(2, 1) ;
        pressKeyMultipleTimes(4, 3) ;
        pressKeyMultipleTimes(3, 1) ;
        spamConfirm() ;
      }
      return ;
    }
    ;Weaving!
    if (craftMode == "weaving")
    {
      Loop,
      {
        if (stop) 
        {
          return ;
        }
        pressKeyMultipleTimes(1, 1) ;
        pressKeyMultipleTimes(2, 1) ;
        pressKeyMultipleTimes(3, 3) ;
        pressKeyMultipleTimes(5, 2) ;
        pressKeyMultipleTimes(4, 1) ;
        pressKeyMultipleTimes(2, 1) ;
        pressKeyMultipleTimes(5, 3) ;
        pressKeyMultipleTimes(3, 1) ;
        spamConfirm() ;
      }
      return ;
    }
    ;buyFireworks!
    if (craftMode == "buyFireworks")
    {
      Loop, 
      { 
        if (stop) 
        {
          return ;
        }
        MouseMove 100, 333
        Sleep 200 
        Click right
        MouseMove 575, 75 
        Sleep 200 
        MouseMove 575, 75 
        Sleep 200 
        Click right
        Click right
        MouseMove 610, 80 
        Sleep 200 
        MouseMove 610, 80 
        Sleep 200 
        Click 2
        MouseMove 600, 115 
        Sleep 200 
        MouseMove 600, 115 
        Sleep 200 
        Click 2
        MouseMove 100, 333
        Sleep 200 
        MouseMove 100, 333
        Sleep 200 
        Click right
        Click right
        Sleep 200 
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
  NumpadSub & Numpad8::
    setCraftMode("weaving") ;
    return ;
  NumpadSub & Numpad9::
    setCraftMode("buyFireworks") ;
    return ;
  NumpadSub & NumpadAdd::
    movePlayerForward(4000) ;
    turnPlayerLeft(880) ;
    movePlayerForward(9000) ;
    mine() ;
    turnPlayerRight(1200) ;
    movePlayerForward(1000) ;
    turnPlayerLeft(300) ;
    mine() ;
    turnPlayerRight(300) ;
    movePlayerForward(6500) ;
    turnPlayerLeft(610) ;
    movePlayerForward(4600) ;
    mine() ;
    turnPlayerLeft(880) ;
    movePlayerForward(6500) ;
    mine() ;
    turnPlayerRight(880) ;
    movePlayerForward(6500) ;
    turnPlayerRight(918) ;
    movePlayerForward(2000) ;
    turnPlayerLeft(610) ;
    mine() ;
    turnPlayerRight(1300) ;
    movePlayerForward(15000) ;

    return ;
    ; turnPlayerLeft(880) 
    
    
  return ;
}
