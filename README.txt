This .zip contains the config and libraries to create Open Trip Planner (OTP) graphs, and route over those graphs via a web UI or web services interface.

RUN OTP
=======
See the 2 miniute introduction to OTP -- http://opentripplanner.org/wiki/TwoMinutes 
To run the OTP web app locally with a pre-built graph, do the following:
  
  1. Unzip the contents of otp.zip to the / directory (or C:\ for Windows users). This will create a /otp directory with the pre-built OTP binaries.  
     NOTE, it's very important to have the pre-built web app to run from /otp (or C:\otp).  If you want to run from another location, you'll need to edit the file WEB-INF/classes/data-sources.xml within /otp/webapps/opentripplanner-api-webapp.war.

  2. Download a pre-built Graph.org file from  http://maps5.trimet.org/otp-dev/Graph.obj (~300 megs)

  3. Move Graph.obj to /otp/Graph.obj

  4. cd to /otp (or C:\otp for Windows users)

  5. bin/startup.sh (or bin\startup.bat for Windows users)
     NOTE: you will need a  http://java.com environment installed on your computer (java is usually installed on most PCs and Macs).

  6. Open  http://localhost:8080/opentripplanner-webapp in a web browser.
     


BUILD NEW OTP Graph.obj
=======================
See the 5 minute detailed dive-in for instructions on how to build your own OTP Graph.obj -- http://opentripplanner.org/wiki/FiveMinutes 

  PORTLAND GRAPH 
  ==============

  1. Download OSM street data for Portland  http://maps5.trimet.org/otp-dev/or-wa.osm (~300 megs)
  2. Move or-wa.osm to the /otp/cache/osm/ directory
  3. cd to /otp
  4. bin/build-graph.sh (or bin\build-graph.bat for Windows users)
     NOTE: this takes awhile...but you should end up with a new Graph.obj file.
  5. you can run bin/graph-vis.sh (or bin\graph-viz.bat for Windows users) to view your Graph.obj ... or ...
  6. bin/startup.sh (or bin\startup.bat for Windows users), then open  http://localhost:8080/opentripplanner-webapp in a web browser to see OTP route around the Portland area...


  CUSTOM GRAPH 
  ==============

  1. find a URL to a GTFS feed that you're interested in (see  http://www.gtfs-data-exchange.com/ for ideas).
  2. cd /otp
  3. open graph-builder.xml in a text editor -- we're going to make two edits
     edit #1 - change the GTFS url on/about line 17, from  http://developer1.trimet.org/schedule/gtfs.zip to your desired gtfs.zip url path.
     edit #2 - specify the OSM data for your region (not the or-wa.osm data). You have two options for acquiring OSM data for your region: 
       a) if you have an existing .osm file for your region, edit the path from or-wa.osm to that file on line 66 of graph-builder.xml. (BTW, here's the url I use for or-wa.osm --  http://jxapi.openstreetmap.org/xapi/api/0.6/map?bbox=-123.4,44.8,-121.5,45.8). 
       b) let OTP download the .osm data for your region (based on the stop locations within your gtfs.zip file) -- to make that change, you need to un-comment the RegionBasedOpenStreetMapProviderImpl? provider on line 45 of graph-builder.xml, and then comment out the StreamedFileBasedOpenStreetMapProviderImpl? provider on line 65 of graph-builder.xml.
  4. cd to /otp
  5. bin/graph-viz.sh (or bin\build-graph-viz.bat for Windows users)
  6. bin/build-graph.sh (or bin\build-graph.bat for Windows users)
  7. etc... see instructions above for running your new graph though otp ...
