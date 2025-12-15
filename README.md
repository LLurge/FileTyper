# File Type Identifier

## Overview
File Type Identifier is a lightweight Linux command-line tool designed for detailed file analysis. Written entirely in **Bash**, the script utilizes standard Linux utilities to calculate cryptographic and fuzzy hashes, extract raw hex data, and display comprehensive file type and metadata. It's an ideal tool for quick file inspection, triage, and initial **digital forensics** or **malware analysis**.

## Features
* **Cryptographic Hashing:** Calculates industry-standard hashes:
    * MD5
    * SHA-1
    * SHA-256
* **Fuzzy Hashing:** Supports advanced similarity hashing for file comparison:
    * SSDEEP (if installed)
    * TLSH (if installed)
* **Raw Data Extraction:** Displays the raw hex data of the first **32 bytes** (file header).
* **File Identification:** Uses the `file` command to identify the file type.
* **Detailed Magic Info:** Shows low-level details about the file format structure.
* **Metadata Display:** Includes the file extension and the file size (in both human-readable and raw bytes).
* **Lightweight and Portable:** Pure Bash script with minimal dependencies.
* **Clean Output:** Provides a structured and readable terminal output for rapid analysis.

## Requirements
The script relies on common Linux utilities.
```bash
bash
coreutils (for size, stat)
file (for file type identification)
xxd (for hex dump)
ssdeep (for fuzzy hashing)
tlsh (for fuzzy hashing)
```
## Setup and Usage
1.  **Clone this repository:**
    ```bash
    git clone [https://github.com/YourUsername/File-Type-Identifier.git](https://github.com/YourUsername/File-Type-Identifier.git)
    cd File-Type-Identifier
    ```
2.  **Make the script executable:**
    ```bash
    chmod +x fileType.sh
    ```
3.  **Run the script:**
    The script takes the path to the file you want to analyze as its argument.

    ```bash
    ./fileType.sh <file_path>
    ```

### Example
To analyze a file named `sample.pdf` located in the current directory:

```bash
./fileType.sh sample.pdf
```

## License
GNU GPL v3 License. See [LICENSE](LICENSE) for more details.
