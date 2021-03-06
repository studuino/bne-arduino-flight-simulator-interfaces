function layout()
return {
forceFeedback = {
trimmer = 1,
shake = 0.5,
swapAxes = false,
invertX = false,
invertY = false,
},
keyCommands = {
{down = iCommandMarkerStatePlane, name = "Aircraft Labels", category = "Labels"},
{down = iCommandMarkerState, name = "All Labels", category = "Labels"},
{down = iCommandViewBriefing, name = "Briefing window", category = "General"},
{down = iCommandViewCameraJiggle, name = "Camera jiggle toggle", category = "View Extended"},
{down = iCommandViewPlus, name = "Camera ordnance tracking", category = "View Extended"},
{down = iCommandToggleCommandMenu, name = "Communication menu", category = "Communications"},
{down = iCommandViewCoordinatesInLinearUnits, name = "Coordinates units change", category = "General"},
{down = iCommandQuit, name = "End mission", category = "General"},
{down = iCommandViewCockpit, name = "F1 Cockpit view", category = "View"},
{down = iCommandViewHUDOnlyOnOff, name = "F1 HUD only view switch", category = "View"},
{down = iCommandViewPitHeadOnOff, name = "F1 Head shift movement on / off", category = "View"},
{down = iCommandNaturalViewCockpitIn, name = "F1 Natural head movement view", category = "View"},
{down = iCommandViewAWACSJump, name = "F10 Jump to theater map view over current point", category = "View"},
{down = iCommandViewAWACS, name = "F10 Theater map view", category = "View"},
{down = iCommandViewFree, name = "F11 Airport free camera", category = "View"},
{down = iCommandViewFreeJump, name = "F11 Jump to free camera", category = "View"},
{down = iCommandViewSlowDown, name = "F11 camera moving backward", category = "View"},
{down = iCommandViewSpeedUp, name = "F11 camera moving forward", category = "View"},
{down = iCommandViewMirage, name = "F12 Civil traffic view", category = "View"},
{down = iCommandViewStatic, name = "F12 Static object view", category = "View"},
{down = iCommandViewLocomotivesToggle, name = "F12 Trains/cars toggle", category = "View"},
{down = iCommandViewAir, name = "F2 Aircraft view", category = "View"},
{down = iCommandViewFromTo, name = "F2 Toggle camera position", category = "View"},
{down = iCommandViewLocal, name = "F2 Toggle local camera control", category = "View"},
{down = iCommandViewMe, name = "F2 View own aircraft", category = "View"},
{down = iCommandViewTowerJump, name = "F3 Fly-By jump view", category = "View"},
{down = iCommandViewTower, name = "F3 Fly-By view", category = "View"},
{down = iCommandViewChase, name = "F4 Chase view", category = "View"},
{down = iCommandViewRear, name = "F4 Look back view", category = "View"},
{down = iCommandViewFightGround, name = "F5 Ground hostile view", category = "View"},
{down = iCommandViewFight, name = "F5 nearest AC view", category = "View"},
{down = iCommandViewWeapons, name = "F6 Released weapon view", category = "View"},
{down = iCommandViewWeaponAndTarget, name = "F6 Weapon to target view", category = "View"},
{down = iCommandViewJFO, name = "F7 Ground JFO/JTAC view", category = "View"},
{down = iCommandViewGround, name = "F7 Ground unit view", category = "View"},
{down = iCommandViewTargetType, name = "F8 Player targets/All targets filter", category = "View"},
{down = iCommandViewTargets, name = "F8 Target view", category = "View"},
{down = iCommandViewLndgOfficer, name = "F9 Landing signal officer view", category = "View"},
{down = iCommandViewNavy, name = "F9 Ship view", category = "View"},
{down = iCommandViewFastKeyboard, name = "Fast keyboard turn speed", category = "View"},
{down = iCommandViewFastMouse, name = "Fast mouse turn speed", category = "View"},
{down = iCommandGraphicsFrameRate, name = "Frame rate counter - Service info", category = "General"},
{down = iCommandRecoverHuman, name = "Get new plane - respawn", category = "General"},
{down = iCommandInfoOnOff, name = "Info bar view toggle", category = "General"},
{down = iCommandPlaneJump, name = "Jump into other aircraft", category = "General"},
{down = iCommandViewKeepTerrain, name = "Keep terrain camera altitude", category = "View Extended"},
{down = iCommandViewTerrainLock, name = "Lock terrain view", category = "View Padlock"},
{down = iCommandViewLock, name = "Lock view (cycle padlock)", category = "View Padlock"},
{down = iCommandMarkerStateRocket, name = "Missile Labels", category = "Labels"},
{down = iCommandChat, name = "Multiplayer chat - mode All", category = "General"},
{down = iCommandFriendlyChat, name = "Multiplayer chat - mode Allies", category = "General"},
{down = iCommandViewNormalKeyboard, name = "Normal keyboard turn speed", category = "View"},
{down = iCommandViewNormalMouse, name = "Normal mouse turn speed", category = "View"},
{down = iCommandViewObjectIgnore, name = "Object exclude ", category = "View Extended"},
{down = iCommandViewObjectsAll, name = "Objects all excluded - include", category = "View Extended"},
{down = iCommandViewSwitchForward, name = "Objects switching direction forward ", category = "View Extended"},
{down = iCommandViewSwitchReverse, name = "Objects switching direction reverse ", category = "View Extended"},
{down = iCommandBrakeGo, name = "Pause", category = "General"},
{down = iCommandScoresWindowToggle, name = "Score window", category = "General"},
{down = iCommandScreenShot, name = "Screenshot", category = "General"},
{down = iCommandMissionResourcesManagement, name = "Show Mission Resources Management window", category = "General"},
{down = iCommandDebriefing, name = "Show debriefing window", category = "General"},
{down = iCommandViewSlowKeyboard, name = "Slow keyboard turn speed", category = "View"},
{down = iCommandViewSlowMouse, name = "Slow mouse turn speed", category = "View"},
{down = ICommandSwitchDialog, name = "Switch dialog", category = "Communications"},
{down = ICommandSwitchToCommonDialog, name = "Switch to main menu", category = "Communications"},
{down = iCommandAccelerate, name = "Time accelerate", category = "General"},
{down = iCommandDecelerate, name = "Time decelerate", category = "General"},
{down = iCommandNoAcceleration, name = "Time normal", category = "General"},
{down = iCommandViewUnlock, name = "Unlock view (stop padlock)", category = "View Padlock"},
{down = iCommandMarkerStateShip, name = "Vehicle & Ship Labels", category = "Labels"},
{combos = {{key = "JOY_BTN5"}, }, pressed = iCommandViewCenter, name = "View Center", category = "View"},
{combos = {{key = "JOY_BTN_POV1_DL"}, }, pressed = iCommandViewDownLeftSlow, up = iCommandViewStopSlow, name = "View Down Left slow", category = "View"},
{combos = {{key = "JOY_BTN_POV1_DR"}, }, pressed = iCommandViewDownRightSlow, up = iCommandViewStopSlow, name = "View Down Right slow", category = "View"},
{combos = {{key = "JOY_BTN_POV1_D"}, }, pressed = iCommandViewDownSlow, up = iCommandViewStopSlow, name = "View Down slow", category = "View"},
{combos = {{key = "JOY_BTN_POV1_L"}, }, pressed = iCommandViewLeftSlow, up = iCommandViewStopSlow, name = "View Left slow", category = "View"},
{combos = {{key = "JOY_BTN_POV1_R"}, }, pressed = iCommandViewRightSlow, up = iCommandViewStopSlow, name = "View Right slow", category = "View"},
{combos = {{key = "JOY_BTN_POV1_UL"}, }, pressed = iCommandViewUpLeftSlow, up = iCommandViewStopSlow, name = "View Up Left slow", category = "View"},
{combos = {{key = "JOY_BTN_POV1_UR"}, }, pressed = iCommandViewUpRightSlow, up = iCommandViewStopSlow, name = "View Up Right slow", category = "View"},
{combos = {{key = "JOY_BTN_POV1_U"}, }, pressed = iCommandViewUpSlow, up = iCommandViewStopSlow, name = "View Up slow", category = "View"},
{down = iCommandViewAll, name = "View all mode", category = "View Extended"},
{pressed = iCommandViewDown, up = iCommandViewStop, name = "View down", category = "View"},
{pressed = iCommandViewDownLeft, up = iCommandViewStop, name = "View down left", category = "View"},
{pressed = iCommandViewDownRight, up = iCommandViewStop, name = "View down right", category = "View"},
{down = iCommandViewEnemies, name = "View enemies mode", category = "View Extended"},
{down = iCommandViewFriends, name = "View friends mode", category = "View Extended"},
{pressed = iCommandViewLeft, up = iCommandViewStop, name = "View left", category = "View"},
{pressed = iCommandViewRight, up = iCommandViewStop, name = "View right", category = "View"},
{pressed = iCommandViewUp, up = iCommandViewStop, name = "View up", category = "View"},
{pressed = iCommandViewUpLeft, up = iCommandViewStop, name = "View up left", category = "View"},
{pressed = iCommandViewUpRight, up = iCommandViewStop, name = "View up right", category = "View"},
{pressed = iCommandViewExternalZoomIn, up = iCommandViewExternalZoomInStop, name = "Zoom external in", category = "View"},
{down = iCommandViewExternalZoomDefault, name = "Zoom external normal", category = "View"},
{pressed = iCommandViewExternalZoomOut, up = iCommandViewExternalZoomOutStop, name = "Zoom external out", category = "View"},
{pressed = iCommandViewForward, up = iCommandViewForwardStop, name = "Zoom in", category = "View"},
{pressed = iCommandViewForwardSlow, up = iCommandViewForwardSlowStop, name = "Zoom in slow", category = "View"},
{down = iCommandViewAngleDefault, name = "Zoom normal", category = "View"},
{pressed = iCommandViewBack, up = iCommandViewBackStop, name = "Zoom out", category = "View"},
{pressed = iCommandViewBackSlow, up = iCommandViewBackSlowStop, name = "Zoom out slow", category = "View"},
},
axisCommands = {
},
}
end