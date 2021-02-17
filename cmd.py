#Call a command from Python (Windows)

import subprocess
cmdresult = "move 123.txt 456.txt"
subprocess.call(cmdresult.split(), shell=True)
#or
#VERSATILE
cmd = 'move 456.txt 789.txt'
returncode = subprocess.Popen(cmd, shell=True)

#---------------------------------------------------
#import os
#dirname, basename = os.path.split(target)
#save_dir=os.getenv("HOMEDRIVE") + os.getenv("HOMEPATH") + "/Desktop/Archive"
#if not os.path.exists(save_dir): 
#    os.makedirs(save_dir)
#[pri(d) for d in targets]

