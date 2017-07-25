function __fish_gvm_no_command --description 'Test if gvm has yet to be given the main command'
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 ]
    return 0
  end
  return 1
end

function __fish_gvm_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 2 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

function __fish_gvm_using_subcommand
  set cmd (commandline -opc)
  set cmd_main $argv[1]
  set cmd_sub $argv[2]

  if [ (count $cmd) -gt 2 ]
    if [ $cmd_main = $cmd[2] ]; and [ $cmd_sub = $cmd[3] ]
      return 0
    end
  end
  return 1
end

function __fish_gvm_specifying_candidate
  set cmd (commandline -opc)

  if [ (count $cmd) -gt 2 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

function __fish_gvm_candidates
  cat ~/.gvm/var/candidates | tr ',' '\n'
end

function __fish_gvm_installed_versions
  set cmd (commandline -opc)
  ls -v1 ~/.gvm/$cmd[3] | grep -v current
end


# version
complete -c gvm -f -n '__fish_gvm_no_command' -a 'version' -d 'Display version'
complete -c gvm -f -n '__fish_gvm_using_command version'

# get
complete -c gvm -f -n '__fish_gvm_no_command' -a 'get' -d 'Gets the latest code (for debugging)'
complete -c gvm -f -n '__fish_gvm_using_command get'

# use
complete -c gvm -f -n '__fish_gvm_no_command' -a 'use' -d 'Use specific version'
complete -c gvm -f -n '__fish_gvm_using_command use' -a "(__fish_gvm_candidates)"
complete -c gvm -f -n '__fish_gvm_specifying_candidate use' -a "(__fish_gvm_installed_versions)"

# diff
complete -c gvm -f -n '__fish_gvm_no_command' -a 'diff' -d 'View changes in Go root'
complete -c gvm -f -n '__fish_gvm_using_command diff'

# help
complete -c gvm -f -n '__fish_gvm_no_command' -a 'help' -d 'Display usage text'
complete -c gvm -f -n '__fish_gvm_using_command help'

# help
complete -c gvm -f -n '__fish_gvm_no_command' -a 'implode' -d 'Completely remove gvm'
complete -c gvm -f -n '__fish_gvm_using_command implode'

# install
complete -c gvm -f -n '__fish_gvm_no_command' -a 'install' -d 'Install go versions'
complete -c gvm -f -n '__fish_gvm_using_command install' -a "(__fish_gvm_candidates)"

# uninstall
complete -c gvm -f -n '__fish_gvm_no_command' -a 'uninstall' -d 'Uninstall go versions'
complete -c gvm -f -n '__fish_gvm_using_command uninstall' -a "(__fish_gvm_candidates)"
complete -c gvm -f -n '__fish_gvm_specifying_candidate uninstall' -a "(__fish_gvm_installed_versions)"

# cross
complete -c gvm -f -n '__fish_gvm_no_command' -a 'cross' -d 'Install go cross compilers'
complete -c gvm -f -n '__fish_gvm_using_command cross' -a "(__fish_gvm_candidates)"

# linkthis
complete -c gvm -f -n '__fish_gvm_no_command' -a 'linkthis' -d 'Link this directory into GOPATH'
complete -c gvm -f -n '__fish_gvm_using_command linkthis'

# list
complete -c gvm -f -n '__fish_gvm_no_command' -a 'list' -d 'List versions'
complete -c gvm -f -n '__fish_gvm_using_command list' -a "(__fish_gvm_candidates)"
complete -c gvm -f -n '__fish_gvm_specifying_candidate list' -a "(__fish_gvm_installed_versions)"

# listall
complete -c gvm -f -n '__fish_gvm_no_command' -a 'listall' -d 'List available versions'
complete -c gvm -f -n '__fish_gvm_using_command listall'

# alias
complete -c gvm -f -n '__fish_gvm_no_command' -a 'alias' -d 'Manage go version aliases'
complete -c gvm -f -n '__fish_gvm_using_command alias'

# pkgset
complete -c gvm -f -n '__fish_gvm_no_command' -a 'pkgset' -d 'Manage go package sets'
complete -c gvm -f -n '__fish_gvm_using_command pkgset'

# pkgset
complete -c gvm -f -n '__fish_gvm_no_command' -a 'pkgenv' -d 'Edit the environment for a package set'
complete -c gvm -f -n '__fish_gvm_using_command pkgenv'
