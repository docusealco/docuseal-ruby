# DocuSeal Ruby Library

The DocuSeal Ruby library provides seamless integration with the DocuSeal API, allowing developers to interact with DocuSeal's electronic signature and document management features directly within Ruby applications. This library is designed to simplify API interactions and provide tools for efficient implementation.

## Documentation

Detailed documentation is available at [DocuSeal API Docs](https://www.docuseal.com/docs/api).

## Installation

To install the library, run:

```sh
gem install docuseal
```

If you want to build the gem from source:

```sh
gem build docuseal.gemspec
```

### Requirements

- Ruby 2.5+.

### Bundler

Add the library to your Gemfile for projects using Bundler:

```ruby
source 'https://rubygems.org'

gem 'docuseal'
```

## Usage

### Configuration

Set up the library with your DocuSeal API key based on your deployment. Retrieve your API key from the appropriate location:

#### Global Cloud

API keys for the global cloud can be obtained from your [Global DocuSeal Console](https://console.docuseal.com/api).

```ruby
require 'docuseal'

Docuseal.key = 'your_api_key_here'
```

#### EU Cloud

API keys for the EU cloud can be obtained from your [EU DocuSeal Console](https://console.docuseal.eu/api).

```ruby
require 'docuseal'

Docuseal.key = 'your_api_key_here'
Docuseal.url = 'https://api.docuseal.eu'
```

#### On-Premise

For on-premise installations, API keys can be retrieved from the API settings page of your deployed application, e.g., https://yourdocusealapp.com/settings/api.

```ruby
require 'docuseal'

Docuseal.key = 'your_api_key_here'
Docuseal.url = 'https://yourdocusealapp.com/api'
```

### Basic Examples

#### List Templates

```ruby
# list templates
Docuseal.list_templates

# retrieve single template
Docuseal.get_template(1)
```

### Configuring Timeouts

Set timeouts to avoid hanging requests:

```ruby
Docuseal.open_timeout = 70
Docuseal.read_timeout = 90
```

## Support

For feature requests or bug reports, visit our [GitHub Issues page](https://github.com/docusealco/docuseal-ruby/issues).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
