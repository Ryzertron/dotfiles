#!/bin/bash

label="Tctl"
devName="k10temp"
devPath=""

# Find the hwmon path for k10temp
for d in /sys/class/hwmon/hwmon*; do
  if [[ -f "$d/name" ]] && grep -qi "$devName" "$d/name"; then
    devPath="$d"
    break
  fi
done

# If the device path was found
if [[ -n "$devPath" ]]; then
  for labelFile in "$devPath"/temp*_label; do
    if grep -q "$label" "$labelFile"; then
      # Extract the N from tempN_label to find tempN_input
      baseName=$(basename "$labelFile")
      num=${baseName%%_*}  # Extract 'tempX'
      valueFile="$devPath/${num}_input"
      
      if [[ -f "$valueFile" ]]; then
        raw=$(<"$valueFile")
        raw=$(echo "$raw" | tr -d '\r\n ')
        
        if [[ "$raw" =~ ^[0-9]+$ ]]; then
          int_part=${raw:0:-3}
          decimal_part=${raw: -3:1}
          echo "${int_part}.${decimal_part}"
          exit 0
        fi
      fi
    fi
  done
fi

echo "Error"
exit 1

