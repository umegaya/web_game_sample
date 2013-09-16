#### demo
```
 please install vagrant sahara : with http://www.ryuzee.com/contents/blog/6555
 
 bundle install --path=vendor/bundle --binstubs=bin
 bundle exec berks --path=cookbooks
 vagrant up
 vagrant ssh-config --host=provision_test >> ~/.ssh/config
 bin/knife solo prepair provision_test
 vagrant sandbox on
 cp nodes/db.json nodes/provision_test.json
 bin/knife solo cook provision_test
  (DBサーバーがセットアップされる) 
   vagrant ssh 
   mysql -u root -ptest => MySQLのプロンプトが表示

 vagrant sandbox rollback
  (インストールの取り消し)
   mysql -u root -ptest => MySQLが見つからないと言われる 

 cp nodes/web.json nodes/provision_test.json
 bin/knife solo cook provision_test
  (webサーバーがセットアップされる apache2 and tomcat)
   vagrant ssh
   sudo /sbin/service iptables stop => iptableを止めておく
   localhost:8080/managerにブラウザでアクセス => tomcatのmanager画面が表示される(がtomcat userがいないのでログイン不可)
 
 vagrant sandbox rollback
  (インストールの取り消し)
   localhost:8080/managerにブラウザでアクセス => タイムアウト

 vagrant sandbox off
```
