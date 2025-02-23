# chaos

export projects="daylight chaos polytope spacetime sieve hyperbolic cat garage devicedb anthouse"

Privacy:
In help doc or about doc explain how to delete preferences.

https://b.corp.google.com/issues/368449630

Link something like 
The applications allow the user to change settings or preferences that are saved to the device. This is done via flutter's SharedPreferences which are backed by Android Shared Preferences on Android and LocalStorage for a web app.
https://pub.dev/packages/shared_preferences



Use this to load an asset:
  Future<String> loadAsset() async {
    try {
      _help_text = await rootBundle.loadString('assets/help.md');
    } catch (e) {
      // Android and web use different paths for assets. Try one, then try the other.
      print("There was an exception $e");
      _help_text = await rootBundle.loadString('help.md');
    }
    return _help_text;
  }


TODO: SHORT TERM.
- unit tests?
- Release next: step 4 cross tool.
- update help to use html. Add "about.html"
- copy settings theme and html from polytope.
  - maybe copy widget and scene settings from spacetime, too.
- rethink using DropdownMenu for tool selection.
- ui is ugly on chromebook. Is that just because chrome is ugly?
  - can I use a "tight" layout?
  - why is speed dropdown cropped?
  - what happens if too many tools?
- add feather density settings.
- add ui to do loop. -- part of speed. 
  - animation needs to stop and restart with boolean on backwards.
  - add ability to reset clock to zero.
  - settings controls if it is in ui.
  - Have loop checkbox. Then speed can be negative.
- where are the tooltips?
- dynamic layout trunctate buttons or text?
- fix settings.fps_throttle to use clock time. Use a clock scale somewhere else to
      handle animation controller. Is that setable somewhere else?
   -- widget has animation scale. clock time. flow can get clock time from view.
   -- world time = integral ( speed * dclock).
   -- even with speed in menu, scale a little bit so that it looks slows down.
   -- settings could have base speed.
   -- need to think about world time versus clock time.
   -- throttle repaint using clock time.
   -- throttle updates with world time.  (both large and small).
- speed slider, or buttons. (or popup menu?) -- option 2 probably has tightest ui.
   -- option 1, buttons:  < = > >> (> and >> just multiply/divide speed by 1.25)
   -- option 2: pull down menu: play (0.1, .25, .5, 1.0, 2.0, 4.0, 8.0 speed)
   -- option 3: add slider somewhere.
- add forward back check. Then think about accuracy. (mote keeps initial position)
- restrict runge kutta to dt*v < 0.1. Fix update in mote.
- run spiral for a few minutes and make sure that old motes are just deleted.
   - in mote.dart::update, make sure that position is valid.
   - test with spiral and epsilon = big number.
- compute error after loop.
- make grid one click? -- meh.
- draw feathers? -- add check box
- draw isocline button. (check box)
- add help page or info. How to show html in new window.
  -- same question;
  https://www.reddit.com/r/flutterhelp/comments/qrzm0a/what_is_the_appropriate_way_to_display_a_page_of/
    -- webview_flutter can display web page.
    -- There is also IFrameElement for displaying external web pages
    -- 
  -- looks like https://stackoverflow.com/questions/56220691/how-do-i-open-an-external-url-in-flutter-web-in-new-tab-or-in-same-tab
     recommends dart:js or dart:html with html.window.open... That does not work
     on android.
     https://stackoverflow.com/questions/69485846/import-js-dart-and-html-dart-for-a-mixed-web-mobile-flutter-project
     or url_launcher: ^6.1.0 -- this looks more supported.
   or maybe use this: https://pub.dev/packages/webview_flutter
     
     or 
     
     https://rodydavis.medium.com/displaying-html-in-flutter-8da44773764
      
  -- overview
  -- explain controls
  -- explain each example flow.
- fix the favicon.
- test on Android device.
- add talk/demo stuff. home page. (just a few pages)
- settings for font size and mote size.
- chaos isocline - need to match at edges. (still a small jag.)
- tweak button sizes, etc. -- that's a chrome issue on bruschetta.

Update isocline and feathers less often.

Read about isComplex and RepaintBoundary.

https://stackoverflow.com/questions/46702376/how-to-ensure-my-custompaint-widget-painting-is-stored-in-the-raster-cache/46706868#46706868

widget own animator


What I did (for chaos)
- created icon w/two layers and some transparency.
- exported as png to assets/icon/icon.png
- exported turned bg invisble and exported as assets/icon/foreground.png
- exported turned fg invisble and exported as assets/icon/background.png
- updated makefile for web/favicon.web.
- updated pubspec based on tutorial.
- update manifest.json. update index.html too.
- run flutter (maybe put in makefile?)
        flutter pub get
        dart run flutter_launcher_icons
notice that manifest.json changed
    - X chaos - "chaos" in odd font. dark purple, green and red letters.
    - X polytope - cube with corner slice. - dark purple background. white and green fg.
    - X daylight - clock w/"DLT". very dark purple bg. white fg.
    - X spacetime - "ST" + light cone.  yellow cone. dark blue ST. red axis.
    - X hyperbolic - "Hyp" w/circles. dark purple ellipse. light blue H.
    - X sieve - erastothenes. - picture of E. maybe different color?
    - devicedb - meh.
    - X garage - use existing. "GD". (just copy)
    - X cat - "cat" in a circle. dark purple ellipse. Cat icon face.
    - anthouse - ant in a house.

