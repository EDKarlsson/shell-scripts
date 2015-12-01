# Regular Expressions

### What are regular expressions?

Symbolic notations used to identify patterns in text. Not all regular expresions are the same from programming language to language, or tool to tool.

> This are regular expressions as described in the POSIX standard

#### grep - Search Through Text

grep - global regular expression print

Essentially, grep searches text files for the occurence of a specified regular expression and outputs any line containing a match to standard output.

    grep [options] regex [file...]

grep    -   options
----
-i      -   ignore case --ignore-case
-v      -   invert match --invert-match
-c      -   Print the number of matches (or non-matches if the -v option is also specified) insead of the lines themselves. Can also use --count.
-l      -   Print the name of each file that contains a match instead of the lines themselves. --files-with-matches
-L      -   Like -l but print only names that do NOT match. --files-without-matches
-n      -   Prefix each matching line with the number of the line within the file.  --line-number
-h      - For multifile searches, suppress the output of filenames. --no-filename


#### Metacharacters and Literals
grep uses simple regular expressions.

    ^ $ . [ ] { } - ? * + ( ) | \

All other characters are considered literals, though backslash character is used in a few cases to create _metasequences_

##### The Any Character

dot or period caracter is used to match any _character_ in the position it is specified

    grep -h '.zip' dirlist*.txt

    bunzip2
    bzip2
    bzip2recover
    gunzip
    gzip
    funzip
    gpg-zip
    preunzip
    prezip
    prezip-bin
    unzip
    unzipsfx

##### Anchors

The caret '^' and dollar sign '$' characters are treated as anchors in regular expressions. They will only cause the match to occur if the regular expression is found at the beginning of the line '^' or at the end of the lint '$'

    grep -h '^zip' dirlist*.txt

    zip
    zipcloak
    zipgrep
    zipinfo
    zipnote
    zipsplit

    grep -h 'zip$' dirlist*.txt

    gunzip
    gzip
    funzip
    gpg-zip
    preunzip
    prezip
    unzip
    zip

    grep -h '^zip$' dirlist*.txt
    zip
    
Crossword puzzle example

    grep -i '^..j.r$' /usr/share/dict/words

    Major
    major

#### Bracket Expressions and Character Classes

Match a single character from a specified set of characters by using _bracket expressions_. With bracket expressions we can specify a set of characters (including characters that would otherwise be interpreted as metacharacters) to be matched.

Example matching any line that contains _bzip_ or _gzip_

    grep -h '[bg]zip' dirlist*.txt

    bzip2
    bzip2recover
    gzip

A few things to note.

* A set can contain any number of characters.
* Metacharacters lose their special meaning when placed with brackets.
* There are 2 exceptions to this, they have different meanings.
    1. The caret '^' - used to indicate negation.
    2. The dash '-' - used to indicate a character ranger.  ##### Negation

First character in bracket expressions is a caret '^'

The remaining characters are characters _NOT_ to be at the given character position.

Previous example:

    grep -h '.zip' dirlist*.txt

    bunzip2
    bzip2
    bzip2recover
    gunzip
    gzip
    funzip
    gpg-zip
    preunzip
    prezip
    prezip-bin
    unzip
    unzipsfx

Now with negation:

    grep -h '[^bg]zip' dirlist*.txt

    bunzip2
    gunzip
    funzip
    gpg-zip
    preunzip
    prezip
    prezip-bin
    unzip
    unzipsfx

We got all files that contain the string zip that do not have _b_ or _g_ preceding it. 

##### Traditional Character Ranges

Construct a regular expression that would find every file whose name begins with an uppercase letter

    grep -h '^[ABCDEFGHIJKLMNOPQRSTUVWXYZ]' dirlist*.txt

A more simple way of doing it would be to:

    grep -h '^[A-Z]' dirlist*.txt
    MAKEDEV
    ControlPanel
    GET
    HEAD
    POST X X11 Xorg
    MAKEFLOPPIES
    NetworkManager
    NetworkManagerDispatcher

Find any filenames that starts with letters or numbers:

    grep -h '^[A-Za-z0-9]' dirlist*.txt

What about trying to match a '-' character?

    grep -h '[A-Z]' dirlist*.txt

This will only return A through Z but this will return the dash and uppercase A-Z

    grep -h '[-AZ]' dirlist*.txt


#### POSIX Character Classes

POSIX Character Classes

