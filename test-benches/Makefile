CC=iverilog
SYM=vvp

TESTS=acquire.vvp parse_command.vvp synchronizer.vvp task_dispatcher.vvp transmit.vvp uart.vvp reset_uart.vvp
TESTLOGS=$(TESTS:.vvp=.log)

all: $(TESTLOGS)
	ruby report.rb

acquire.vvp: ../acquire.v acquire_tb.v ../counter_syn.v
	$(CC) -o $@ $^

parse_command.vvp: ../parse_command.v parse_command_tb.v 
	$(CC) -o $@ $^

synchronizer.vvp: ../synchronizer.v synchronizer_tb.v 
	$(CC) -o $@ $^

task_dispatcher.vvp: ../task_dispatcher.v task_dispatcher_tb.v 
	$(CC) -o $@ $^

transmit.vvp: ../transmit.v transmit_tb.v ../counter_syn.v
	$(CC) -o $@ $^

uart.vvp: ../uart.v uart_tb.v 
	$(CC) -o $@ $^

reset_uart.vvp: ../reset_uart.v reset_uart_tb.v
	$(CC) -o $@ $^

%.log: %.vvp
	$(SYM) -n $*.vvp > $*.log

clean:
	rm -f *.vvp *.vcd
