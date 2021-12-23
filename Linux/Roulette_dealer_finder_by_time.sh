#My classmates helped me specify what input to type and showed me the echo command.
# requires input xxxx(Day) xx:xx:xx AM/PM (time)
#! bin/bash/
echo "$1_Dealer_schedule"
grep "$2" "$1_Dealer_schedule" | awk '{print $1, $2, $5, $6}'
