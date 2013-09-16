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
  (set up as db node) 
   vagrant ssh 
   mysql -u root -ptest => access mysql prompt

 vagrant sandbox rollback
  (now db server gone)
   try same commands as above => cannot access mysql prompt

 cp nodes/web.json nodes/provision_test.json
 bin/knife solo cook provision_test
  (set up as web node)
   vagrant ssh and stop iptables
   try to access localhost:8080/manager with browser  => access tomcat manager's login dialog
   (but we don't setup tomcat user yet for security reason)
 
 vagrant sandbox rollback
  (now web server gone)
   try to access same url as above => cannot access tomcat manager's login dialog 

 vagrant sandbox off
```
