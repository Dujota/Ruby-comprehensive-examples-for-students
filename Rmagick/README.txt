=== Manipulating Image Data with RMagick ===
  Programmers need ways to create and manipulate imgaes across different platforms in many different, complicated formats. In Ruby, the easiest  way to do this is with RMagick.
	The RMagick gem is a Ruby binding for the ImageMagick library. It can be installed by running "gem install rmagick", but you must have the ImaeMagick library installed first. If you are on Linux, you probably already have it;
if you are on Mac OS X, you can install is using Homebrew. the ImageMagick website at http://imagemagick.org might be a good place to start.
	RMagick is able to support all the image formats supported by the underluing library. 

=== Resolving the problem that we can't install rmagick by no header issue.
It looks like ImageMagick 7 changed include file path.
On building rmagick, since it includes file as wand/MagickWand.h There are no workarounds. It looks like sticking with ImageMagick 6 for now.
On Mac OS X (I tested on Sierra), I used HomeBrew's versions tap like:

brew tap homebrew/versions
brew install imagemagick@6

Then, use the path showen on above installation:

PKG_CONFIG_PATH=/usr/local/opt/imagemagick@6/lib/pkgconfig gem install rmagick

To install with ImageMagick 6.
===
