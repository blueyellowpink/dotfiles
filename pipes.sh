#!/usr/bin/env bash
VERSION=1.3.0

M=32768  # Bash RANDOM maximum + 1
p=1      # number of pipes
f=75     # frame rate
s=13     # probability of straight fitting
r=2000   # characters limit
t=0      # iteration counter for -r character limit
w=80     # terminal size
h=24

# ab -> sets[][idx] = a*4 + b
# 0: up, 1: right, 2: down, 3: left
# 00 means going up   , then going up   -> ┃
# 12 means going right, then going down -> ┓
sets=(
    "┃┏ ┓┛━┓  ┗┃┛┗ ┏━"
    "│╭ ╮╯─╮  ╰│╯╰ ╭─"
    "│┌ ┐┘─┐  └│┘└ ┌─"
    "║╔ ╗╝═╗  ╚║╝╚ ╔═"
    "|+ ++-+  +|++ +-"
    "|/ \/-\  \|/\ /-"
    ".. ....  .... .."
    ".o oo.o  o.oo o."
    "-\ /\|/  /-\/ \|"  # railway
    "╿┍ ┑┚╼┒  ┕╽┙┖ ┎╾"  # knobby pipe
)
SETS=()  # rearranged all pipe chars into individul elements for easier access

# pipes'
x=()  # current position
y=()
l=()  # current directions
      # 0: up, 1: right, 2: down, 3: left
n=()  # new directions
v=()  # current types
c=()  # current escape codes

# selected pipes'
V=()  # types (indexes to sets[])
C=()  # color indices for tput setaf
VN=0  # number of selected types
CN=0  # number of selected colors
E=()  # pre-generated escape codes from BOLD, NOCOLOR, and C

# switches
RNDSTART=0  # randomize starting position and direction
BOLD=1
NOCOLOR=0
KEEPCT=0    # keep pipe color and type
