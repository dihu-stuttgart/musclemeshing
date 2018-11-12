Zur Berechnung der Streamlines werden benötigt:
- (parallel zur X ebene) geschnittener biceps als .stl, 
mit dem "reclassify2D"-tool, parameter 0, als .msh gespeichert
-biceps.geo 
-biceps.pro
-ioDetect.py
-Streamline-converter.py

output: 
streamlines.geo -geo file, welches alle streamlines beinhaltet.
streamlines.p -python container welcher zur erstellung der Roehren verwendet wird. Verwendet in 3dprint.
