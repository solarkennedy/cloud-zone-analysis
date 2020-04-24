#!/usr/bin/env python
import boto3
import graphviz
import csv
import os

def get_my_az_id_mapping():
    # Comes from https://docs.aws.amazon.com/ram/latest/userguide/working-with-az-ids.html
    region = os.path.basename(os.getcwd())
    client = boto3.client('ec2', region_name=region)
    azs = client.describe_availability_zones()
    my_az_id_mapping = {az['ZoneName']: az['ZoneId'] for az in azs['AvailabilityZones']}
    return my_az_id_mapping

my_az_id_mapping = get_my_az_id_mapping()


c = csv.DictReader(open('data.csv'))
g = graphviz.Graph("Inter-AZ Latency", engine='neato', format='svg')
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
        if dest == "":
            continue
        print(f"From {row['AZ']} to {dest} takes {value}")
        g.edge(az_to_label(row['AZ']), az_to_label(dest), len=str((float(value)**2)*10), label=f"{value}ms")

print(g.source)
g.render('az-latency.gv', view=True)
