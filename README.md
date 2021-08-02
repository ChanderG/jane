# Jane

A Lisp dialect written in Janet.

## About the language

Is a very simple, restricted Lisp that looks a bit like Janet. Will document the language when it gets enough shape. Right now adding features on a whim.

I started out with Norvig's first version [lispy](https://norvig.com/lispy.html) for what it's worth. 

## Why Janet?

[Janet](janet-lang.org) is a simple, lightweight Lisp. Why not? I wanted the first version of the interpreter to be in a Lisp and I simply picked this one.

Why not a more eshtablished Lisp? One, because I wanted everything to be light weight. Second, I wanted something off the beaten path, so that when I inevitably get stuck, I am forced to find a way out.

## Installation

Needs a recent Janet installed on your machine.

Run the following:
```
source env.sh
```
to setup env variables allowing use of Jane. Sets up a JANEDIR env var that points to this directory.

Run a Repl directly:
```
jane
```

Running a script:
```
jane <path to jane script>
```
Working examples can be found in the `examples/` directory.

## Stdlib

Now contains a simple standard library in `std/`! One more thing: it comes with tests included. (See files named `test_*.jane`).

## Editor Support

For now, comes out of the box with an Emacs mode with simple syntax highlighting for Jane. See: `editor/jane-mode.el`.

## License

MIT
