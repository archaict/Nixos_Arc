import XMonad
import System.Directory
import System.IO (hPutStrLn)
import System.Exit (exitSuccess)
import qualified XMonad.StackSet as W
import Data.Monoid
import qualified Data.Map as M
import XMonad.Actions.CopyWindow (kill1, killAllOtherCopies,copyToAll)
import XMonad.Actions.MouseResize
import XMonad.Actions.WithAll (sinkAll, killAll)
import XMonad.Actions.FloatKeys
import XMonad.Actions.CycleWS
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks (avoidStruts, docksEventHook, manageDocks, ToggleStruts(..))
import XMonad.Hooks.ManageHelpers (doRectFloat, doCenterFloat, isFullscreen, doFullFloat)
import XMonad.Hooks.Place
import XMonad.Hooks.ServerMode
import XMonad.Hooks.SetWMName
import XMonad.Layout.Reflect

import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.SimplestFloat
import XMonad.Layout.ResizableTile
import XMonad.Layout.LayoutModifier
import XMonad.Layout.ThreeColumns -- Three Column layout
import XMonad.Layout.Tabbed as Tabbed
import XMonad.Layout.Renamed
import XMonad.Layout.Simplest
import XMonad.Layout.Spacing
import XMonad.Layout.WindowNavigation
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))

import XMonad.Layout.IndependentScreens

import XMonad.Actions.Promote

import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.SpawnOnce

main :: IO ()
main = do
    home <- getHomeDirectory
    xmonad $ ewmh def
        { manageHook = ( isFullscreen --> doFullFloat ) <+> myManageHook <+> manageDocks
        , handleEventHook = docksEventHook
        , modMask         = mod4Mask
        , startupHook     = do spawnOnce "~/.config/autostart.sh" ; setWMName "LG3D"
        , layoutHook      = avoidStruts
                            $ mkToggle (single REFLECTX)
                            $ mkToggle (NOBORDERS ?? FULL ?? EOT) $ mouseResize $ windowArrange
                            $ spacingRaw True (Border 2 2 2 2) True (Border 2 2 2 2) True
                            $ tall ||| threecol
        , workspaces      = ["01", "02", "03", "04", "05"] -- <+> extraws
        , borderWidth     = 0 , normalBorderColor  = "#222" , focusedBorderColor = "#C2D94C"
        } `additionalKeysP` myKeys home

monocle  = windowNavigation $ Full
tall     = windowNavigation $ ResizableTall 1 (1/16) (1/2) []
threecol = windowNavigation $ ThreeCol 1 (3/100) (1/3)

-- extraws = withScreens 3 ["06"]

myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll
     [ className =? "pop-up"             --> doFloat
     , className =? "Mozilla Firefox"    --> doShift "02"
    --  , className =? "Vivaldi-stable"     --> doShift "04"
     , className =? "Steam"              --> doShift "04"
     , className =? "Virt-manager"       --> doShift "05"
     , className =? "qemu-system-x86_64" --> doShift "05"
     , className =? "discord"            --> doShift "01"
     , className =? "VSCodium"           --> doShift "01"
     , className =? "zoom"               --> doShift "03"
     , className =? "zoom"               --> doFloat
     , className =? "zoom_linux_float_video_window"     --> doFloat
     , className =? "firefox" <&&> resource =? "Dialog" --> doFloat
     , className =? "mpv"  --> placeHook (fixed ( 0.98,0.075 )) <+> doFloat
     , title=? "Picture in picture" --> placeHook (fixed ( 0.98,0.075 )) <+> doFloat
     , title=? "Picture in picture" --> doF copyToAll
     ]

-- bring clicked floating window to the front
floatClickFocusHandler :: Event -> X All
floatClickFocusHandler ButtonEvent { ev_window = w } = do
  withWindowSet $ \s -> do
    if isFloat w s
       then (focus w >> promote)
       else return ()
    return (All True)
    where isFloat w ss = M.member w $ W.floating ss
floatClickFocusHandler _ = return (All True)

myKeys :: String -> [([Char], X ())]
myKeys home =
        [ ("M-M1-r"   , spawn "xmonad --recompile && xmonad --restart && notify-send 'Xmonad reload'")
        -- [ ("M-M1-r"   , spawn "xmonad --recompile && xmonad --restart && pkill polybar")
        , ("M-C-r"    , spawn "xmonad --restart && pkill polybar")
        , ("M-<Space>" , spawn "dmenu_run -p NixOS -fn 'Iosevka Semibold' -nb '#0d1017' -nf '#fafafa' -sb '#fafafa' -sf '#1d2021' -b ")
        , ("M-<Return>" , spawn "alacritty")

        -- , ("M-1"      , spawn "amixer sset Master toggle")
        -- , ("M-2"      , spawn "amixer sset Master 5%-")
        -- , ("M-3"      , spawn "amixer sset Master 5%+")
        , ("M-4"      , spawn "~/bin/mic-toggle")

        , ("M-q"      , kill1)
        , ("M-a"      , windows  (W.greedyView "01"))
        , ("M-s"      , windows  (W.greedyView "02"))
        , ("M-d"      , windows  (W.greedyView "03"))
        , ("M-o"      , windows  (W.greedyView "04"))
        , ("M-p"      , windows  (W.greedyView "05"))
        , ("M-C-a"    , windows  (W.shift "01"))
        , ("M-C-s"    , windows  (W.shift "02"))
        , ("M-C-d"    , windows  (W.shift "03"))
        , ("M-C-o"    , windows  (W.shift "04"))
        , ("M-C-p"    , windows  (W.shift "05"))
        , ("M-f"      , sendMessage $ Toggle FULL)
        , ("M-e"      , sendMessage NextLayout)
        , ("M-h"      , sendMessage Shrink)
        , ("M-l"      , sendMessage Expand)
        , ("M-M1-j"   , sendMessage MirrorShrink)
        , ("M-M1-k"   , sendMessage MirrorExpand)
        , ("M-t"      , withFocused $ windows . W.sink)
        , ("M-C-t"    , sinkAll)
        , ("M-j"      , windows W.focusDown)
        , ("M-k"      , windows W.focusUp)
        , ("M-<Up>"   , windows W.swapDown)
        , ("M-<Down>" , windows W.swapUp)
        , ("M-<Left>" , prevWS)
        , ("M-<Right>", nextWS)
        , ("M-w"      , nextScreen)  -- Switch focus to next monitor
        , ("C-M-w"    , sendMessage $ Toggle REFLECTX)  -- Switch focus to next monitor
        , ("C-M1-h"   , withFocused (keysMoveWindow (-20,0)))
        , ("C-M1-j"   , withFocused (keysMoveWindow (0,20)))
        , ("C-M1-k"   , withFocused (keysMoveWindow (0,-20)))
        , ("C-M1-l"   , withFocused (keysMoveWindow (20 ,0)))
        , ("M-M1-C-h" , withFocused (keysResizeWindow (-20,0) (0,0)))
        , ("M-M1-C-j" , withFocused (keysResizeWindow (0,20) (0,0)))
        , ("M-M1-C-k" , withFocused (keysResizeWindow (0,-20) (0,0)))
        , ("M-M1-C-l" , withFocused (keysResizeWindow (20,0) (0,0)))
        ]
