#!/usr/bin/env bash

arg=$1

case $arg in
  "Battery")
    perc="$(termux-battery-status | jq -r .percentage)"

    printf "\033[1;36mbattery : $perc \033[0m\n"
    ;;
  "Health")
    heal="$(termux-battery-status | jq -r .health)"
    printf "\033[1;36mHealth : $heal \033[0m\n"
    ;;
  "Plugged")
    plug="$(termux-battery-status | jq -r .plugged)"
    printf "\033[1;36m$plug \033[0m\n"
    ;;
  "Status")
    sta="$(termux-battery-status | jq -r .status)"
    printf "\033[1;36m$sta \033[0m\n"
    ;;
  "Temperature")
    temp="$(termux-battery-status | jq -r .temperature)"
    printf "\033[1;36mPhone temperature : $temp \033[0m\n"
    ;;
  "Current")
    cur="$(termux-battery-status | jq -r .current)"
    printf "\033[1;36mCurrent : $cur \033[0m\n"
    ;;
  "-help")
    echo -e "
        <---------------------------------->
                     HELP MENU
        ------------------------------------
          [*] bash phone.sh Battery
            =(FOR CHECKING YOUR PHONES BATTERY)

          [*] bash phone.sh Health
            = ( FOR CHECKING YOUR PHONES BATERY 
                                       HEALTH)

          [*] bash phone.sh plugged
            = ( TO CHECK YOUR PHONE IS PLUGGED 
                                        OR NOT)

          [*] bash phone.sh Status
            = ( TO CHECK YOUR PHONE IS CHARGING
                                        OR NOT)

          [*] bash phone.sh Temperature
            = ( TO CHECK YOUR PHONES TEMPERATURE )

          [*] bash phone.sh Current
            = ( TO CHECK LEVEL OF CURRENT )
        -------------------------------------------"  | pv -qL 300 | lolcat
    ;;

  *)
    printf "\033[1;31mERROR ! OPTION NOT AVAILABLE \033[0m\n"
    ;;
esac

