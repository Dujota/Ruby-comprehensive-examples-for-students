pid1 = fork {sleep 2; exit 3}
pid2 = fork {sleep 1; exit 3}

pid2_again = Process.wait
pid1_and_status = Process.wait2

p pid2_again
p pid1_and_status

pid3 = fork { sleep 2; exit 3}
pid4 = fork { sleep 1; exit 3}

sleep 3
pid4_again = Process.waitpid(pid4, Process::WNOHANG)
pid3_array = Process.waitpid2(pid3, Process::WNOHANG)

p pid4_again
p pid3_array

