#!/usr/bin/bash
# Prints out the usage of the script
usage()
{
  echo 'Usage: '$0 $'[-b <path-to-repo>] [-h]\n\n'; exit 1; 
}

while getopts ":b:h:" option;
do
  case $option in
    b)
      base=${OPTARG};
      echo "Using new base of: $base";
      ;;
    h)
      usage
      ;;
    *)
      usage
      ;;
  esac
done

#----------------------------------------------

# Where all cloned repositories live.
export repos_dir_default=$HOME/repos

# Default path of where this script lives.
script_path_default=$repos_dir_default/dotfiles/arch
export script_path=${base:-$script_path_default}

# Refer to env.conf for further configuration.
# A bit of bootstrapping for environment variables at this point.
env_file_name='env.sh'
env_file=$script_path/$env_file_name

if ! [ -d "${script_path}" ];
then
  echo "Base directory $script_path not found"
  exit 1;
fi

#----------------------------------------------
if ! [ -e "${env_file}" ];
then
  echo "Env file $env_file not found"
  exit 1;
fi

echo "Loading environment variables from: $env_file"
load_env_vars="source $env_file"

source $env_file # Load in current session.

#----------------------------------------------
echo "Adding environment variables to bashrc if not present."
if ! grep -q $load_env_vars $bashrc 
then
	echo "Adding Environment Variables source to $bashrc"
	echo $'\n# Load Environment Variables' >> $bashrc
	echo $load_env_vars >> $bashrc
fi

#----------------------------------------------
#Go to the config files directory, for relative directory retrieval.
echo "Adding configs from: $config_files_directory"

if ! [ -d "${config_files_directory}" ];
then
  echo "Config files directory not found: $config_files_directory"
  exit 1;
fi

pushd $config_files_directory
config_directories=$(find $PWD -type d | awk -v CURR_DIR="$PWD" '{ if ($0 != CURR_DIR) print $0 }')
for cfg_directory in $config_directories
do
	echo $'\nFound config directory: '$cfg_directory
	for cfg_script in $cfg_directory/*.sh
	do
		echo $'Executing configuration script ' $cfg_script
		sh $cfg_script
	done
done

echo "Popping directory $config_files_directory"
popd
echo $'\n'

#----------------------------------------------
if ! [ -e "${script_path/pacman.sh}" ];
then
  echo "pacman.sh not found: $script_path/pacman.sh"
fi
sh $script_path/pacman.sh

#----------------------------------------------
if ! [ -d "${packages_files_directory}" ];
then
  echo "Packages files directory not found: $packages_files_directory"
  exit 1;
fi

#Go to the packages files directory, for relative directory retrieval.
echo "Adding packages from: $packages_files_directory"
pushd $packages_files_directory
package_directories=$(find $PWD -type d | awk -v CURR_DIR="$PWD" '{ if ($0 != CURR_DIR) print $0 }')
for pkg_directory in $package_directories
do
	echo $'\nFound package directory: '$pkg_directory
	for pkg_script in $pkg_directory/*.sh
	do
		echo $'Executing package script ' $pkg_script
		sh $pkg_script
	done
done

echo "Popping directory $package_files_directory"
popd
echo $'\n'


#----------------------------------------------

if ! [ -d "${scripts_files_directory}" ];
then
  echo "Scripts files directory not found: $scripts_files_directory"
  exit 1;
fi

#Go to the scripts files directory, for relative directory retrieval.
echo "Running scripts from: $scripts_files_directory"
pushd $scripts_files_directory
for script in $scripts_files_directory/*.sh
do
  echo $'Executing script ' $script
  sh $script
done

echo "Popping directory $scripts_files_directory"
popd


