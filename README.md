# PDML website

This repository contains the files to create and serve [www.pdml-lang.dev](https://www.pdml-lang.dev/).

The following root directories are used:

- `work`: contains the source files needed to create the target files in directory `docs`.

- `docs`: contains the target website files used by the web server.

- `creator`: contains the static website creator (PSWC).

## Usage And Dependencies

Documents stored in directory `work\docs` are written in [PML](https://www.pml-lang.dev/).
To convert these PML documents to HTML you need to [install PMLC](https://www.pml-lang.dev/downloads/install.html), and then execute 'bin/create_HTML.cmd' in each document's root directory.

To create the website you need Java version 17 or higher to be installed on your system.
You can then execute `creator/create_website.cmd`. This command will read files in directory `work`, and write files into directory `docs`.

## Help

Please use [GitHub Discussions](https://github.com/pdml-lang/pdml-lang.github.io/discussions) for help.

## Issues

Please use [GitHub Issues](https://github.com/pdml-lang/pdml-lang.github.io/issues) to post an issue.

