function fish_prompt
	# main
  echo -n (set_color cyan)(prompt_pwd) (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '

  # git
  set last_status $status
  printf '%s ' (__fish_git_prompt)
  set_color normal
end
