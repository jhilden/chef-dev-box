Run using

```
berks vendor cookbooks && sudo chef-client -c client.rb
```

## Bootstrapping

What needs to be done on a fresh machine before we can run our CHEF recipes:


1. Install prequisites

`sudo apt-get install ruby ruby-dev ruby-bundler git`


2. Copy ssh keys to the new machine

`ssh-add ~/.ssh/jkey`


3. Create projects folder

`mkdir ~/projects`

`cd ~/projects`


4. Clone repo

`git clone git@github.com:jhilden/chef-dev-box.git`


5. Install gems

`bundle install`


6. Copy private files and create local `node.json`
