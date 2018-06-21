# This script aims to extract info from `uptime`` command
# In order to analyze the system load

c = open('result.csv', 'w')
with open('uptime_.log') as a:
    b = a.readlines()
    for line in b:
        line1 = line.split(' up ')[0].strip()
        line2 = line.split('load average: ')[1].split(', ')
        c.write("%s,%s,%s,%s" % (line1, line2[0], line2[1], line2[2]))
c.close()
