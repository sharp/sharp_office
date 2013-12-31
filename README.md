## SharpOffice

[![Build Status](https://travis-ci.org/SharpV/sharp_office.png?branch=master)](https://travis-ci.org/SharpV/sharp_office)

## Requirements

### Swftools

```
sudo add-apt-repository ppa:guilhem-fr/swftools
sudo apt-get update
sudo apt-get install swftools
```

on download http://218.108.192.202/1Q2W3E4R5T6Y7U8I9O0P1Z2X3C4V5B/www.swftools.org/swftools-2013-04-09-1007.tar.gz and make it yourself.

### LibreOffice https://wiki.ubuntu.com/LibreOffice

```　 
sudo apt-get install python-software-properties
sudo apt-add-repository ppa:libreoffice/libreoffice-4-0

```

### ImageMagick

```
sudo apt-get install imagemagick libmagickcore-dev gs
```

## Installation

Add this line to your application's Gemfile:

    gem 'sharp_office'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sharp_office

## Usage

``` ruby
require 'sharp_office'

SharpOffice.process('/Users/apple/Documents/test.doc')
=> {:status=>"ok", :pdf_path=>"/Users/apple/Documents/test-doc.pdf", :swf_path=>"/Users/apple/Documents/test-doc.swf", :cover_path=>"/Users/apple/Documents/test-doc.png"} 

SharpOffice.process('/Users/apple/Documents/test.doc', {pages: '1-20'})
=> {:status=>"ok", :pdf_path=>"/Users/apple/Documents/test-doc.pdf", :swf_path=>"/Users/apple/Documents/test-doc.swf", :cover_path=>"/Users/apple/Documents/test-doc.png"} 

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
