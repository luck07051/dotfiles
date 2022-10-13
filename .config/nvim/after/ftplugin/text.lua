-- Use md syntax highlight to read the book 'pure bash bible'
Au('BufEnter',
  { pattern = { '*manuscript/*.txt' },
    command = [[ setf markdown ]] })
