#!/bin/bash

reports_folder_path="../../reports"
mkdir $reports_folder_path

checkov -d ./az-storage-account --external-checks-dir ./az-storage-account/checks > $reports_folder_path/report 2>&1