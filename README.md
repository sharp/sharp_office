# SharpOffice

Convert office document to pdf and swf

## Requirements

### Swftools

### OpenOffice

### ImageMagick

## Installation

Add this line to your application's Gemfile:

    gem 'sharp_office'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sharp_office

## Usage

``` ruby
require 'rubygems'
require 'sharp_office'
SharpOffice.process('/Users/apple/Documents/test.doc')
=> {:status=>"ok", :pdf_path=>"/Users/apple/Documents/test-doc.pdf", :swf_path=>"/Users/apple/Documents/test-doc.swf", :cover_path=>"/Users/apple/Documents/test-doc.png"} 

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
