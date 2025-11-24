# Base Image
FROM ubuntu:latest

# Update and install useful tools
RUN apt-get update && apt-get install -y \
    nano \
    curl \
    wget \
    iputils-ping \
    tree \
    procps

# Create assignment directories
RUN mkdir -p /assignment/docs /assignment/logs

# Create files inside assignment folder
RUN echo "This is a sample log file for Docker assignment." > /assignment/logs/app.log
RUN echo "User: chetna was created inside container" > /assignment/docs/user-info.txt
RUN echo "This is sample notes file." > /assignment/docs/notes.txt

# Copy example file (so cat command works)
RUN echo "Hello from Docker container" > /assignment/hello.txt

############################################################
# BASIC LINUX COMMANDS WITH DESCRIPTION, SYNTAX & EXAMPLES #
############################################################

# 1) pwd – Print Working Directory
# Description: Shows your current directory path.
# Syntax: pwd
# Example: pwd
RUN pwd

# 2) ls – List files and directories
# Description: Lists all files and folders in your current directory.
# Syntax: ls
# Example: ls -la   (shows hidden files and permissions)
RUN ls -la

# 3) cat – View file content
# Description: Displays the content of a file.
# Syntax: cat <filename>
# Example: cat /assignment/docs/notes.txt
RUN cat /assignment/docs/notes.txt || true

# 4) echo – Print text or add text to files
# Description: Used to display text on screen or append text to a file.
# Syntax: echo "text"
# Example: echo "Hello Docker" >> /assignment/hello.txt
RUN echo "Hello from Docker container" >> /assignment/hello.txt

# 5) tree – Display directory structure in tree format
# Description: Shows files/folders in tree-like structure.
# Syntax: tree <path>
# Example: tree /assignment
RUN tree /assignment

# 6) cp – Copy files
# Description: Copies a file from one location to another.
# Syntax: cp source destination
# Example: cp /assignment/hello.txt /assignment/docs/hello-copy.txt
RUN cp /assignment/hello.txt /assignment/docs/hello-copy.txt

# 7) mv – Move or rename files
# Description: Moves or renames files.
# Syntax: mv old new
# Example: mv app.log app-renamed.log
RUN mv /assignment/logs/app.log /assignment/app-log-moved.log

# 8) chmod – Change file permissions
# Description: Sets read/write/execute permissions.
# Syntax: chmod 744 filename
# Example: chmod 744 /assignment/docs/user-info.txt
RUN chmod 744 /assignment/docs/user-info.txt

# 9) ps – Show running processes
# Description: Shows current running system processes.
# Syntax: ps -aux
# Example: ps -aux
RUN ps -aux

# 10) ping – Network connectivity test
# Description: Tests connectivity to a server/website.
# Syntax: ping <website>
# Example: ping -c 1 google.com
RUN ping -c 1 google.com || true

# 11) df – Check disk usage
# Description: Shows disk space availability.
# Syntax: df -h
# Example: df -h
RUN df -h

############################################
# END OF LINUX COMMANDS DOCUMENTATION BLOCK
############################################

# Set working directory
WORKDIR /assignment

# Final instruction — mandatory
CMD ["/bin/bash"]

