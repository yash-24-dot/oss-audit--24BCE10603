# oss-audit-[YOUR ROLL NUMBER]

**Open Source Software Audit — VITyarthi**

| Field | Details |
|---|---|
| **Student Name** | **[YOUR FULL NAME]** |
| **Roll Number** | **[YOUR ROLL NUMBER]** |
| **Chosen Software** | Git (Version Control System) |
| **Licence** | GNU General Public Licence v2 (GPL v2) |
| **Course** | Open Source Software — VITyarthi |

---

## About This Project

This repository is the practical submission for the Open Source Software Audit assignment. It contains five shell scripts demonstrating Linux command-line skills. The full project report (submitted separately as a PDF on the VITyarthi portal) audits the open-source project **Git** — covering its origin story, licence analysis, ethics, Linux footprint, ecosystem, and comparison against proprietary alternatives.

---

## Repository Structure

```
oss-audit-[ROLLNUMBER]/
├── README.md
├── script1_system_identity.sh
├── script2_package_inspector.sh
├── script3_disk_auditor.sh
├── script4_log_analyzer.sh
└── script5_manifesto_generator.sh
```

---

## Script Descriptions

### Script 1 — System Identity Report
**File:** `script1_system_identity.sh`

Displays a colour-formatted welcome screen showing the Linux distribution name, kernel version, current logged-in user, home directory, system uptime, current date/time, and a message about the GPL v2 licence covering both Linux and Git.

**Concepts used:** Variables, command substitution `$()`, `echo -e` with ANSI colour codes, `uname`, `whoami`, `uptime`, `date`, `grep` + `cut` on `/etc/os-release`.

---

### Script 2 — FOSS Package Inspector
**File:** `script2_package_inspector.sh`

Checks whether Git is installed by detecting the package manager (RPM or dpkg). Prints version, licence, and summary metadata. Uses a `case` statement to print a philosophy note about each recognised open-source package.

**Concepts used:** `if-then-else`, `case` statement, `rpm -qi`, `dpkg -l`, pipe with `grep -E`, `&>/dev/null` for silent command testing, ANSI colours.

---

### Script 3 — Disk and Permission Auditor
**File:** `script3_disk_auditor.sh`

Loops through an array of important system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`, `/usr/share/doc`) and reports permissions, ownership, and size for each. Also audits Git-specific config file locations separately.

**Concepts used:** `for` loop, array declaration and `${DIRS[@]}` expansion, `ls -ld` with `awk`, `du -sh` with `cut`, `[ -d ]` directory existence test, ANSI colours.

---

### Script 4 — Log File Analyzer
**File:** `script4_log_analyzer.sh`

Accepts a log file path and optional keyword as command-line arguments. Reads the file line by line counting keyword matches. Implements a do-while style retry loop if the file is empty. Prints a summary with the last 5 matching lines.

**Concepts used:** `$1`/`$2` arguments with `${2:-"error"}` default, `while IFS= read -r` loop, counter variable with arithmetic expansion, do-while simulation using `while true` + `break`, `grep -iq` + `tail` for last matches, ANSI colours.

---

### Script 5 — Open Source Manifesto Generator
**File:** `script5_manifesto_generator.sh`

Prompts the user with three interactive questions about their relationship to open-source software. Composes a personalised philosophy statement using a heredoc (`<< EOF`), saves it to a timestamped `.txt` file, and displays it with colour formatting. Ends with an alias tip.

**Concepts used:** `read -p` for interactive input, heredoc (`<< EOF`) for multi-line file writing, ANSI colour codes, `date` formatting, alias concept via a named `today()` function and printed alias suggestion, `cat` to display the output file.

---

## How to Run on Linux

### Prerequisites
- Any Linux distribution (Ubuntu, Fedora, Arch, Debian, etc.)
- Bash 4.0+ — check with `bash --version`
- Git installed — `sudo apt install git` or `sudo dnf install git`

### Step 1 — Clone the repository
```bash
git clone https://github.com/[YOUR-GITHUB-USERNAME]/oss-audit-[ROLLNUMBER].git
cd oss-audit-[ROLLNUMBER]
```

### Step 2 — Make scripts executable
```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto_generator.sh
```

### Step 3 — Run each script

**Script 1 — System Identity Report**
```bash
./script1_system_identity.sh
```

**Script 2 — FOSS Package Inspector**
```bash
./script2_package_inspector.sh
```

**Script 3 — Disk and Permission Auditor**
```bash
./script3_disk_auditor.sh
```

**Script 4 — Log File Analyzer**
```bash
# Default keyword is "error"
./script4_log_analyzer.sh /var/log/syslog

# Custom keyword
./script4_log_analyzer.sh /var/log/syslog warning

# On Fedora/RHEL
./script4_log_analyzer.sh /var/log/messages error

# If permission denied, run with sudo
sudo ./script4_log_analyzer.sh /var/log/syslog
```

**Script 5 — Manifesto Generator**
```bash
./script5_manifesto_generator.sh
# Follow the on-screen prompts and press Enter after each answer
```

---

## Dependencies

All dependencies are part of standard GNU coreutils — present on every Linux installation by default. No extra packages needed.

| Script | Dependencies |
|---|---|
| Script 1 | `uname`, `whoami`, `uptime`, `date`, `grep`, `cut` |
| Script 2 | `rpm` (RPM systems) or `dpkg` (Debian systems), `git` |
| Script 3 | `ls`, `du`, `awk`, `cut` |
| Script 4 | `grep`, `tail` |
| Script 5 | `date`, `cat`, `echo`, `read` |

---

## Notes

- Script 4 needs a readable log file path as its first argument. On some systems `/var/log/syslog` requires root — use `sudo` if you get a permission error.
- Script 5 saves the manifesto as `manifesto_[username]_[date].txt` in the current working directory.
- All scripts use ANSI colour codes — run them in a standard terminal for best results.
- All scripts are fully commented line by line as required by the course rubric.
