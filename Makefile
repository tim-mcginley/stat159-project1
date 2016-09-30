


all: paper.html

#HTML
paper.html: paper.md
	cd paper; pandoc paper.md -s -o paper.html

#Merging sections
paper.md: paper/sections/00-abstract.md paper/sections/01-introduction.md paper/sections/02-discussion.md paper/sections/03-conclusions.md
	cd paper/sections; pandoc *.md -s -o paper.md; mv paper.md ../

#clean
clean:
	rm paper/paper.*
