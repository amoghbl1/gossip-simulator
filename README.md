# Gossip Simulator

A simple java implementation of the Gossip protocol.
Messages between nodes are sent using protobuf.
Nodes are multithreaded, and are capable of handling requests parallely.

## MyServer

The MyServer script is used to actually initialize a server.
The usage is:
./MyServer <id> <nodes_in_network> [ -i <input_file> ]

IT IS RECOMMENDED TO NOT RUN THIS SCRIPT MANUALLY

## Wrapper

The Wrapper script initializes and runs all the servers based on what we give it.
The usage is:
./Wrapper -p <number_of_type_1_processes> -n <number_of_type_2_processes> -i <input_file>

### Process types
* Type 1 process is one that takes an input file and uses that to send messages (each line is considered a message), at regular intervals.
* Type 2 process is the process that has no input and just acts as a relay in the network.

Note: All Type 1 processes also have the functionality of Type 2 processes.

## Configuring the nodes

Each node has 2 default wait times defined:
* GOSSIP-READ-INPUT-TIME: The time that the process is supposed to wait between reading two lines of input.
* GOSSIP-PROCESS-TIME: The time taken to process a gossip. This is the delay done after calling the process gossip funtion.

## CLOCK

The clock used in this simulation is very simple.
The idea for the clock was to satisfy the following.
If a process gets messages out of order, they should be discarded, two messages m1 and m2 are out of order if and only the below is true:
* m1 and m2 are generated by the same process, and
* m1 is read before m2 in the file, but the process has received m2 before m1
* This means the if m1 and m2 are generated by different process, they can
never be out of order.

So the clock used is a combination of ProcessID:ProcessClock 
Look at the acceptMessage function to see how our clock comparision is done.


### Other parts of the code are expected to be documented in the code is documentation format, or inline documentation.

