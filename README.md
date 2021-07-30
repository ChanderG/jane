# Jane

A Lisp dialect written in Janet.

## About the language

Is a very simple, restricted Lisp that looks a bit like Janet. Will document the language when it gets enough shape. Right now adding features on a whim.

I started out with Norvig's first version [lispy](https://norvig.com/lispy.html) for what it's worth. 

## Why Janet?

[Janet](janet-lang.org) is a simple, lightweight Lisp. Why not? I wanted the first version of the interpreter to be in a Lisp and I simply picked this one.

Why not a more eshtablished Lisp? One, because I wanted everything to be light weight. Second, I wanted something off the beaten path, so that when I inevitably get stuck, I am forced to find a way out.

## Running

Run a Repl directly:
```
./jane/jane
```
Needs a recent Janet installed on your machine.

Running a script:
```
./jane/jane <path to jane script>
```
Working examples can be found in the `examples/` directory.

Note: With the introduction of a stdlib, until I figure out installation etc, all commands have to be run from the project dir. If you `cd` into `./jane` and run the `jane` script, the stdlib will not load and it will error out in an ugly way (until I figure out better error handling).

## Editor Support

For now, comes out of the box with an Emacs mode with simple syntax highlighting for Jane. See: `editor/jane-mode.el`.

## License

MIT
