#!/usr/bin/env python
import sys

i = sys.stdin
o = sys.stdout
for l in i:
    c = l
    try:
        c = unicode(l, "utf8")
    except:
        c = l.encode('ISO-8859-1', 'xmlcharrefreplace')
    o.write(c.encode('ascii', 'xmlcharrefreplace'))