Character Class |  Description
-----           |  -------
[:alnum:]       |  Alphanumeric characters in ASCII, equivalent to [A-Za-z0-9] 
[:word:]        |  Same as [:alnum:] along with '_' character
[:alpha:]       |  Alphabetic characters in ASCII, equivalent to [A-Za-z]
[:blank:]       |  Includes the space and tab characers.
[:cntrl:]       |  ASCII control codes; includes the ASCII characters 0 through 31 and 127
[:digit:]       |  The numerals 0 through 9
[:graph:]       |  The visible characters; in ASCII, includes characters 33 through 126.
[:lower:]       |  The lowercase letters.
[:punct:]       |  The punctuation characters; in ASCII, equivalent to [-!"#$%&'()*+,./:;<=>?@[\\\]_`{|}~] "<- left in b/c syntax coloring in vim.
[:print:]       | The printable characters; all the characters in  [:graph:] plus the space character.
[:space:]       |  The whitespace characters including space, tab, carriage return, newline, vertical tab, and form feed; in ASCII, equivalent to [ \t\r\n\v\f]
[:upper         | The uppercase characters
[:xdigit:]      |  Characters used to express hexadecimal numbers; in ASCII, equivalent to [0-9A-Fa-f]

#### POSIX Basic vs. Extended Regular Expressions

There is no easy way to express partial ranges such as [A-M] even with character classes.


#### Alternation

A bracket expression a single character to match from among a set of expressions. Like bracket expressions allows a single character to match from a set of specified characters, 

_alternation_ allows matches from a set of strings or other 

demonstration


    echo "AAA" |  grep AAA
    echo "BBB" |  grep AAA


    echo "AAA" |  grep -E  'AAA|BBB'
    echo "BBB" |  grep -E  'AAA|BBB'
    echo "CCC" |  grep -E  'AAA|BBB'

    echo "AAA" |  grep -E  'AAA|BBB|CCC'
    echo "AAA" |  grep -E  'AAA|BBB'


This will match any file that begins with bz, gz, or zip

    grep -Eh '^(bz|gz|zip)' dislist*.txt

If the ( ) are removed then it will search for any file that begins with bz or _contains_ or _contains_ zip

    grep -Eh '^(bz|gz|zip)' dislist*.txt


#### Quantifiers

Different ways to specify the number of times an element is matched.

Match an element zero times or one time
> ?

Equivalent of saying optional match.

Example of checking for a phone number to be valid.


    ^\(?[0-9][0-9][0-9]\)? [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9$]

The '?' mark means that the character can be matched zero or one time. This allows 2 formats to be matched.

> (nnn) nnn-nnnn  or  nnn nnn-nnnn


    echo "(555) 123-4567" | grep -E '^\(?[0-9][0-9][0-9]\)?  [0-9][0-9][0-9]$'

    (555) 123-4567


    echo "555 123-4567" | grep -E '^\(?[0-9][0-9][0-9]\)?  [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$'

    555 123-4567

    echo "AAA 123-4567" | grep -E '^\(?[0-9][0-9][0-9]\)?  [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$'


Nothing is found.


Match an element zero or moretimes

> *

It is an optional item; however, unlike '?', the item may occur any number of times, not just once.


    [[:upper:]][:upper:][:lower:] ]*\.


This bracket expression consists 3 items:

1.  [:uppper:] character class
2.  [:upper:] and [:lower:] in a bracket expression
3.  a space, and a period escaped with a backslash

The second element is trailed with an '*' metacharacter which allows for any number of upper or lowercase characters and spaces to match after the leading uppercase letter


    echo "This works." | grep -E [[:upper:]][:upper:][:lower:] ]*\.

    This works.

    echo "This works." | grep -E [[:upper:]][:upper:][:lower:] ]*\.

    This works.

    echo "this does not" | grep -E [[:upper:]][:upper:][:lower:] ]*\.


Match an element one or more times

> + -

This is like '*' however it requires at least one instance of the preceding element to cause a match.

    ^([[:alpha:]]+ ?)+$

    echo "This that" | grep -E '^([[:alpha:]]+ ?)+$'

    This that

    echo "a b c" | grep -E '^([[:alpha:]]+ ?)+$'

    a b c

    echo "a b 9" | grep -E '^([[:alpha:]]+ ?)+$'

     

    echo "abc  d" | grep -E '^([[:alpha:]]+ ?)+$'



"a b 9" does not match because it contains a non alphabetic character
"abc  d" does not match because it has 2 spaces.


Match an element a specific number of times.

> { }

Specifying the number of matches.

Specified | Meaning
------- | --------
{n}     | Match the preceding element if it occurs exactly _n_ times.
{n,m}   | Match the preceding element if it occurs at least n times, but no more than m times.
{n,}    | Match the preceding element if it occurs _n_ times or more
{,m}    | Match the preceding element if it occurs no more than _m_ times


This allows the previous expression to be simplified

   ^\(?[0-9][0-9][0-9]\)?     [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$


Simplified to

    ^\([0-9]{3}\)?  [0-9]{3}-[0-9]{4}$


### Using Find

The _find_ command supports a test based on a regular expression.

Important things to keep in mind using _find_ versus _grep_
_grep_ will print a line when the line _contains_ a string that matches.
_find_ requires the pathname to _exactly match_ the regular expression.

Example using find that matches every pathname that contains any character that is not a member of the following set:

    [-_./0-9a-z-A-Z]

This kind of scan would reveal pathnames that contain embedded spaces and other pottentially offensive characters.

    find . -regex '.*[-_./0-9a-z-A-Z].*'

Due to the require to match the entire pathname, we need to use '.*' at both ends of the expression to match zero or more instances of any character. Within the expression we use a negated bracket expression containing our set of acceptable pathname characters.

##### Searching for Files with locate

The _locate_ program supports both basic (the _--regexp_ option) and extended ( --regex ) regular expressions.

    locate --regex 'bin/(bz|gz|zip)'
    /bin/bzcat
    /bin/bzcmp
    ...


##### Searching for Text with less and vim

    less phonelist.txt
    
    (232) 298-2265
    (624) 381-1078
    (540) 126-1980 
    (874) 163-2885 
    (286) 254-2860 
    (292) 108-518 
    (129) 44-1379 
    (458) 273-1642 
    (686) 299-8268 
    (198) 307-2440

    /^\([0-9]{3}\) [0-9]{3}-[0-9]{4}$

Vim allows for basic regular expressions.

    /([0-9]\{3\}) [0-9]\{3\}-[0-9]\{4\}





