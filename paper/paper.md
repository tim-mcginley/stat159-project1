### Introduction

This paper is designed to increase facility with the basic building
blocks that collaborative and reproducible science are built on, such as
the using the shell, text editors, markdown, version control, makefiles,
etc. In the sections following, I will discuss the process and tools
that go into making a paper such as the one you are currently reading,
and some of the reasons why I did things the way I did.

### Discussion

#### File Structure Setup

The first step in starting any data-driven project is to set up the
basic file structure that will be used to house and navigate to the
various building blocks that go into the final report. I started by
creating a folder inside my prexisting 159 class projects folder called
"project1" and then changing directories to inside it. I did this using
the bash shell; here's the code used:

    cd ~/Documents/159/stat159projects
    mkdir project1
    cd project1

I repeated this process until the file structure looked like the
following. This structure will make staying organized easy.

    project1/
        - images/
        - paper/
            - sections/

Note that all of these are directories and all are currently empty of
any actual files.

#### File Creation

The next step is to starting creating the files that will eventually
build the paper that you're currently reading. Files are locations in
your computer that contain actual information, and are contained in
folders. Files almost always include a file extension, to differentiate
specific types of files them both from folders and from different types
of files- this helps the operating system to know how to open and
manipulate the files. To write this paper, I'm using a language called
Markdown (which will be discussed in greater detail in the next
section). Markdown files use the file extension ".md", but are
ultimately simple text files that can be created and edited using simple
command line tools.

To write this paper, I divided it into four different markdown files,
one for each section. I did this so that the various parts can be easily
edited and changes can be more easily tracked and localized- if the
paper is modified, only the section that was edited will be marked as
changed. Here's how I created the markdown file for this section in the
shell, using the built-in plain text editor nano:

    cd ~/Documents/159/stat159projects/project1/paper/sections
    nano 02-discussion.md

This opens nano, in which I wrote a line to describe the file to myself
before writing the text file (Control-O on Mac) and then exiting
(Control-X). After this step is completed for every section, the command

    ls

which returns a list of all the files in the current working directory,
returns:

    00-abstract.md      02-discussion.md
    01-introduction.md  03-conclusions.md

So our current file structure for the project is:

    project1/
        - images/
        - paper/
            - sections/
                - 00-abstract.md
                - 01-introduction.md
                - 02-discussion.md
                - 03-conclusions.md

#### File Editing and Markdown

At this point, the next stage is to write the actual bulk of the project
using markdown. Markdown is a basic language and format designed to make
text formatting (paragraphs, tables, quotes, code, colors, etc) simple
and easy to do using plain text. Text formatted in markdown is easy to
read and edit, and will almost definitely format correctly no matter who
or what views it, wherever they are. It is quickly becoming a univeral
language of sorts for academics, scientists, and many online communities
including reddit. It is also easily converted to other common formats,
such as html or pdf.

Markdown can do a lot, such as headers (this produces the header to this
section):

    #### File Editing and Markdown

While this produces the code chunks you've been seeing so far:

``code chunk``

And this produces an informative table:

    | Cal | Texas |
    | --- | ---|
    | 50 | 43 |

  Cal   Texas
  ----- -------
  50    43

Markdown can do much, much more formatting than this. I'll highlight any
fancy formatting I do down the stretch and show how it was done.

To make life easier on myself, I switched from using nano in the command
line to a more robust standalone markdown called MacDown, and it is with
that application that I wrote these words.

#### Git

Any project, especially collaborative projects, require keeping careful
track of changes made and a firm grasp on the chronology of the versions
produced. Working on the wrong version of the file can lead to disaster.
To help with this and other issues like accidental deletion, version
control software like Git has become very popular. Software like Git
keeps track of changes and updates made to files and folders as you make
them (and "commit" the changes), and keeps a record of each committed
change such that files from any version can be recreated seamlessly.
This allows multiple people to work on the same project without risk of
permanently overwriting or deleting anything, and is helpful for
organization and backup purposes even for personal projects. Directories
that are managed by git are called "Repositories."

I set up "project1" as a git repository by using the following commands.

    cd ~/Documents/159/stat159projects/project1
    git init
    git add images
    git add paper
    git status
    git commit -m "Initial commit with files in place"

This last command includes a note describing the action taken.

#### GitHub

Git repositories also have the ability to be used remotely, and one
website which takes advantage of this fact is GitHub. A git repository
that is set up to work with GitHub gets uploaded to and displayed on the
website, making a project accessible from anywhere on earth. It also
allows for easy collaborating and includes many tools to help merge and
organize large collaborative projects. GitHub is also a way to publish
certain versions of code for others, even unknown internet users, to
study or improve on. This makes it a 'hub' of activity for open source
software development.

Here's how we can tie our repository to my public one on GitHub.

    git remote add origin https://github.com/tim-mcginley/stat159-project1.git
    git remote -v
    git push origin master

The local and remote repos are now in sync. Now, every time I want to
change any of my files, I'll have to push them to GitHub or they will
not update.

conclusions
