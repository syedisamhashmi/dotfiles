pushd $repos_dir_default

if [ -d "./nerdtree" ];
then
  echo "Repo exists"
  pushd ./nerdtree
  git pull
  popd
  ln -s -f $repos_dir_default/nerdtree $HOME/.vim/pack/vendor/opt/nerd_tree 
  exit 1
fi

pushd $repos_dir_default

echo "Cloning NerdTree"
git clone --depth 1 https://github.com/preservim/nerdtree.git

popd

ln -s -f $repos_dir_default/nerdtree $HOME/.vim/pack/vendor/opt/nerd_tree 
