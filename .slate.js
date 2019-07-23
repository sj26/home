var resizeSmall = slate.operation("move", {
    x: "windowTopLeftX", y: "windowTopLeftY",
    width: "1440", height: "880"
  }),
  resizeBig = slate.operation("move", {
    x: "windowTopLeftX", y: "windowTopLeftY",
    width: "1600", height: "1000"
  }),

  fill = slate.operation("move", {
    x: "(screenOriginX)", y: "(screenOriginY)",
    width: "(screenSizeX)", height: "(screenSizeY)"
  }),

  fillTopHalf = slate.operation("move", {
    x: "(screenOriginX)", y: "(screenOriginY)",
    width: "(screenSizeX)", height: "(screenSizeY / 2)"
  }),
  fillBottomHalf = slate.operation("move", {
    x: "(screenOriginX)", y: "(screenOriginY + screenSizeY / 2)",
    width: "(screenSizeX)", height: "(screenSizeY / 2)"
  }),

  fillLeftHalf = slate.operation("move", {
    x: "(screenOriginX)", y: "(screenOriginY)",
    width: "(screenSizeX / 2)", height: "(screenSizeY)"
  }),
  fillRightHalf = slate.operation("move", {
    x: "(screenOriginX + screenSizeX / 2)", y: "(screenOriginY)",
    width: "(screenSizeX / 2)", height: "(screenSizeY)"
  }),

  fillTopLeftQuarter = slate.operation("move", {
    x: "(screenOriginX)", y: "(screenOriginY)",
    width: "(screenSizeX / 2)", height: "(screenSizeY / 2)"
  }),
  fillBottomLeftQuarter = slate.operation("move", {
    x: "(screenOriginX)", y: "(screenOriginY + screenSizeY / 2)",
    width: "(screenSizeX / 2)", height: "(screenSizeY / 2)"
  }),
  fillTopRightQuarter = slate.operation("move", {
    x: "(screenOriginX + screenSizeX / 2)", y: "(screenOriginY)",
    width: "(screenSizeX / 2)", height: "(screenSizeY / 2)"
  }),
  fillBottomRightQuarter = slate.operation("move", {
    x: "(screenOriginX + screenSizeX / 2)", y: "(screenOriginY + screenSizeY / 2)",
    width: "(screenSizeX / 2)", height: "(screenSizeY / 2)"
  }),

  moveToCenter = slate.operation("move", {
    x: "(screenSizeX / 2) - (windowSizeX / 2)",
    y: "(screenSizeY / 2) - (windowSizeY / 2)",
    width: "windowSizeX", height: "windowSizeY"
  }),

  pushUp = slate.operation("push", {direction: "up"}),
  pushRight = slate.operation("push", {direction: "right"}),
  pushLeft = slate.operation("push", {direction: "left"}),
  pushDown = slate.operation("push", {direction: "down"}),

  pushRightOrMoveRight = function(win) {
    var winRect = win.rect(),
      winRight = winRect.x + winRect.width,
      screen = win.screen(),
      screenRect = screen.rect(),
      screenRight = screenRect.x + screenRect.width;

    if (winRight >= screenRight) {
      var newScreenX = screenRight,
        newScreenY = winRect.y,
        newScreen = slate.screenUnderPoint({x: newScreenX, y: newScreenY});
      if (newScreen) {
        win.move({"screen": newScreen.id(), x: newScreenX, y: newScreenY});
      }
    } else {
      win.doOperation(pushRight);
    }
  },
  pushLeftOrMoveLeft = function(win) {
    var winRect = win.rect(),
      winLeft = winRect.x,
      screen = win.screen(),
      screenRect = screen.rect(),
      screenLeft = screenRect.x;

    if (winLeft <= screenLeft) {
      var newScreenX = screenLeft - winRect.width,
        newScreenY = winRect.y,
        newScreen = slate.screenUnderPoint({x: newScreenX, y: newScreenY});
      if (newScreen) {
        win.move({"screen": newScreen.id(), x: newScreenX, y: newScreenY});
      }
    } else {
      win.doOperation(pushLeft);
    }
  };

slate.bindAll({
  "-:ctrl,alt,cmd": resizeSmall,
  "=:ctrl,alt,cmd": resizeBig,

  "backslash:ctrl,alt,cmd": fill,

  "p:ctrl,alt,cmd": fillTopHalf,
  ";:ctrl,alt,cmd": fillBottomHalf,
  "[:ctrl,alt,cmd": fillLeftHalf,
  "]:ctrl,alt,cmd": fillRightHalf,

  "i:ctrl,alt,cmd": fillTopLeftQuarter,
  "o:ctrl,alt,cmd": fillTopRightQuarter,
  "k:ctrl,alt,cmd": fillBottomLeftQuarter,
  "l:ctrl,alt,cmd": fillBottomRightQuarter,

  "space:ctrl,alt,cmd": moveToCenter,

  "up:ctrl,alt,cmd": pushUp,
  "right:ctrl,alt,cmd": pushRightOrMoveRight,
  "down:ctrl,alt,cmd": pushDown,
  "left:ctrl,alt,cmd": pushLeftOrMoveLeft,
});

slate.log("[SLATE] -------------- Finished Loading Config --------------");
