# I came to this anwser after my class mates helped me I originaly made 13 scripts for each time and day.
#!/bin/bash
echo "$1" >> Dealers_working_during_losses 
awk '{print $1, $2, $5, $6}' "$1" | grep '05:00:00 AM\|08:00:00 AM\|02:00:00 PM\|08:00:00 PM\|11:00:00 PM' >> Dealers_working_during_losses
