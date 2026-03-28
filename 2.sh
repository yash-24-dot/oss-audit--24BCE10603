#!/bin/bash
# =============================================================
# Script 2: FOSS Package Inspector
# Course  : Open Source Software — VITyarthi
# Author  : [YOUR NAME] | Roll No: [YOUR ROLL NUMBER]
# What it does: Checks if Git is installed, shows its details,
#               and prints a philosophy note via a case statement.
# =============================================================

# ANSI colours
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# The package we're inspecting — our chosen open-source software
PACKAGE="git"

echo -e "${BLUE}============================================================${NC}"
echo -e "${BOLD}   FOSS PACKAGE INSPECTOR — checking: $PACKAGE             ${NC}"
echo -e "${BLUE}============================================================${NC}"
echo ""

# if-then-else block: detect which package manager is present,
# then query it. &>/dev/null silences both stdout and stderr
# so failed checks don't print errors to the screen.

if command -v rpm &>/dev/null && rpm -q "$PACKAGE" &>/dev/null; then
    # RPM-based system (Fedora, RHEL, CentOS)
    echo -e "  ${GREEN}[FOUND]${NC} '$PACKAGE' is installed (RPM-based system)"
    echo ""
    echo -e "  ${CYAN}--- Package details from rpm -qi ---${NC}"
    rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary|URL'

elif command -v dpkg &>/dev/null && dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
    # Debian/Ubuntu-based system
    echo -e "  ${GREEN}[FOUND]${NC} '$PACKAGE' is installed (Debian-based system)"
    echo ""
    echo -e "  ${CYAN}--- Package details from dpkg -l ---${NC}"
    dpkg -l "$PACKAGE" | grep "^ii" | \
        awk '{print "  Version : "$3"\n  Package : "$2"\n  Desc    : "$5" "$6" "$7}'

elif command -v git &>/dev/null; then
    # Git present but not via a package manager (compiled from source)
    echo -e "  ${GREEN}[FOUND]${NC} '$PACKAGE' is installed (compiled from source)"
    echo ""
    echo -e "  ${CYAN}--- Version ---${NC}"
    git --version

else
    # Not found at all
    echo -e "  ${RED}[NOT FOUND]${NC} '$PACKAGE' is not installed on this system."
    echo ""
    echo -e "  To install Git:"
    echo -e "    ${YELLOW}Debian/Ubuntu :${NC} sudo apt install git"
    echo -e "    ${YELLOW}Fedora/RHEL   :${NC} sudo dnf install git"
    echo -e "    ${YELLOW}Arch Linux    :${NC} sudo pacman -S git"
fi

echo ""
echo -e "${BLUE}------------------------------------------------------------${NC}"

# case statement: prints an open-source philosophy note
# based on the package name. Each pattern matches a known FOSS tool.
echo -e "  ${GREEN}OPEN SOURCE PHILOSOPHY NOTE${NC}"
echo -e "${BLUE}------------------------------------------------------------${NC}"

case $PACKAGE in
    git)
        echo -e "  ${YELLOW}Git:${NC} Linus Torvalds built this in 2005 after a proprietary"
        echo -e "  tool was yanked from the Linux project. The whole point was"
        echo -e "  that no company could ever hold the kernel's history hostage"
        echo -e "  again. That design decision is why Git is distributed."
        ;;
    httpd|apache2)
        echo -e "  ${YELLOW}Apache:${NC} The web server that proved community-built software"
        echo -e "  could power the internet. At its peak it served over 60%"
        echo -e "  of all websites. Built openly, maintained collectively."
        ;;
    mysql|mariadb)
        echo -e "  ${YELLOW}MySQL:${NC} Its acquisition by Oracle sparked the MariaDB fork —"
        echo -e "  a reminder that even open-source projects can be threatened"
        echo -e "  by corporate ownership. The community voted with their feet."
        ;;
    python3|python)
        echo -e "  ${YELLOW}Python:${NC} Governed by a community foundation, not a company."
        echo -e "  The PSF licence is permissive enough that Python is now"
        echo -e "  the world's most used language. Openness drove adoption."
        ;;
    vlc)
        echo -e "  ${YELLOW}VLC:${NC} Started by students at a French university who wanted"
        echo -e "  to stream video over their campus network. No commercial"
        echo -e "  tool was open enough to adapt, so they built their own."
        ;;
    firefox)
        echo -e "  ${YELLOW}Firefox:${NC} Mozilla's answer to Internet Explorer's monopoly."
        echo -e "  A nonprofit building a browser to keep the web open."
        echo -e "  Without Firefox, the web would look very different today."
        ;;
    *)
        echo -e "  ${YELLOW}$PACKAGE:${NC} An open-source tool built on the belief that"
        echo -e "  shared knowledge moves faster than proprietary knowledge."
        ;;
esac

echo ""
echo -e "${BLUE}============================================================${NC}"
