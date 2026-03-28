#!/bin/bash
# =============================================================
# Script 3: Disk and Permission Auditor
# Course  : Open Source Software — VITyarthi
# Author  : Yash Tripathi | Roll No: 24BCE10603
# What it does: Loops through key system directories and reports
#               permissions, ownership, and size for each.
#               Also checks Git's own config file locations.
# =============================================================

# ANSI colours
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# Array of important directories to audit
# These are standard locations on any Linux system
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/share/doc")

echo -e "${BLUE}============================================================${NC}"
echo -e "${BOLD}         DISK AND PERMISSION AUDITOR                       ${NC}"
echo -e "${BLUE}============================================================${NC}"
echo ""
echo -e "  ${GREEN}SYSTEM DIRECTORY AUDIT${NC}"
echo -e "${BLUE}------------------------------------------------------------${NC}"
printf "  ${CYAN}%-20s %-14s %-10s %-8s${NC}\n" "DIRECTORY" "PERMISSIONS" "OWNER" "SIZE"
echo -e "${BLUE}------------------------------------------------------------${NC}"

# for loop — iterates over every entry in the DIRS array
# ${DIRS[@]} expands the full array; quotes handle paths with spaces
for DIR in "${DIRS[@]}"; do

    # [ -d "$DIR" ] tests whether the path exists and is a directory
    if [ -d "$DIR" ]; then
        # awk pulls out the permissions string ($1) and owner:group ($3:$4)
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3":"$4}')
        # du -sh gives human-readable size; cut -f1 takes just the number
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        printf "  ${YELLOW}%-20s${NC} %-14s %-10s ${GREEN}%-8s${NC}\n" \
               "$DIR" "$PERMS" "$OWNER" "$SIZE"
    else
        # Directory doesn't exist on this particular system
        printf "  ${RED}%-20s${NC} %s\n" "$DIR" "[not found on this system]"
    fi
done

echo -e "${BLUE}------------------------------------------------------------${NC}"
echo ""

# Git-specific config directory audit
# This section checks the three tiers of Git configuration on Linux
echo -e "  ${GREEN}GIT CONFIGURATION AUDIT${NC}"
echo -e "${BLUE}------------------------------------------------------------${NC}"

GIT_SYSTEM="/etc/gitconfig"
GIT_USER="$HOME/.gitconfig"
GIT_CORE="/usr/share/git-core"

# Check system-wide git config
if [ -f "$GIT_SYSTEM" ]; then
    PERMS=$(ls -l "$GIT_SYSTEM" | awk '{print $1}')
    OWNER=$(ls -l "$GIT_SYSTEM" | awk '{print $3":"$4}')
    echo -e "  ${CYAN}System config :${NC} $GIT_SYSTEM"
    echo -e "  ${CYAN}Permissions   :${NC} $PERMS  Owner: $OWNER"
else
    echo -e "  ${YELLOW}System config :${NC} $GIT_SYSTEM ${RED}[not found]${NC}"
fi

echo ""

# Check user-level git config
if [ -f "$GIT_USER" ]; then
    PERMS=$(ls -l "$GIT_USER" | awk '{print $1}')
    OWNER=$(ls -l "$GIT_USER" | awk '{print $3":"$4}')
    echo -e "  ${CYAN}User config   :${NC} $GIT_USER"
    echo -e "  ${CYAN}Permissions   :${NC} $PERMS  Owner: $OWNER"
else
    echo -e "  ${YELLOW}User config   :${NC} $GIT_USER ${RED}[not found — run 'git config --global']${NC}"
fi

echo ""

# Check Git's shared template/hooks directory
if [ -d "$GIT_CORE" ]; then
    SIZE=$(du -sh "$GIT_CORE" 2>/dev/null | cut -f1)
    PERMS=$(ls -ld "$GIT_CORE" | awk '{print $1}')
    OWNER=$(ls -ld "$GIT_CORE" | awk '{print $3":"$4}')
    echo -e "  ${CYAN}Git core dir  :${NC} $GIT_CORE"
    echo -e "  ${CYAN}Permissions   :${NC} $PERMS  Owner: $OWNER  Size: ${GREEN}$SIZE${NC}"
    echo ""
    echo -e "  ${YELLOW}Note:${NC} Git config owned by root prevents other users from"
    echo -e "  tampering with system-wide settings — least-privilege in action."
else
    echo -e "  ${YELLOW}Git core dir  :${NC} $GIT_CORE ${RED}[not found]${NC}"
fi

echo ""
echo -e "${BLUE}============================================================${NC}"
