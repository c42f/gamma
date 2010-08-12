= To Add a New Prebuilt Directories = 

The prebuilt directories are very similar; making one for a new platform
isn't difficult. 

First, make sure the directory name follows this pattern -- 
   [os name]-[32 or 64 bit]-[Python version]
   
[os name] must be one of osx, win or linux.
[32 or 64 bit] must be 32 or 64 depending on whether or not Python is 
compiled in 32 or 64 bit mode. Note that whether or not the OS is 32 or 64
bit doesn't matter here, only Python.
[Python version] must be py25, py26 or py27. 

The directory names are parsed by pygamma/setup.py so don't stray from this
format.

To populate a new prebuilt directory, build on the appropriate platform and 
then copy everything in homemade EXCEPT pygamma_version.py to the new 
prebuilt directory. 

Build notes are useful but not mandatory.
