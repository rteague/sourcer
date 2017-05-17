# Sourcer

Creates source files from templates based on file extensions.

## Setup

You'll have to run the following commands within the sourcer's package directory.

To install, run:
```bash
bash setup.sh install
```

To uninstall, run:
```bash
bash setup.sh uninstall
```

## Templates

Templates can be found under `~/.srcr/templates`. You may edit or add new templates.

Template variables are:

```
%script_title%
%author%
%date%
```

## Usage

```bash
srcr myfile.py
```

```bash
srcr myfile1.py myfile2.py myfile3.py
```

