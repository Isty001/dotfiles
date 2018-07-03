#### Scroll
* Down:                 C-y
* Up:                   C-e
* Half screen up:       C-u
* Half screen down:     C-d

#### Delete
* Insert:
  * Forward word:  C-b
  * Backward word: C-w

* Normal:
  * Forward char:        x
  * Prev char:           X
  * Forward word:        dw
  * Backward word:       dvb
  * Between bracket:     di**bracket**
  * Until next **x**:    d(t/T)**x**
  * Line:                dd

#### Yank
* Current line:             yy
* Current word:             viwy
* Between ' exclusive:      yi'
* Between ' inclusive:      ya'
* Until , excl.:            yt'
* Until, incl.:             yf'

#### Select
* Inside bracket:           vi**bracket**
* Reselect last selection:  gv
* Line:                     V

#### Navigation
* Normal:
  * Go to char:                           <leader><leader>s
  * Move cursor to the middle of screen:  zz
  * Go to matching parenthesis:           %

#### Swith Case
* Normal:
  * Toggle (n) char:      (n)~
  * Toggle current word:  g~iw
  * Toggle line:          g~~

* Visual:
  * Toggle:  U

#### Git
* Current file Log: :Glog -- % 
  * Commit list:     :copen

