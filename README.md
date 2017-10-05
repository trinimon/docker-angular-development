# A Docker image for Angular development

This repository contains a docker file that is used to build an image which contains some essential Angular development tools. The node based image includes a git client, Visual Studio Code and the Angular command line interface.

# About the tools

## Angular

Angular is a framework for building client applications in HTML and either JavaScript or a language like TypeScript that compiles to JavaScript.Angular combines declarative templates, dependency injection, end to end tooling, and integrated best practices to solve development challenges. Angular empowers developers to build applications that live on the web, mobile, or the desktop. \[&nearr; [_Wikipedia_](https://en.wikipedia.org/wiki/Angular_(application_platform)) &nearr; [_Angular_](https://angular.io/)]   

## Node.js

Node.js is an open-source, cross-platform JavaScript run-time environment for executing JavaScript code server-side. \[&nearr; [_Wikipedia_](https://en.wikipedia.org/wiki/Node.js)]

## Git

Git is a version control system for tracking changes in computer files and coordinating work on those files among multiple people. It is primarily used for source code management in software development, but it can be used to keep track of changes in any set of files. \[&nearr; [_Wikipedia_](https://en.wikipedia.org/wiki/Git) &nearr; [_git_](https://git-scm.com/)]

## Visual Studio Code

Visual Studio Code is a source code editor developed by Microsoft for Windows, Linux and macOS. It includes support for debugging, embedded Git control, syntax highlighting, intelligent code completion, snippets, and code refactoring. It is also customizable, so users can change the editor's theme, keyboard shortcuts, and preferences. \[&nearr; [_Wikipedia_](https://en.wikipedia.org/wiki/Visual_Studio_Code) &nearr; [_Microsoft_](https://code.visualstudio.com/)]

# Building an image

Based on the provided Dockerfile an image can easily be built by running

```
docker build -t angular-development .
```
# Running the created image

```
docker run -it --rm 
               --publish <host port>:4200 
               --env DISPLAY=<host IP>:<display number> 
               --volume <path to apps>:/home/developer/apps trinimon/docker-angular-development:latest bash
```

\\C\git\angular\apps
