#!/bin/bash

# Run the first test in the background
robot --variable REMOTE_URL:http://localhost:4723 --variable UDID:26221JEGR08850 --outputdir report/device-1/ Guest.robot Landing.robot &

# Run the second test in the background
robot --variable REMOTE_URL:http://localhost:4725 --variable UDID:R9CW600WGCK --outputdir report/device-2/ Guest.robot Landing.robot &

# Run the third test in the background
# robot --variable REMOTE_URL:http://localhost:4727 --variable UDID:14f79d91 --outputdir report/device-2/ Guest.robot Landing.robot &

# Merge the report
rebot --outputdir report/final --log log.html --report report.html --reporttitle "Automation Result" report/device-1/output.xml report/device-2/output.xml
# wait for all background processes to finish
wait