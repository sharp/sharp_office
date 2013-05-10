# SharpOffice

Convert office document to pdf and swf

## Requirements

### Swftools

  sudo add-apt-repository ppa:guilhem-fr/swftools
  sudo apt-get update
  sudo apt-get install swftools

### LibreOffice
　 
  sudo add-apt-repository ppa:libreoffice/ppa 
  sudo apt-get update
  sudo apt-get install libreoffice

### ImageMagick

  sudo apt-get install imagemagick libmagickcore-dev

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
