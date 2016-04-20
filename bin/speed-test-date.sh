#!/bin/bash
/bin/date +"%Y-%m-%dT%T" >> ~/Desktop/speed-results.txt
/Users/boushley/n/bin/node /Users/boushley/n/bin/speed-test --json >> ~/Desktop/speed-results.txt
