# Taking Input

## Command-line Args

Tasks can be more re-usable if you can pass additional information or options to them. Run `rake --rakefile lib/tasks/input.rake putsmany['hello',4]` then check out the putsmany task to see how it works.

You can invoke a task with arguments from within other tasks. Run `rake --rakefile lib/tasks/input.rake puts5` and then check out the puts5 task to see how it works.

## Environment Variables

Often this information will vary by environment so you will want to use environment variables instead of command-line arguments. We're declaring the environment variables on the command-line here to make it simple: `MESSAGE=boo TIMES=3 rake --rakefile lib/tasks/input.rake envreader`.
