# What is this?

This is a repository I'm using to track my progress (over the summer of 2015) as I read and study *[Structure and Interpretation of Computer Programming](https://mitpress.mit.edu/sicp/)* (a.k.a. SICP), a legendary computer science book that uses Scheme, a minimalistic dialect of the programming language Lisp, to explore fundamental principles of abstraction.

# What does this repository include?

I'm storing all of my answers to the book's exercises and their output, as well as a log of my reading and other SICP-related activity, here in this repository.

# What is your setup for running Lisp code?

I'm glad you asked! I spent the better part of two days coming up with a good way to follow along the book's examples and exercises in real code, so I hope this can save you some time. I wanted two things:

	1. A way to try out individual lines of code from the book and modify them to see what they would produce, i.e. a console.
	2. A way to do each exercise and run it a whole, saving both my original work and the output in files that I could reference later.
	
## 1. My Lisp REPL
	
The first is fairly easily addressed by installing a REPL (Run-Eval-Print Loop) for Scheme, the dialect of Lisp that SICP uses.

Of course, just as there are dialects of Lisp, distributions of Linux, and countless other needlessly complicating decisions in the world of techie-oriented software, there are different installations of Scheme. Fortunately, the authors are clear about which one is compatible with all of the syntax the book uses: **[MIT Scheme](https://www.gnu.org/software/mit-scheme/)**. Unfortunately, this one isn't the easiest to set up on a Mac, especially if you want the REPL to have the nice features that most other REPLs have (that is, text completion, filename completion, and memory of previously run commands accessible with the up arrow).

Thankfully, [this recent blog post](http://thesabbir.com/setting-up-mit-scheme-on-os-x-yosemite-with-homebrew/) by [Sabbir Ahmed](https://github.com/thesabbir) provides clear instructions on how to install MIT Scheme and add these features to its REPL fairly painlessly using the excellent package-manager, [Homebrew](http://brew.sh).

Follow all of his steps and run `scheme` in your Terminal, and you'll be all set with a prompt that can evaluate any of the examples from the book!

### Alternatives

On the way to settling on MIT Scheme I ruled out the other installations of Scheme I saw recommended for studying SICP. I'll mention them here in case you're following along and want to consider them yourself (both have merits) or know why I ruled them out.

* **[Racket](http://racket-lang.org)** is recommended for SICP at least as much as MIT Scheme, if not more. It's modern and well-maintained, and comes with a nice editor called [DrRacket](http://docs.racket-lang.org/drracket/). If I were wanting to use Scheme for anything other than studying SICP, I'd probably go with this. The reason I didn't for SICP is that it exceeds the scope of what is needed for SICP, and isn't 100% compatible with the examples in the book. There's (a package)[http://www.neilvandyke.org/racket-sicp/] which adds SICP support to it, but the package hasn't been updated in quite a while and may not work as well with newer versions of Racket. Still, if I'm not happy with MIT Scheme after a while, I'll likely switch to this.
* **[Gambit Scheme](http://gambitscheme.org/wiki/index.php/Main_Page)** seems even less directly compatible with SICP given what little I know, but it's dead easy to set up on a Mac with [Homebrew](http://brew.sh) (as [this blog post](http://www.uponmyshoulder.com/blog/2011/so-you-want-to-do-the-sicp/) explains) and great if you just want to get a simple REPL up and running quickly. Ultimately I opted for MIT Scheme over this again because I can feel confident that MIT Scheme is made to work with SICP and visa versa.

So you've got a Lisp console running to experiment with individual lines of code—now what about doing the exercises?

## 2. My Lisp IDE

The second thing I said I wanted above calls for an IDE (Integrated Development Environment) for MIT Scheme (since that was my Scheme installation of choice).

The only IDEs I ever saw mentioned for MIT Scheme were [emacs](https://en.wikipedia.org/wiki/Emacs) and [Edwin](http://groups.csail.mit.edu/mac/ftpdir/scheme-7.4/doc-html/user_8.html) (an emacs-like editor that comes packaged with MIT Scheme), both of which are CLIs (Command Line Interfaces), meaning you're doing your text editing in the Terminal. I didn't want to deal with the learning curve of a command line editor *on top* of the learning curve of SICP, so I fudged a bit on my IDE, just using the REPL to evaluate `.scm` (Scheme) files that I'd typed in a text editor.

How so?

The text editor I'm using is [Chocolat](https://chocolatapp.com), but any plain text editor you prefer—TextEdit, TextMate, even Xcode—should work just fine. Chocolat is my go-to editor for plain text and any one-off code files that aren't part of one of my Xcode projects, and it has a "Truffle" you can install to provide syntax highlighting for Scheme, so it suits my purposes here nicely.

As for actually evaluating the code I write using Chocolat, I simply pass it to `mit-scheme` (which can be abbreviated as `scheme`) in Terminal, [redirecting](https://en.wikipedia.org/wiki/Redirection_(computing)) its input and output from the console to the input .scm file I've saved with Chocolat and the file where I want the output to go (which will be overwritten if it already exists or created automatically if it doesn't) [as described in the MIT Scheme documentation](http://www.gnu.org/software/mit-scheme/documentation/mit-scheme-user/Command_002dLine-Options.html#Command_002dLine-Options):

	scheme < /path/to/input.scm > /path/to/output.scm
	
To wrap this all up, I created a function in my `~/.config/fish/config.fish` file (the equivalent of `~/.bash_profile` for [fish](http://fishshell.com), the shell I use in Terminal) to evaluate the .scm file in my "Exercises" folder named with the given exercise number and save its output to my "Output" folder, opening the resulting file in Chocolat, or otherwise create and open it if it doesn't already exist:

	function exercise -d "Creates or evaluates an SICP exercise with a specified number"
		if test -f /usr/local/support/sicp-exercises-in/$argv[1].scm # If exercise already exists, run it and open output.
			scheme < /usr/local/support/sicp-exercises-in/$argv[1].scm > /usr/local/support/sicp-exercises-out/$argv[1].scm				choc /usr/local/support/sicp-exercises-out/$argv[1].scm
		else # Otherwise, create it.
			choc /usr/local/support/sicp-exercises-in/$argv[1].scm
		end
	end
	
(Note that /usr/local/support/sicp-exercises-in and /usr/local/support/sicp-exercises-out are just symlinks to my "Exercises" and "Output" folders (included in this repository), so I can rename them and move them around without breaking this function. Also, note that this function just assumes that the first argument passed to it will be the number of the exercise which it should use as the filename; don't expect it to parse arguments intelligently. There are undoubtedly much better ways to implement this—I just threw it together for myself without really knowing what I was doing and I'm sharing it here more as a source of ideas for creating an SICP workflow than as something I recommend copying verbatim. That said, if you use fish and understand what this is doing, feel free to take it and run with it, and definitely let me know if you come up with something better! :)

Aaand that just about completes my setup for studying SICP! As I read I can switch over to the REPL at any time and when I'm ready to work on exercise x I just run `exercise x` in my terminal to create the file and then again to evaluate it! Happy Scheming! :)