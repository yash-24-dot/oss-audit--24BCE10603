#!/bin/bash
# =============================================================
# Script 5: Open Source Manifesto Generator
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
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# Alias concept demonstrated as a named function.
# In an interactive shell you'd write: alias today='date "+%d %B %Y"'
# Here we wrap the same logic in a function so the script can call it.
today() {
    date '+%d %B %Y'
}

clear
echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"
echo -e "${BOLD}         OPEN SOURCE MANIFESTO GENERATOR                   ${NC}"
echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "${YELLOW}This tool asks you three questions about your relationship${NC}"
echo -e "${YELLOW}with open-source software, then generates a personal      ${NC}"
echo -e "${YELLOW}philosophy statement and saves it to a file.               ${NC}"
echo ""
echo -e "Press ${CYAN}Enter${NC} to begin..."
read

clear

# ── Collect user input ──────────────────────────────────────

echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}Question 1 of 3${NC}"
echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "${YELLOW}Name one open-source tool you use every day:${NC}"
echo -e "(Examples: Git, Firefox, Linux, VLC, Python, LibreOffice)"
echo ""
# read -p prompts inline and stores the response in the variable
read -p "➜ " TOOL
echo ""

echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}Question 2 of 3${NC}"
echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "${YELLOW}In one word, what does 'freedom' mean to you in software?${NC}"
echo -e "(Examples: choice, transparency, control, privacy, community)"
echo ""
read -p "➜ " FREEDOM
echo ""

echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}Question 3 of 3${NC}"
echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "${YELLOW}Name one thing you would build and share freely:${NC}"
echo -e "(Examples: a learning platform, a document editor, a CLI tool)"
echo ""
read -p "➜ " BUILD
echo ""

# ── Gather metadata ─────────────────────────────────────────

DATE=$(today)           # uses our alias-style function
USER_NAME=$(whoami)
HOSTNAME=$(hostname)
DISTRO=$(grep -w "PRETTY_NAME" /etc/os-release 2>/dev/null \
         | cut -d= -f2 | tr -d '"' \
         || echo "Linux")

# Output filename includes the username and today's date
OUTPUT="manifesto_${USER_NAME}_$(date +%Y%m%d).txt"

# ── Write manifesto using heredoc (<<EOF) ───────────────────
# The heredoc writes everything between EOF markers to the file
# in one clean block — much neater than a chain of echo >> lines.
# Variables inside heredoc are still expanded automatically.

cat > "$OUTPUT" << EOF
╔═══════════════════════════════════════════════════════════════╗
║              OPEN SOURCE MANIFESTO                           ║
║  Generated : $DATE
║  By        : $USER_NAME @ $HOSTNAME
║  System    : $DISTRO
╚═══════════════════════════════════════════════════════════════╝

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
MY OPEN SOURCE PHILOSOPHY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Every day, I use $TOOL. This software wasn't built by a single
company and sold for profit. It was built openly, shared freely,
and improved collectively by people who believed that was the
right way to build things. That belief is what open source means.

To me, freedom in software means $FREEDOM. It's not just a
technical preference — it's a position about how knowledge and
tools should exist in the world. When software is open, I can
study it, modify it, and share it. No vendor can lock me in.
No corporation can take it away from me. That is real freedom.

The tools I use today exist because someone before me made the
choice to share their work rather than lock it away. From Richard
Stallman's four freedoms to Linus Torvalds building Git in ten
days because a proprietary tool failed him — I am standing on
the results of those decisions every time I open a terminal.

I believe I have a responsibility to give something back.
One thing I would build and share freely is $BUILD. Because
that's how the chain continues — someone who comes after me
should be able to stand on what I built, the same way I stand
on what others built before me.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
MY COMMITMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

I, $USER_NAME, commit to:

  • Using and supporting open-source software where I can
  • Sharing what I know with others who are learning
  • Contributing to at least one open-source project this year
  • Advocating for open standards and against unnecessary lock-in

Signed: $USER_NAME
Date  : $DATE

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
"Standing on the shoulders of giants,
 I will try to help build for those who come after me."
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF

# ── Display the result ──────────────────────────────────────

clear
echo -e "${GREEN}✅  Manifesto saved to: ${YELLOW}$OUTPUT${NC}"
echo ""
echo -e "${PURPLE}════════════════════════════════════════════════════════════${NC}"
echo -e "${BOLD}YOUR OPEN SOURCE MANIFESTO${NC}"
echo -e "${PURPLE}════════════════════════════════════════════════════════════${NC}"
echo ""

# cat displays the saved file back to the screen
cat "$OUTPUT"

echo ""
echo -e "${PURPLE}════════════════════════════════════════════════════════════${NC}"
echo ""

# Alias tip — shows the user how to make this a quick command
echo -e "${YELLOW}💡 TIP:${NC} Add this alias to your ~/.bashrc to run this anytime:"
echo -e "   ${CYAN}alias manifesto='$PWD/$0'${NC}"
echo -e "   Then run: ${CYAN}source ~/.bashrc${NC} and type ${CYAN}manifesto${NC}"
echo ""
echo -e "Press Enter to exit..."
read
