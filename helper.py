#!/usr/bin/env python
import json
import datetime
import time
import os
import sys
import imghdr

if len(sys.argv) != 8:
    print "Leaving need path to file as an argument!"
    exit(1)

wallpaper_file = sys.argv[1]
author_in = sys.argv[2]
name_in = sys.argv[3]

xlarge = sys.argv[4]
large = sys.argv[5]
normal = sys.argv[6]
preview = sys.argv[7]

for i in range(4,7):
    if not imghdr.what(sys.argv[i]):
        print "%s doesn't appear to be a picture, leaving" % i
        exit(2)

now = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
date_millis = int(round(time.time() * 1000))
outFile = "mrwallpapers_%s.json" % now

desc_in = raw_input('Enter description: ')

json_data=open(wallpaper_file)
data = json.load(json_data)

count=0
for i in data['wallpapers']:
    count += 1

data['wallpapers'].append({'id': count+1, 'name': name_in, 'author': author_in, 'description': desc_in, 'preview': preview, 'xlarge': xlarge, 'large': large, 'normal': normal, 'date': date_millis})
output = json.dumps(data, sort_keys=True, indent=4, separators=(',', ': '))
#print output
f = open(outFile,'w')
f.write(output)
f.close()
print "\nComplete! Validating json now: %s\n" % outFile
json_data.close()

new_json_data=open(outFile)
try:
    json.load(new_json_data)
    new_json_data.close()
    os.remove(wallpaper_file)
    os.rename(outFile, wallpaper_file)
    print "JSON data is valid, merged content successfully."
except ValueError, err:
    print "JSON not valid, open a bug report"
    new_json.data.close()
    exit(3)

