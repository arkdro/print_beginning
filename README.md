# files

## Description

find files with filenames matching the given regex recursively,
starting from the given directory,
print the name of the file and several beginning lines of the file.

You can do the same with a script like this, it's just little slower:

```
find . -type f -name '[0-9]*.txt' |\
    sort |\
    while read n
        do
            head -n 8 -v $n
            echo
        done
```

## Usage

`PROG DIR -n N -m MATCH -c`

All parameters are optional.

`DIR` - directory to search. Default: current directory.
`-n N` - number of lines to print. Default: 5.
`-m MATCH` - regex to find files. Default: `[0-9].*\.txt.*`.
`-c` - compact: don't print filename, don't print empty line after the file. Default: false.

## build

`dune build`
