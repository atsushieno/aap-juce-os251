It is a port of [utokusa/OS-251](https://github.com/utokusa/OS-251) ported to [aap-juce](https://github.com/atsushieno/aap-juce). Note that it's not working yet.

This repository contains only a set of build scripts with almost no creative choices (which is a requirement for any copyright claims) but I leave GPLv3 license text for compatibility with OS-251, JUCE and aap-juce.

Unlike other aap-juce porting projects, you have to run OS-251 specific setup befor running `make`:

```
cd external/OS-251/src/jsui
npm ci
npm run build
```
