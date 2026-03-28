#!/bin/bash
# =============================================================
# Script 1: System Identity Report
# Course  : Open Source Software — VITyarthi
# Author  : Your Name | Roll No: Your Roll Number
# =============================================================

# ANSI colour codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# Student details
STUDENT_NAME="YashTripathi"
ROLL_NUMBER="24BCE10603"
SOFTWARE_CHOICE="Git"
SOFTWARE_LICENSE="GNU General Public License v2 (GPL v2)"

# System info
KERNEL=$(uname -r)

# Get distro safely
if [ -f /etc/os-release ]; then
    DISTRO=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Unknown Linux Distribution"
fi

USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p 2>/dev/null)
CURRENT_DATE=$(date '+%A, %d %B %Y')
CURRENT_TIME=$(date '+%H:%M:%S %Z')

# Header
echo -e "${BLUE}============================================================${NC}"
echo -e "${BOLD}       OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT          ${NC}"
echo -e "${BLUE}============================================================${NC}"
echo ""

echo -e "  ${YELLOW}Student   :${NC} $STUDENT_NAME"
echo -e "  ${YELLOW}Roll No   :${NC} $ROLL_NUMBER"
echo -e "  ${YELLOW}Software  :${NC} $SOFTWARE_CHOICE"
echo ""

echo -e "${BLUE}------------------------------------------------------------${NC}"

# System info
echo -e "  ${GREEN}LINUX SYSTEM INFORMATION${NC}"
echo -e "${BLUE}------------------------------------------------------------${NC}"
echo -e "  ${CYAN}Distribution :${NC} $DISTRO"
echo -e "  ${CYAN}Kernel       :${NC} $KERNEL"
echo -e "  ${CYAN}Current User :${NC} $USER_NAME"
echo -e "  ${CYAN}Home Dir     :${NC} $HOME_DIR"
echo -e "  ${CYAN}Uptime       :${NC} $UPTIME"
echo -e "  ${CYAN}Date         :${NC} $CURRENT_DATE"
echo -e "  ${CYAN}Time         :${NC} $CURRENT_TIME"
echo ""

echo -e "${BLUE}------------------------------------------------------------${NC}"

# License info
echo -e "  ${GREEN}LICENCE INFORMATION${NC}"
echo -e "${BLUE}------------------------------------------------------------${NC}"
echo -e "  This system runs ${YELLOW}Linux${NC}, which is covered by:"
echo -e "  ${BOLD}$SOFTWARE_LICENSE${NC}"
echo ""

echo -e "  ${YELLOW}$SOFTWARE_CHOICE${NC} is also distributed under GPL v2."
echo ""

echo -e "  GPL v2 gives you four freedoms:"
echo -e "  - ${CYAN}Run${NC} the program"
echo -e "  - ${CYAN}Study${NC} the source code"
echo -e "  - ${CYAN}Share${NC} copies"
echo -e "  - ${CYAN}Modify${NC} and redistribute"
echo ""

echo -e "  Any modified version must also remain open."
echo -e "${BLUE}============================================================${NC}"
