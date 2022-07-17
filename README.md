### Requirement
- Composer
- PHP >= 7.2
- MySQL

### Installation
On both directory (`tugas-client` and `tugas-server`):
- run `composer install`
- run `./yii init`
- set db connection on `common/config/main-local.php`
- set server url on `common/config/params.php` (for `tugas-client` only, without trailing 
slash)
- run `[project-directory]/index.php` or `[project-directory]/frontend/web/index.php` on browser
