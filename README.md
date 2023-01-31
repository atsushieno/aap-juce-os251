It is a port of [utokusa/OS-251](https://github.com/utokusa/OS-251) to [Audio Plugins For Android](https://github.com/atsushieno/aap-core), using [aap-juce](https://github.com/atsushieno/aap-juce).

![OS251 standalone](docs/images/os-251-standalone.png)
![OS251 on aaphostsample](docs/images/os-251-aaphostsample.png)
![OS251 as MidiDeviceService](docs/images/os-251-midi-device.png)

This repository contains only a set of build scripts with almost no creative choices (which is a requirement for any copyright claims) but I leave GPLv3 license text for compatibility with OS-251, JUCE and aap-juce.

Unlike other aap-juce porting projects, you have to run OS-251 specific setup for React UI. It is covered in `Makefile` so running `make` would suffice, but depending on your node/npm/webpack environment, you might need `NODE_OPTIONS=--openssl-legacy-provider make`. Regarding the environment variable, see [this StackOverflow thread](https://stackoverflow.com/questions/69394632/webpack-build-failing-with-err-ossl-evp-unsupported).

