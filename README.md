shinobiplay: Grids Gallery (Objective-C)
=====================

An app demonstrating the functionality of **shinobigrids**.

![Screenshot](screenshot.png?raw=true)

Cloning or downloading the project
------------------
This project uses git submodules to include some code common to various **shinobiplay** projects.

If you clone this project using GitHub Desktop, the submodules should be checked out automatically for you. Otherwise you can fetch the submodules on the command line using:

    $ git submodule update --init --recursive
    
If you [download the zip](../../archive/master.zip) rather than cloning the project, you'll also have to download the submodule zips:

* Download [play-utils](https://github.com/ShinobiControls/play-utils/archive/master.zip) and extract its contents into the **GridsGallery/ShinobiPlayUtils/** directory.

Your directory structure should end up looking something like this:

    .
    └── GridsGallery
        ├── GridsGallery
        ├── GridsGallery.xcodeproj
        └── ShinobiPlayUtils
            └── ShinobiPlayUtils
                ├── ShinobiPlayUtils
                └── ShinobiPlayUtils.xcodeproj
                
Building the project
------------------

In order to build this project you'll need a copy of **shinobigrids**. If you don't have it yet, you can download a free trial from the [**shinobicontrols** website](https://www.shinobicontrols.com).

If you've used the installer to install **shinobigrids**, the project should just work. If you haven't, then once you've downloaded and unzipped **shinobigrids**, open up the project in Xcode, and drag ShinobiGrids.framework from the finder into Xcode's 'frameworks' group, and Xcode will sort out all the header and linker paths for you.

If you're using the trial version you'll need to add your trial key. To do so, open up **GridsGalleryViewController.m** and add the following line inside `viewDidLoad`:

    [ShinobiGrids setTrialKey:@"your trial key"];

Contributing
------------

We'd love to see your contributions to this project - please go ahead and fork it and send us a pull request when you're done! Or if you have a new project you think we should include here, email info@shinobicontrols.com to tell us about it.

License
-------

The [Apache License, Version 2.0](LICENSE) applies to everything in this repository, and will apply to any user contributions.
