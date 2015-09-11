# Calling out to the Shell

There are a number of ways to invoke shell tasks from within Rake (and Ruby).
 * `exec my_command`
 * `success = system my_command` (success is a boolean)
 * ``` stdout = `my_command` ``` (the backtick, stdout is a string)
 * `stdout = %x{my_command}` (stdout is a string)
 * `result = sh %{my_command} {}` (result is an object, result.success? is a useful method to remember)
 * `result = sh "my_command" {}` (as above)
 * `O#popen(cmd) { |io| }` (Run a subprocess and connect stdout and stderr to io)
 * `stdin, stdout, stderr = Open3.popen3(cmd)` (Run a subprocess and connect to all pipes: in, out, err)

%x{} returns back to rake task whereas  exec and system does not (exec replace the current process with a new one, system return true or false)

The [rake preferred way](http://www.rubydoc.info/gems/rake/FileUtils#sh-instance_method) is to use the `sh` method because:
 1. it aborts if the return is != 0
 2. the command itself is echoed before the output

## Exercise

Write a simple shell-based concatenation task that will merge all the markdown files into a single long one in the data directory called `rake_book.md`. Hint: use `cat *.md` to get the shell to do the merge and a shell pipe `>` to redirect the output to a file.
