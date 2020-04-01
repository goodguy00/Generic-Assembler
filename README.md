Generic-Assembler
=================

This is a copy of https://github.com/Eddie-Graham/Generic-Assembler, a highly usable piece of software. Great thanx for the work.

I found some little tweaks i needed to introduce:

- allow for any file-name-postfix, esp. '.asm'
- extend the naming for LABEL, allow for numbers and '_'
- introduced proper command-line options (using picocli library)

Calling the progam now requires the CLASSPATH to include the picocli library (@ https://picocli.info/):

*export CLASSPATH=\<path to picocli-jar>:\<path to bin directory>*

*java Assemble*

> Usage: **Assemble** [-dhtV] [-e=\<fErr>] [-o=\<fOutP>] [-s=\<fSpec>] \<fAsm> [\<fOut>] 
> outputs machine language for assembler file 
>     \<fAsm>        Assember Source file 
>     [\<fOut>]       Output file
>
>   -d            Debug option 
>   -e=\<fErr>        Error file 
>   -h, --help        Show this help message and exit. 
>   -o=\<fOutP>        Output file 
>   -s=\<fSpec>        Specification file 
>   -t            Debug tree option 
>   -V, --version      Print version information and exit.

