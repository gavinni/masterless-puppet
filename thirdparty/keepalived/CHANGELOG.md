#### 2016-07-11 - 1.0.5
* Reload for service by default, as restart seems to often fail with LVS.

#### 2015-04-29 - 1.0.4
* Add Debian support (#1, @nono-gdv).

#### 2015-04-28 - 1.0.3
* I need to stop trying to make puppet-lint happy.

#### 2015-04-28 - 1.0.2
* Make puppet-lint happy.

#### 2015-04-28 - 1.0.1
* Add useful keepalived::vrrp wrapper class with typical template.
* Replace Modulefile with metadata.json.

#### 2014-09-15 - 1.0.0
* Update README.
* Add package_ensure parameter, defaulting to 'installed'.
* Add 'Scientific' and 'Amazon' to params class.

#### 2014-04-01 - 0.1.5
* Add service_enable and service_ensure parameters.
* Clean up params class and the way the sysconf file is installed.

#### 2013-12-10 - 0.1.4
* Update Gentoo conf.d template for the 1.2.7 package.

#### 2013-07-18 - 0.1.3
* Fix syntax error in the test.
* Fix missing @ prefix for the conf.d template variable.

#### 2013-04-19 - 0.1.2
* Use @varname syntax in templates to silence puppet 3.2 warnings.

#### 2013-03-21 - 0.1.1
* New params.pp in order to support Gentoo.

#### 2013-03-08 - 0.1.0
* Update README and use markdown.

#### 2012-08-29 - 0.0.1
* Start cleaning up existing class.

