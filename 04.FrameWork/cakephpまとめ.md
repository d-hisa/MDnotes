# Cakephp
## Premise
+ Installed packages following list
	* mysql
	* PHP
	* Apache
	* wget

## Implementation environment
|Package|Version|Dependent / Relation Packages|Remarks|
|:---|:---:|:---|:---|
|PHP|5.4.16-36.1.el7_2.1|php.x86_64<br>php-cli.x86_64<br>php-common.x86_64<br>php-mysql.x86_6<br>php-pdo.x86_64|php-mysql is installed by<br> `yum install php-mysql`|
|mysql|5.7.13-1.el7|mysql-community-client.x86_64<br>mysql-community-common.x86_64<br>mysql-community-libs.x86_64<br>mysql-community-libs-compat.x86_64<br>mysql-community-server.x86_64|-|
|Cakephp|2.8.5|-|-|

## Installation
### Set up Cakephp
1. Execute wget command for downloading cakephp.
```bash
$ wget -e HTTPS_PROXY=http://172.20.253.21:8080 https://github.com/cakephp/cakephp/archive/2.8.5.zip
```
	+ -e option : set temporaly proxy settings
	+ ver.2.8.5 is latest release on cakephp 2.x
1. Replace to Apache DocumentRoot, unzip and rename DLed file
```bash
$ sudo mv 2.8.5.zip /var/www/2.8.5.zip
$ cd /var/www
$ sudo unzip 2.8.5.zip
$ sudo rm -f 2.8.5.zip
$ sudo mv cakephp-2.8.5 cakephp
```

1. Chage Owner
Change owner of directory "Cakephp" to Apache.
```bash
$ sudo chown -R apache:apache /var/www/cakephp/
```
	+ chown command: Chage owner of file or directory
	+ -R option : change recursive
1. Change Seed Paramas
```bash
$ sudo vim /var/www/cakephp/app/Config/core.php
```
Search   `Configure::write('Security.salt,'DEFAULT_RANDOM_PARAM1')`and  
`Configure::write('Security.cipherSeed','DEFAULT_RANDOM_PARAM2')`,  
and change DEFAULT_RANDOM_PARAMs to following.
	+ `DEFAULT_RANDOM_PARAM1`:Capital and small Alphabet and Number, Digits = 40
	+ `DEFAULT_RANDOM_PARAM2`:Number, Digits = 35
	+ Recommend For Generate Random Seed ->
[Random Pass Gen page](http://tomari.org/main/java/password.html)
1. Create Database for sample
To set cakephp, create databes for cakephp samples.
```SQL
mysql> create databe cakephp_sample;
```
1. Change database used by cakephp
```bash
$ cd /var/www/cakephp/app/Config/
$ sudo cp database.php.default database.php
$ sudo vim database.php
```
+ Delete `public $test = array(~);`
+ Change `public $default = array(~);` to following list
```PHP
public $default = array(
    'datasource' => 'Database/Mysql',
    'persistent' => false,
    'host' => 'localhost',
    'login' => 'root',	// Your Login UserName Mysql
    'password' => 'root,	// Your Login Password Mysql
    'database' => 'cakephp_dev',	//Using database Name
    'prefix' => '',
    'encoding' => 'utf8',
);
```
1. Setting Apache
```bash
$ sudo /etc/httpd/conf.httpd.conf
```
##### Chage DocumentRoot  
Search `DocumentRoot` and change  
`DocumentRoot "/var/www/html"` to `DocumentRoot "/var/www/cakephp"`
##### Permit .htaccess
Insert Last row.  
```bash
<Directory "/var/www/cakephp/">
	Options FollowSymLinks
	AllowOverride All
</Directory>
```
1. Setting TimeZone on php
```bash
$ sudo vim /etc/php.ini
```
Change `date.timezone=` to `date.timezone = Asia/Tokyo`
1. Restart Apache
```bash
$ sudo systemctl restart httpd
```


## References
+ [CentOS6.5にcakephp2.5.6をインストールする | joppot](https://joppot.info/2014/12/21/2253)
+ [【PHP】PHPをインストールしたらやっておきたい設定 - Qiita](http://qiita.com/knife0125/items/0e1af52255e9879f9332)
