# dr-quine

dr-quine is a little project about self-reproduction type of programs: quine's ones.
Every exercises have been done in C, ASM and Perl.

## Colleen

Colleen is a quine program that print his source code. The program must have a main function, 2 comments (on in the main function and one outside) and one other function that will be called in the main's one.

```
make && ./Colleen > tmp && diff Colleen.c tmp
```

## Grace

Grace is a quine program that will create a file named `Grace_kid` with the source code of Grace. The program must have 3 define/macro, 1 comment, no main declared, and be preprocessed by a define/macro.
```
make && ./Grace && diff Grace.c Grace_kid.c
```

## Sully

Sully is a quine program that will create `n` program `Sully_N` (from `n` to 0), where `n` is a number defined in the main program `Sully`.