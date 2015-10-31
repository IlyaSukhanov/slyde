Slyde
=====

Slyde is a horizontally scrolling lazy load image gallery theme for Kipi_
enabled applications such as digikam_. Check out a `slyde demo.`_ Slyde uses
the sly_ library, which provides many methods for navigating the
gallery; scrolling, buttons, and drag and drop.

.. _Kipi: https://en.wikipedia.org/wiki/KDE_Image_Plugin_Interface
.. _digikam: http://www.digikam.org/
.. _sly: https://github.com/darsain/sly
.. _slyde demo.: http://dotcommie.net/gallery


Installation
------------

Installing slyde, is a matter of copying into your user theme directory:

1. mkdir -p ~/.kde/share/apps/kipiplugin_htmlexport/themes
2. cd ~/.kde/share/apps/kipiplugin_htmlexport/themes
3. git clone https://github.com/IlyaSukhanov/slyde.git

Usage
-----

To use slyde:

1. Fire up a Kipi compatible program such as `digikam`_
2. Invoke HTML Export plugin: Export>HTML Export.
3. Select the desired images for export.
4. Select the slyde theme from the theme selector
5. Adjust settings as desired and click finish.

.. _digikam: http://www.digikam.org/

Tips
----

Slyde requires two configuration parameters, maximum width and height of images.
During scaling proportions will be maintaned, but bound by this size. For aesthetics
reasons, the ratio should be kept similar to the most common one of the gallery.

After setting slyde settings kipi will prompt with image export settings, Here
"Max Size" should be checked and set to the largest of the image width and heigh
parameters set for slyde.

License
-------

This project is licensed under the `MIT License`_.

.. _MIT License: http://opensource.org/licenses/MIT

