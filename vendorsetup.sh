for combo in $(wget -o /dev/null -O - caf-devices | grep caf-4.4 | awk {'print $1'})
do
    add_lunch_combo $combo
done
