test: test.v ../../common/*.v ../*.vh
	iverilog -I.. -s top_tb -o test -c ../file_list.txt 
	./test

clean:
	-rm test
	-rm test.vcd
