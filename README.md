ShinobiGrids Bottom Button (Objective-C)
=====================

A demo app showing how to place a button at the bottom of a grid, which will scroll alongside the grid.

![Screenshot](screenshot.png?raw=true)

Building the project
------------------

In order to build this project you'll need a copy of ShinobiGrids. If you don't have it yet, you can download a free trial from the [ShinobiGrids website](http://www.shinobicontrols.com/shinobigrids/).

Once you've downloaded and unzipped ShinobiGrids, open up the project in Xcode, and drag ShinobiGrids.embeddedframework from the finder into Xcode's 'frameworks' group, and Xcode will sort out all the header and linker paths for you.

If you're using the trial version you'll need to add your license key. To do so, open up ViewController.m and add the following line after the grid is initialised:

    _grid.licenseKey=@"your license key";

Contributing
------------

We'd love to see your contributions to this project - please go ahead and fork it and send us a pull request when you're done! Or if you have a new project you think we should include here, email info@shinobicontrols.com to tell us about it.

License
-------

The [Apache License, Version 2.0](license.txt) applies to everything in this repository, and will apply to any user contributions.

