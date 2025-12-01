#!/bin/bash

case $1/$2 in
pre/*) ;;
post/*)
  hyprlock &
  ;;
esac
