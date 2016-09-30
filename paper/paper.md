### Introduction

![](https://github.com/tim-mcginley/stat159-project1/blob/master/images/stat159-logo.png)

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

![](https://github.com/tim-mcginley/stat159-project1/blob/master/images/markdown-logo.png)

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

And this produces the GitHub logo up there:

    ![](https://github.com/tim-mcginley/stat159-project1/blob/master/images/markdown-logo.png)

Markdown can do much, much more formatting than this. I'll highlight any
fancy formatting I do down the stretch and show how it was done.

To make life easier on myself, I switched from using nano in the command
line to a more robust standalone markdown called MacDown, and it is with
that application that I wrote these words.

#### Git

![](https://github.com/tim-mcginley/stat159-project1/blob/master/images/git-logo.png)

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

![](https://github.com/tim-mcginley/stat159-project1/blob/master/images/github-logo.png)

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

#### GNU Make

Even though we have divided the project into many different pieces for
good reasons, at the end here there has to be a final paper that's all
in one piece and in a specific format. This could be done manually, of
course, but it can also be automated using the make command. "Make" can
make use of many other bash commands and bash software, like the
universal document converter "Pandoc" which I will talk about in the
next section.

Make requires a file with instructions called a "Makefile" to tell it
what to do. This report is a simple concatenation of the .md files we
created earlier, converted to html. Here's what the contents of the
makefile for this project looks like:

    # all
    all: paper.html

    #HTML
    paper.html: paper.md
        cd paper; pandoc paper.md -s -o paper.html

    #Merging sections
    paper.md: paper/sections/00-abstract.md paper/sections/01-introduction.md paper/sections/02-discussion.md paper/sections/03-conclusions.md
        cd paper/sections; pandoc *.md -s -o paper.md; mv paper.md ../

The words before the colons are targets: it tells make what it's, well,
making. The files after the colons are the dependencies: in other words,
the files that make up the desired result file. The lines after are the
commands that need to be executed, like moving files or converting
document types.

#### Pandoc

![](https://github.com/tim-mcginley/stat159-project1/blob/master/images/pandoc-logo.png)

Pandoc is a powerful command line program that can convert documents of
various formats from one to the other. In this workflow, the biggest
advantage of pandoc is that we can write a paper using a relatively
simple format like markdown, and then later convert that to whatever
format we'd need. Writing this directly in HTML would take significantly
longer. Pandoc could even covert this to a Word document if we wanted!

### Conclusions

This project has been a great hands-on method of learning the mechanics
of a reproducible workflow. I'll take this space to discuss some of the
lessons learned and some other takeaways from the experience.

Front to back, the project has taken me about three hours to complete.
Most of this time has been spent physically writing, which was easily
the most challenging part. The majority of the rest of the time was
spent figuring out various syntax issues, primarily on Google or by
going through the Stat 159 github and previous lab work. Other than this
research, I didn't use any outside resources other than MacDown, which
has been really helpful when it comes to the actual writing.

I did this almost entirely on my own, save for a few questions I had
answered by a friend of mine who completed the project before I did–
mainly about how to use the GitHub website, which I am not super familar
with. I didn't get "stuck" really at any point, although it did take me
a second to "get" the whole phony makefile target procedure.

Overall this went smoothly and I feel prepared to replicate this
procedure with real analysis soon.
