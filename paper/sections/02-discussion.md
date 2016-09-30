### Discussion
#### File Structure Setup

The first step in starting any data-driven project is to set up the basic file structure that will be used to house and navigate to the various building blocks that go into the final report.  I started by creating a folder inside my prexisting 159 class projects folder called "project1" and then changing directories to inside it.  I did this using the bash shell; here's the code used:

``` 
cd ~/Documents/159/stat159projects
mkdir project1
cd project1
```

I repeated this process until the file structure looked like the following.  This structure will make staying organized easy. 

```
project1/
	- images/
	- paper/
		- sections/
```

Note that all of these are directories and all are currently empty of any actual files.  
	
#### File Creation

The next step is to starting creating the files that will eventually build the paper that you're currently reading.  Files are locations in your computer that contain actual information, and are contained in folders. Files almost always include a file extension, to differentiate specific types of files them both from folders and from different types of files- this helps the operating system to know how to open and manipulate the files. To write this paper, I'm using a language called Markdown (which will be discussed in greater detail in the next section). Markdown files use the file extension ".md", but are ultimately simple text files that can be created and edited using simple command line tools.

To write this paper, I divided it into four different markdown files, one for each section.  I did this so that the various parts can be easily edited and changes can be more easily tracked and localized- if the paper is modified, only the section that was edited will be marked as changed.  Here's how I created the markdown file for this section in the shell, using the built-in plain text editor nano:

```
cd ~/Documents/159/stat159projects/project1/paper/sections
nano 02-discussion.md
```

This opens nano, in which I wrote a line to describe the file to myself before writing the text file (Control-O on Mac) and then exiting (Control-X). After this step is completed for every section, the command

```
ls
```
which returns a list of all the files in the current working directory, returns:

```
00-abstract.md		02-discussion.md
01-introduction.md	03-conclusions.md
```

So our current file structure for the project is:

``` 
project1/
	- images/
	- paper/
		- sections/
			- 00-abstract.md
         	- 01-introduction.md
         	- 02-discussion.md
         	- 03-conclusions.md
```

#### File Editing and Markdown

At this point, the next stage is to write the actual bulk of the project using markdown.  Markdown is a basic language and format designed to make text formatting (paragraphs, tables, quotes, code, colors, etc) simple and easy to do using plain text.  Text formatted in markdown is easy to read and edit, and will almost definitely format correctly no matter who or what views it, wherever they are. It is quickly becoming a univeral language of sorts for academics, scientists, and many online communities including reddit.  It is also easily converted to other common formats, such as html or pdf.

Markdown can do a lot, such as headers (this produces the header to this section):

```
#### File Editing and Markdown
```

While this produces the code chunks you've been seeing so far:

```
```code chunk```
```

And this produces an informative table:

```
| Cal | Texas |
| --- | ---|
| 50 | 43 |
```
| Cal | Texas |
| --- | ---|
| 50 | 43 |

Markdown can do much, much more formatting than this.  I'll highlight any fancy formatting I do down the stretch and show how it was done.

To make life easier on myself, I switched from using nano in the command line to a more robust standalone markdown called MacDown, and it is with that application that I wrote these words.




