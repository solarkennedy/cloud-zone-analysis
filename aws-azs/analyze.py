#!/usr/bin/env python
import boto3
import graphviz
import csv


def get_my_az_id_mapping():
    # Comes from https://docs.aws.amazon.com/ram/latest/userguide/working-with-az-ids.html
    # These are for my account, but I hard-code them for now instead
    # making an API call every single time
    client = boto3.client('ec2', region_name='us-east-1')
    azs = client.describe_availability_zones()
    my_az_id_mapping = {az['ZoneName']: az['ZoneId'] for az in azs['AvailabilityZones']}
    return my_az_id_mapping

my_az_id_mapping = {'us-east-1a': 'use1-az6', 'us-east-1b': 'use1-az1', 'us-east-1c': 'use1-az2', 'us-east-1d': 'use1-az4', 'us-east-1e': 'use1-az3', 'us-east-1f': 'use1-az5'}


c = csv.DictReader(open('az-latency.csv'))
g = graphviz.Graph("Inter-AZ Latency", engine='neato', format='png')
g.attr(overlap='scale')
g.attr(splines='true')

def az_to_label(az):
    return f"{my_az_id_mapping[az]}\\n({az})"

for row in c:
    print(row["AZ"])
    g.node(az_to_label(row["AZ"]))
    for dest, value in row.items():
        if row["AZ"] == dest or dest == "AZ":
            continue
        print(f"From {row['AZ']} to {dest} takes {value}")
        g.edge(az_to_label(row['AZ']), az_to_label(dest), len=str((float(value)**2)*10), label=f"{value}ms")

print(g.source)
g.render('az-latency.gv', view=True)
