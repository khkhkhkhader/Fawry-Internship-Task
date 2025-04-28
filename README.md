# Fawry Internship Task - mygrep.sh

This project is a mini implementation of the `grep` command using Bash scripting.

## Features:
- Case-insensitive search for a string in a text file
- `-n` option: Show line numbers for matches
- `-v` option: Invert match (show lines that do not contain the string)
- Supports combined options like `-vn` and `-nv`
- Error handling for invalid inputs
- `--help` flag displays usage instructions

---

## 🧠 Reflective Section

### 1. How the script handles arguments and options:

A) The code checks if the user Entered --help flag first or not and if it is it will print the help statment of the usage of the script 

![image](https://github.com/user-attachments/assets/1beb5b69-3f0d-4fca-913b-133fc25f7c18)

B) The code will handle the options using while getopt allowing the script to identify -n and -v as options for the program

![image](https://github.com/user-attachments/assets/78836b2e-e7f8-48eb-99ed-818ee922d620)

C) The code will handle arguments as if the arguments are two it will processed any number else of arguments will print invalid input and a help message.
  The Script will also check the file if it's exists and readable or not 

![image](https://github.com/user-attachments/assets/db42e633-f941-413e-9391-eeed25df7655)

![image](https://github.com/user-attachments/assets/9aaf2cb7-2086-4121-9593-80d813d5c900)





### 2. If regex or `-i`, `-c`, `-l` were supported:
- The script would need additional flags.
- `-i` (case-insensitive) would be conditionally added with while getopt instead of being used as default in this line grep_options="-i"

- `-c` (count only) and `-l` (list files) would require additional options appended dynamically to `grep`and additional cases in while getopt.


### 3. Hardest part to implement:
- Parsing options correctly and ensuring that `-v` and `-n` can be combined (`-vn` or `-nv`) without breaking argument processing.
- Controlling options with while getopts was a little bit challenging, and understanding shift $((OPTIND-1)) required deep research before proceeding.

---

## Usage Examples:

```bash
./mygrep.sh hello testfile.txt
./mygrep.sh -n hello testfile.txt
./mygrep.sh -vn hello testfile.txt
./mygrep.sh --help
