#!/bin/bash

kubectl config get-contexts -o name
for i in $(kubectl config get-contexts -o name); do kubectl config delete-context $i; done