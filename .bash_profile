[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export EDITOR='subl -w'
export BUNDLER_EDITOR="subl"

# Meta
function alias() {
  subl ~/.bash_profile
}

function commit_bash() {
  export CURRENT="$(pwd)"
  cp ~/.bash_profile ~/Desktop/personal/bash-profile/
  cd ~/Desktop/personal/bash-profile/
  git add .
  git commit
  push
  cd $CURRENT
}

function update() {
  bundle install
  yarn install
  rake db:migrate
}

function backup() {
  export BRANCH="$(git branch --show-current)"
  git branch -D backup
  git checkout -b backup
  git checkout $BRANCH
}

function cometeer() {
  cd ~/Desktop/cometeer/cometeer
  subl .
}

function elvis() {
  cd ~/Desktop/elvis
  subl .
}

function gri() {
  git rebase master -i
}

function rep(){
  for i in {1..$1}; do rspec $2; done
}

function ev() {
  vi ~/.vimrc
}

function et() {
  vi ~/.tmux.conf
}

function tmn(){
  tmux new -s $1
}

function unfail(){
  bundle exec rspec --only-failures
}

function tma(){
  tmux attach-session -t $1
}

function tmx(){
  tmux kill-session -t $1
}

function reload() {
  source ~/.bash_profile
}

function gpm() {
  export BRANCH="$(git branch --show-current)"
  git checkout master
  git pull origin master
  git checkout $BRANCH
}

function test_app() {
  cd ~/Desktop/os
  rails new test-app-$1
  cd test-app-$1
  bundle add solidus
  gem uninstall solidus_paypal_commerce_platform
  gem uninstall solidus_auth_devise
  bundle install
  bin/rails g solidus:install
}

function testme() {
  bundle exec rubocop -ESP
  bin/rake
}

function lintme() {
  bin/rake lint:html
  bin/rails lint:brakeman
  rubocop
  npm run lint-scss
  npm run lint-js
}

function rebase() {
  git stash
  gpm
  git stash pop
  commit
  git rebase master
}

function commit(){
  gpm
  git commit -a
}

function push(){
  export BRANCH="$(git branch --show-current)"
  git push $1 $BRANCH --force
}

function pcp() {
  cd ~/Desktop/nebulab/solidus_paypal_commerce_platform
  subl .
}

function testing(){
  cd ~/Desktop/nebulab/testing
  subl .
}

function prod(){
  rake dev:db:dump_and_import
}

function push_soft(){
  export BRANCH="$(git branch --show-current)"
  git push $1 $BRANCH
}
