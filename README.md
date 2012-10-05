#PLPoller

by Kasper Timm Hansen

- [Follow @kaspth on Twitter](http://twitter.com/kaspth)

## What is PLPoller?

PLPoller is a class which calls a block at given time intervals.

## Get started

Copy over PLPoller.h and .m to your project, and you're good to go.

Set up your poller with `+pollerWithBlock:` or `+pollerWithTimeInterval:block:`. 
Then call `-start`, and you're polling.

You can also pause the polling or stop it altogether with `-pause` or `-stop`, respectively.

Check out the test app to see how a simple timer can be created.

## Uses (ideas, and what not...)

- Autoupdating a feed at certain times. Check every 10 min. for instance. 
- Make the cursor blink, if you're writing the next great text editor.

## Downloading the code

You can [get PLPoller on github](http://github.com/kaspth/PLPoller).