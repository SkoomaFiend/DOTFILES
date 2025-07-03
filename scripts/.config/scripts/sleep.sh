#!/bin/bash

cleanup() {
  echo "Script Interrupted logging end time"
  echo "End : $(date)" >>~/logs/sleep.log
  ps -C sleep.sh -o etime >>~/logs/sleep.log
  exit
}

trap cleanup SIGINT

echo "Start : $(date) ~/logs/sleep.log" >>~/logs/sleep.log

echo "Running... press Ctrl+C to interrupt"

while true; do
  sleep 3
done
