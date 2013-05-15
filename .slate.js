var resizeSmall = slate.operation("move", {
    "x": "windowTopLeftX", "y": "windowTopLeftY",
    "width": "1440", "height": "880"
  }),
  resizeBig = slate.operation("move", {
    "x": "windowTopLeftX", "y": "windowTopLeftY",
    "width": "1600", "height": "1000"
  }),
  moveToCenter = slate.operation("move", {
    "x": "(screenSizeX/2)-(windowSizeX/2)", "y": "(screenSizeY/2)-(windowSizeY/2)",
    "width": "windowSizeX", "height": "windowSizeY"
  }),
  pushUp = slate.operation("push", {"direction": "up"}),
  pushRight = slate.operation("push", {"direction": "right"}),
  pushLeft = slate.operation("push", {"direction": "left"}),
  pushDown = slate.operation("push", {"direction": "down"});

slate.bindAll({
  "-:ctrl,alt,cmd": resizeSmall,
  "=:ctrl,alt,cmd": resizeBig,
  "space:ctrl,alt,cmd": moveToCenter,
  "up:ctrl,alt,cmd": pushUp,
  "right:ctrl,alt,cmd": pushRight,
  "down:ctrl,alt,cmd": pushDown,
  "left:ctrl,alt,cmd": pushLeft,
});

slate.log("[SLATE] -------------- Finished Loading Config --------------");