- maybe write gimp script. Rename foreground to foureground for all .



----------------------------------------------------------------------------

DONE:
- X stir isoclines. solve for x versus y.
- X create transform, initialize by size.
- X create custom painter. read tutorial.
- X create flow motes. Add four motes. (use tool?)
- X resize transform.
- X pan/zoom transform.
- X animation. some optimizations on number of paints.
- X create toolbar. higlight active tool.
  try https://api.flutter.dev/flutter/material/IconButton/IconButton.filled.html
  and use isSelected.
  need to have a current tool.
- X add buttons for colors adding motes. (clean colors.)
- X add some motes
- X Create flow and rotate example.
- X add pause/play feature.
- X flow the motes.
- X draw isoclines.
- X add parameter sliders.
- X redo coordinates so that font size is fixed.


TODO: LONG TERM
what does a talk/demo look like on the web. How does a tutorial work?
text does not quite scale right. Maybe it should be added as an overlay?
Run for an explicit amount of time. Also run backwards.
Use runga kutta.

Have text widget. Can chrome make this a popup or open in new tab/window?
Look at url_launcher?

- Can do generic solving of isoclines? Maybe have starter curves and then use
solver to find the rest.

- Is there a function parser in dart? -- yes. antlr. Maybe we need that? Just do
  polynomials? No, examples use steps, saw tooth. single-tooth jag, sin/cos.
  can use param, or integral of param.


UI:
- show isoclines. (checkox)
- settings,
- add grid.
- current color. (current tool / selectable)
- add stream.
- print current time.
- speed slider.
- multiple parameter sliders
- run backwards? (stop at 0)

Look at
~/jeeves/old_files/BSU/talks/chaos/ for original talk.

## Original outline

Look in ~/jeeves/old_files/BSU/talks/chaos



### Page 1

Rotate.class

This is the dynamic system: ` x'(t) = -y(t)  + perturbation`,
and ` y'(t) = x(t) + perturbation`.

smag = 0.1 * stir * sin(6.789 * t)
xs = smag * abs(4*x - floor(4*x) - .5)  (saw tooth? ) = saw(x)
ys = smag * abs(4*y - floor(4*y) - .5) = saw(y)

---------- here is the equation.
xp = 3*y + saw(x)
yp = -3*x + saw(y)

ct = cos(3t)
st = sin(3t)
x  = ct*x + st*y) + dt*xs
y = (-st*x + ct*y) + dt*ys

x isocline (where x' = 0):
xs = -smag*(4*ys - floor(4*ys) - 0.5) / 3
i.e. 3x = saw(y)



*  Definition of dynamic system.
*  Flow lines and vector fields.
*  Solutions are smooth.
*  Solutions are unique => particles don't collide.
*  If stationary, paths don't cross.
*  If stationary, no mixing.

### Page 2

Stir.class
f(x, cent) = single jag of size a (x+a,  -x, x-a).
double xp = -0.2*x*x*x+3*f(y,ycent);
double yp = -0.2*y*y*y-3*f(x,xcent);

y^3 = 3/.2 * f(x,xcent)   --- assume y is small?


This is the dynamic system:
` x'(t) = -f(y(t), sin(kt))  + perturbation `,
and
` y'(t) = f(x(t), cos(kt)) + perturbation`.
Where ` f(x, c) ` is a large saw-toothed function, whose teeth
are centered at `  +/- c`.

* **x-isocline** is curve where ` x'(t) = 0`.
* **y-isocline** is curve where ` y'(t) = 0`.
* solutions continuous with respect to initial condition.
* system is chaotic.

### Page 3

Chaos.class

` x'(t) = 0.7y + 10x(0.1-y^2)
`,
and
` y'(t) = -x + 0.25 sin(1.57t)`

*  system is chaotic, but has an attractor.
*  the attractor is not really a curve: it folds on itself.
*  system is quasi-periodic.


y isocline: x = 0.25 sin(1.57t)
x isocline:
x = -.7y / (1 - 10 * y^2)
or
0 = .7 y + x - 10 x y^2 = 10 x y^2 + 0.7 y + x
y = (-.7 +/- sqrt(.7^2 - 4*10*x) ) / (2*10*x)
y = (-.7 +/- sqrt(0.035 - 40x) ) / 20

for |x| < 1, y = -2x / (0.7 _ sqrt(.7^2 + 40*x^2)
for large x: y = -2 / (sqrt(40 + (.7/x)^2) + .7/x)




## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Referecnes
* "Nonlinear Dynamics and Chaos" by J. M.T. Thompson and
  H.B. Stewart.  published by John Wiley and Sons, ISBN 0 471 90960 2.
* Shaw, R. (1981) "Strange attractors, chaotic behavior, and
  information flow." Z. Naturf. 36a, 80-112.

----
https://personal.math.ubc.ca/~israel/m215/nonlin/nonlin.html just calls them
both isoclines.
Also called horizontal and vertical isoclines.

XXX Double check which is x-isocline and which is y-isocline.
Maybe use x' = 0 to mean horizontal isocline instead.
y' = 0 is vertical isocline.

or x-nullcline = sol(x' = 0). y-nullcline = sol(y'=0)

One source: x-isocline is where vector field is vertical, or x'=0.

Another says in (p,v) plane,  p-isocline is solution (p' = 0)


Firebase app: chaos-3462f
