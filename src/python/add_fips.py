from tempfile import mkstemp
from shutil import move
from os import fdopen, remove
import re, sys

fh, abs_path = mkstemp()
file_path = sys.argv[1]
pattern = r"^([^,]+),([^,]+),([^,]+)"

with fdopen(fh,'w') as new_file:
    with open(file_path) as old_file:
        new_file.write("fips,"+old_file.readline())
        for line in old_file:
            m = re.search(pattern, line)
            gr1, gr2, gr3 = m.groups()
            new_file.write(line.replace(m.group(0), f"{int(gr1):02}{int(gr2):03}{int(gr3):06},{gr1},{gr2},{gr3}"))
remove(file_path)
move(abs_path, file_path)
        
    
