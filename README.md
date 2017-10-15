# A Docker image for Angular development

This repository contains a docker file that is used to build an image which contains some essential Angular development tools. The node based image includes a git client, Visual Studio Code and the Angular command line interface.

# Requirements

In order to use the Visual Studio Code editor a locally running X Server is required. For Linux clients this means more or less they have to run a graphical Desktop environment. Windows clients might run [Xming](https://sourceforge.net/projects/xming/), [Cygwin/X](https://x.cygwin.com/), [MobaXterm Personal Edition](https://mobaxterm.mobatek.net/) or any other X server. X forwarding has to be enabled.
In case of a bind mount any available coding editor on the host could be used. However, on Linux systems you might have to adjust file permissions or add an appropriate user.

# Building an image

Based on the provided Dockerfile an image can easily be built by running

```
docker build -t angular-development .
```

# Running the created image

The following command creates and runs a container which exposes the default Angular port, uses a bind mount, exports the (X Server) display, runs a bash command shell and removes the container after exit.

```
docker run --rm -it 
           --publish <host port>:4200
           --env DISPLAY=<host IP>:<display number> 
           --volume <path to apps>:/home/developer/apps 
           --volume vscode_configuration:/home/developer/.vscode trinimon/docker-angular-development bash
```

The Visual Studio Code configuration is hold in a named volume. Do not use a bind mount, if running containers on a Windows host. 

# Docker Compose

Alternatively the image can be started by using the docker compose file. Simply adjust the values for ```<host IP>```, ```<host port>``` and ```<path to apps>``` in the files ```docker-compose.yaml``` and ```display-variable.env``` and run 

```
docker-compose run --rm angular
```

This will start the angular service and remove the container after exit.  

# Using the container 

* In order to create a new project run ```ng new SampleApp```. Take care, that write permissions have been granted. 
* In case a locally running X Server display is given, ```code``` can be used to start the editor (note: don't use ```127.0.0.1``` for the IP). Linux users might have to enable the X Server port (check with ```ps ax | grep Xorg```) and to add the docker machine to the X access control list (see ```xhost```)
* Change into the created project directory. Run ```ng serve --host 0.0.0.0``` in order to run the app (note: for access with IE or Chrome in Windows, edit the ```SampleApp/src/polyfills.ts``` file appropriately).
* Open a browser on the host and open ```127.0.0.1:<host port>```.
* Start developing with Visual Studio Code.

# About the tools

## Angular

Angular is a framework for building client applications in HTML and either JavaScript or a language like TypeScript that compiles to JavaScript.Angular combines declarative templates, dependency injection, end to end tooling, and integrated best practices to solve development challenges. Angular empowers developers to build applications that live on the web, mobile, or the desktop. \[&nearr; [_Wikipedia_](https://en.wikipedia.org/wiki/Angular_(application_platform)) &nearr; [_Angular_](https://angular.io/)]   

## Node.js

Node.js is an open-source, cross-platform JavaScript run-time environment for executing JavaScript code server-side. \[&nearr; [_Wikipedia_](https://en.wikipedia.org/wiki/Node.js)]

## Git

Git is a version control system for tracking changes in computer files and coordinating work on those files among multiple people. It is primarily used for source code management in software development, but it can be used to keep track of changes in any set of files. \[&nearr; [_Wikipedia_](https://en.wikipedia.org/wiki/Git) &nearr; [_git_](https://git-scm.com/)]

## Visual Studio Code

Visual Studio Code is a source code editor developed by Microsoft for Windows, Linux and macOS. It includes support for debugging, embedded Git control, syntax highlighting, intelligent code completion, snippets, and code refactoring. It is also customizable, so users can change the editor's theme, keyboard shortcuts, and preferences. \[&nearr; [_Wikipedia_](https://en.wikipedia.org/wiki/Visual_Studio_Code) &nearr; [_Microsoft_](https://code.visualstudio.com/)]
