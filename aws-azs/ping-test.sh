#!/bin/bash
my_az=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
ping -c10 $1
