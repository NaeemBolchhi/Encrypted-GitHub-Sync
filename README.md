# Encrypted-GitHub-Sync
Simple batch files to automate encrypted github sync of designated folders.

## Why?
Suppose you want to sync some files to your GitHub repo, but you don't want its contents to be visible to anyone.

## How?
This tool uses a 3-step process to hide your data.
- First, your designated folder is compressed to a 7z file using a password of your choosing.
- Then, it is converted to base64 using certutil.
- Finally, it is compressed again to a 7z file (minus the extension), using a second password of your choosing.

## What?
- `compress.bat`
    - Compresses a designated folder and puts the output in your sync folder.
- `decompress.bat`
    - Decompresses a previously compressed file and puts the output in your working folder.
- `git-sync.bat`
    - In series, performs a `git pull`, `git add .`, `git commit`, and `git push` in your sync folder.

## Usage
- Download this repository as a zip file. Don't `git clone` it.
- Extract and get the 3 `.bat` files.
- Edit the files in Notepad and update the values under **USER SETTINGS**.
- Place the files in the parent folder of your working folder.
- Visually, it should look like this:

```
Parent_Folder/
├── Working_Folder/
│   ├── subfolder/
│   │   └── file.txt
│   └── otherfile.docx
├── 7za.exe
├── compress.bat
├── decompress.bat
└── git-sync.bat
```

- Create a sync repo on GitHub and `git clone` it inside the parent folder. Make sure the folder name matches what has been defined in `git-sync.bat`.
- The folder structure now looks like this:

```
Parent_Folder/
├── Working_Folder/
│   ├── subfolder/
│   │   └── file.txt
│   └── otherfile.docx
├── Sync_Folder/
│   ├── .git
│   └── whatever.md
├── 7za.exe
├── compress.bat
├── decompress.bat
└── git-sync.bat
```

- That's all!