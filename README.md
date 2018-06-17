# MapViewDeselectBug

Reproduces a bug in iOS12 MapKit
The app uses a custom `MKAnnotationView` subclass and.

all calls to `setSelected(_ selected: Bool, animated: Bool)` are logged with their paramters.

# How to reproduce
 1. Launch App
 2. Select Annotation
 3. Deselect Annotation
 
 # Expected Behaviour
 when deselecting an annotation the method `setSelected(_ selected: Bool, animated: Bool)` should be called with `selected=false`
 
 # Actual Behaviour
 `setSelected(_ selected: Bool, animated: Bool)` is always called with `selected=true`
