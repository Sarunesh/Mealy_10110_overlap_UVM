import os
import subprocess
from time import strftime

# Create the run.do script for each testcase
def create_do_script(testname,log_file_name,ucdb_file_name):
	# Compilation
	# Optimisation
	# Elaboration
	# Coverage save
	# Run
	# Quit

	do_script_content = f"""
	vlog +incdir+D:/Sarunesh/Projects/UVM/LRM/uvm-1.2/uvm-1.2/src list.svh

	vopt work.top +cover=fcbest -o {testname}

	vsim -coverage {testname} \
	-sv_lib D:/Sarunesh/Software/Questasim_10.7/questasim64_10.7c/uvm-1.2/win64/uvm_dpi \
	+UVM_TESTNAME={testname} \
	+UVM_VERBOSITY=UVM_HIGH \
	-l {log_file_name}

	coverage save -onexit {ucdb_file_name}

	do wave.do
	do exclusion.do 
	run -all
	quit
	"""
	with open(f"{testname}_run.do","w") as file:
		file.write(do_script_content)

def run_simulation(testname):
	# Simulation is done in Questasim which supports only the ".do" files(TCL scripts)
	# So, create ".do" files for each testcase, execute and delete it

	# Create log file and ucdb file
	time_stamp = strftime("%Y_%m_%d__%H_%M_%S")
	log_file_name = f"{testname}_{time_stamp}.log"
	ucdb_file_name = f"{testname}.ucdb"

	# Create ".do" scripts
	create_do_script(testname, log_file_name, ucdb_file_name)

	# Run the created ".do" script in Questasim using subprocess
	subprocess.run(f"vsim -c -do {testname}_run.do",shell=True,check=True)

	# Check whether the UCDB file was generated
	if os.path.exists(ucdb_file_name):
		print(f"UCDB file created: {ucdb_file_name}")
	else:
		print(f"Error: UCDB file not created")

	# Remove the ".do" script
	os.remove(f"{testname}_run.do")

if __name__=="__main__":
	test_list_file="test_list.txt"
	# Checking for the test_list file
	if not os.path.exists(test_list_file):
		print(f"Error: {test_list_file} not found")
		exit(1)

	#file=open(test_list_file,"r")
	with open(f"{test_list_file}","r") as file:
		for testname in file:
			testname=testname.strip()
			if testname:
				print(f"Running test: {testname}")
				# User-defined function
				run_simulation(testname)
	#file.close()
	print("All tests completed")
