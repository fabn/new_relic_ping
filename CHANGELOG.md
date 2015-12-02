# CHANGELOG for heartbeat_rails

This file is used to list changes made in each version of heartbeat_rails.

## 1.0.0: (2015-12-02)

* Removed unused files/modules/views etc.
* Automatically mount the engine at `heartbeat` endpoint (`status` is too common as word).
* Configurable endpoint, one can change the endpoint, append it, prepend it or disable automounting using configuration methods.
* Simplified routes, only `/heartbeat` and `/heartbeat/health` available (removed the `ping` suffix).
* Added a `newrelic_ignore` call in the `HealthController`, heartbeat checks should not be reported as newrelic transactions
  otherwise they improve your apdex with no reason to do that.
* Changed the default database check to use [default active record implementation](https://github.com/rails/rails/blob/3e36db4406beea32772b1db1e9a16cc1e8aea14c/activerecord/lib/active_record/connection_adapters/mysql2_adapter.rb#L72)
 which perform better and save some resources on busiest MySQL servers.That method is defined for each supported AR adapter.

## 0.1.2: (2014-02-03)

Features:

* Updated rails dependency to allow 4.0 (now >= 3.2)
* Now also tested on ruby 2.1

## 0.1.1: (2013-08-26)

Bugfixes:

* Fix initialization with nested hashes in configuration (unused so far)

Features:

* Removed dependency on `newrelic_rpm` gem
* Now with 100% code coverage!

## 0.1.0: (2013-01-24)

* Initial release of new\_relic\_ping

Supported features:
* ping action
* health action with configurable monitoring code blocks
* ActiveRecord database monitoring default check

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
