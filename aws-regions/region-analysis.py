#!/usr/bin/env python3

import csv
import graphviz
import re

c = csv.DictReader(open('region-analysis.csv'))

g = graphviz.Graph("Inter-Region Latency", engine='neato', format='png')
g.attr(overlap='scale')
g.attr(splines='true')

region_names = {
    'us-east-2':	'US East (Ohio)',
    'us-east-1':	'US East (N. Virginia)',
    'us-west-1':	'US West (N. California)',
    'us-west-2':	'US West (Oregon)',
    'ap-east-1':	'Asia Pacific (Hong Kong)',
    'ap-south-1':	'Asia Pacific (Mumbai)',
    'ap-northeast-3':	'Asia Pacific (Osaka-Local)',
    'ap-northeast-2':	'Asia Pacific (Seoul)',
    'ap-southeast-1':	'Asia Pacific (Singapore)',
    'ap-southeast-2':	'Asia Pacific (Sydney)',
    'ap-northeast-1':	'Asia Pacific (Tokyo)',
    'ca-central-1':	'Canada (Central)',
    'cn-north-1':	'China (Beijing)',
    'cn-northwest-1':	'China (Ningxia)',
    'eu-central-1':	'Europe (Frankfurt)',
    'eu-west-1':	'Europe (Ireland)',
    'eu-west-2':	'Europe (London)',
    'eu-west-3':	'Europe (Paris)',
    'eu-north-1':	'Europe (Stockholm)',
    'me-south-1':	'Middle East (Bahrain)',
    'sa-east-1':	'South America (Sao Paulo)',
    'us-gov-east-1':	'AWS GovCloud (US-East)',
    'us-gov-west-1':	'AWS GovCloud (US-West)',
}

def region_to_label(region):
    return f"{region}\\n({human_region_name(region)})"

def human_region_name(region):
    matches = re.search('\((.*)\)', region_names[region])
    assert matches is not None
    return matches[1]

for row in c:
    print(row["Region"])
    g.node(region_to_label(row["Region"]))
    for dest, value in row.items():
        if row["Region"] == dest or dest == "Region":
            continue
        print(f"From {row['Region']} to {dest} takes {value}")
        g.edge(region_to_label(row['Region']), region_to_label(dest), len=str((int(value)/100)**1.1), label=f"{value}ms")

print(g.source)
g.render('region-latency.gv', view=True)


