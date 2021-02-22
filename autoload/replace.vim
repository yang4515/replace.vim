function! replace#do()
  let to = getreg('0')

  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  let from = join(lines, "\n")

  exe ':%s/'.from.'/'.to.'/g'
endfunction
