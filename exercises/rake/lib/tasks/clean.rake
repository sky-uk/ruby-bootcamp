require 'rake/clean'

# the clean task removes everything in the clean list
CLEAN.include('./data/*.tmp')

# clobber removes everything in both clean and clobber lists
CLOBBER.include('./data/*.*')
