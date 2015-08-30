CREATE DATABASE IF NOT EXISTS app;
GRANT ALL ON `app`.* to 'app'@'%' identified by 'password';
FLUSH PRIVILEGES;
