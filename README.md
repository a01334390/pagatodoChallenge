# 💰 Paga Todo - The Pagatodo Challenge App

A project consuming the
[Very very secret API](https://api.jsonbin.io/b/5ea2fa3e98b3d5375233ca89).

## Requirements

- Xcode 11.4.1
- Git 2.16.2+
- Ruby 2.4.3+
- [Cocoapods](https://cocoapods.org)

## Generating Docs

First, clone the repository by opening Terminal.app
and running the following commands:

```terminal
$ git clone git@github.com:A01334390/pagatodoChallenge.git
$ cd pagatodoChallenge
$ cd pagatodoChallenge
```

Next, download project dependencies with CocoaPods using the command:

```terminal
$ pod install
```

Use [Jazzy](https://github.com/realm/jazzy)
to generate web pages from the documentation comments of this Swift project:

```terminal
$ bundle exec jazzy -o Docs
```

Now open the `index.html` from the `Docs` directory
to view the generated documentation:

```terminal
$ open Docs/index.html
```

## License

This project is released under a Copyright (C) 2020 Fernando Martin Garcia Del Angel License 
See the LICENSE file for more info.
