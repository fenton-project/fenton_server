# Fenton Server

Provides a signed SSH key for authentication to a server running OpenSSH 5.9+ and configured to use SSH Certificate authentication all via a restful api service for the Fenton Project

## Production Deployment

Not recommended at this time

## Developer Setup

* Getting started
```
git clone git@github.com:fenton-project/fenton-server.git
cd fenton-server
bundle install
bundle exec rackup
```

* Ruby version

See Gemfile

* System dependencies

None

* Configuration

None

* Database creation & initialization
```
bundle exec rake db:setup
```

* How to run the test suite

```
bundle exec rake test
```

* Services (job queues, cache servers, search engines, etc.)

None

## Contributing

- Open an issue (please note if you'll be working on it or need assistance)
- Fork the project and do your work in a topic branch.
- Rebase your branch to make sure everything is up to date.
- Commit your changes & tests, then send a pull request.

## License

[Fenton Project](http://fenton-project.github.io/) - SSH Key Management

|                      |                                          |
|:---------------------|:-----------------------------------------|
| **Author:**          | Nick Willever (<nickwillever@gmail.com>) |
| **Copyright:**       | Copyright (c) 2016 Nick Willever         |
| **License:**         | Apache License, Version 2.0              |

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
