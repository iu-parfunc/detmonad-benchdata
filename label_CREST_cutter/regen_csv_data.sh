#!/bin/bash

set -e

for csvfile in `find -name "*.csv"`; do
  logfile="${csvfile%.csv}.log"
  echo "Regenerrating $csvfile from $logfile."
  if ! [ -e" $logfile" ]; then
      echo "Error: doesn't exist: $logfile"
      exit 1;
  fi
  rm -f "$csvfile"
  hsbencher-ingest-log "$logfile" "$csvfile"
done

echo Success.
