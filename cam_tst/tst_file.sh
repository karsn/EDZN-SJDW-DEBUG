#!/bin/sh
gst-launch-1.0 -v filesrc location="c500m.video" ! videoparse format=GST_VIDEO_FORMAT_NV12 width=2500 height=1900 framerate=1/1 ! videoconvert ! autovideosink
