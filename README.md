# using uLisp with nix
A set of utility scripts for first creating the required environment, then fetching uLisp, then compiling uLisp, then uploading uLisp and finally communicating with uLisp.

## Communicating over serial using picocom
Writing code directly in picocom can be very tedious since you cannot delete characters and stuff.
I recommend using [nvim-send-to-term](https://github.com/mtikekar/nvim-send-to-term) so you can write your code peacefully in a normal behaving buffer and then send the code to a terminal running picocom when you are ready.

### Terminate running code
Send a `~` character over picocom.

### Exit picocom
press ctrl-a ctrl-x

# links
- [uLisp](http://www.ulisp.com)
- [uLisp on Micro:bit](http://www.ulisp.com/show?3CXJ#bbc-microbit-v2)

# TODO
- simplify shell.nix, its a mess.
- figure out how to make a nix flake instead of shell.nix.
- organize code and scripts, I want to create scripts for at least arduino nano and electro smith seed.
